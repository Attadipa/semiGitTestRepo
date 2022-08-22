package com.kh.trade.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.PageVo;
import com.kh.trade.repository.TradeDao;
import com.kh.trade.vo.TradeVo;

public class TradeService {
	
	private final TradeDao dao = new TradeDao();

	public List<TradeVo> selectMyList(String myNo, PageVo pageVo) {
		
		Connection conn = null;
		List<TradeVo> voList = null;
		
		
		conn = getConnection();
		voList = dao.selectMyList(conn, myNo, pageVo);
		
		close(conn);
		
		return voList;
	}

	public int insert(TradeVo vo) {
		
		Connection conn = null;
		int result = 0;
		
		//비지니스 로직
		if(vo.getTitle().length() > 30) {
			System.out.println("제목이 30글자를 초과하였습니다");
			return -1;
		}
		
		if(vo.getExplain().length() > 500) {
			System.out.println("내용이 500글자를 초과하였습니다");
			return -2;
		}
		
		try {
			conn = getConnection();
			result = dao.insert(conn, vo);
			
			if(result == 1) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
			
		} finally {
			close(conn);
		}
		
//		System.out.println(result);
		return result;
	}

	//검색 키워드를 통한 페이지조회를 위한 cnt
	public int getCountForSearch(String keywords) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = getConnection();
			result = dao.getCountForSearch(conn, keywords);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		
		return result;
	}
	
	//카테고리를 통한 list 조회를 위한 cnt
	public int getCountForCategory(String category) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = getConnection();
			result = dao.getCountForCategory(conn, category);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		
		return result;
	}

	//조회수 코드
	public int increaseTrade(String num) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = getConnection();
			//(sql 실행)DAO호출
			result = dao.increaseTrade(conn, num);
			
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch(Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}
	
	public TradeVo selectOne(String num) {
		TradeVo result = null;
		Connection conn = null;
		
		try{
			conn = getConnection();
			//dao 호출
			result = dao.selectOne(conn, num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}

		return result;
	}

	//나의 게시글 총 개수 조회
	public int getCountForMy(String myNo) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = getConnection();
			result = dao.getCountForMy(conn, myNo);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		
		return result;
	}



	

}
