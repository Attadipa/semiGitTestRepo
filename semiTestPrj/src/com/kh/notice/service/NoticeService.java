package com.kh.notice.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.notice.repository.NoticeDao;
import com.kh.notice.vo.NoticeVo;

public class NoticeService {
	
	private final NoticeDao dao = new NoticeDao();

	//공지사항 리스트 조회하기
	public ArrayList<NoticeVo> selectList() {
		
		Connection conn = null;
		ArrayList<NoticeVo> voList = null;
		
		//서비스 로직 작성 ㄴㄴ
		
		
		try {
			//dao 호출하기
			conn = getConnection();
			voList = dao.selectList(conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//트랜잭션 처리
			close(conn);
		}
		
		//실행결과 리턴
		return voList;
	}

	
	
	//공지사항 작성하기
	public int insert(NoticeVo vo) {
		
		Connection conn = null;
		int result = 0;
		
		//서비스 로직 작성하기
		if(vo.getTitle().length() > 30) {
			System.out.println("제목이 30글자를 초과하였습니다.");
			return -1;
		}
		
		if(vo.getContent().length() > 500) {
			System.out.println("내용이 500글자를 초과하였습니다.");
			return -2;
		}
		
		try {
			//dao 호출하기
			conn = getConnection();
			result = dao.insert(conn, vo);
			
			//트랜잭션 처리
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		//결과 리턴
		return result;
	}


	//공지사항 조회수 증가
	public int increseNotice(String num) {
		
		//서비스 로직 작성
		
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			// dao 호출
			result = dao.increseNotice(conn, num);
			
			// 트랜잭션 처리
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
				
		// 결과 리턴
		return result;
	}


	//공지사항 상세조회 하기
	public NoticeVo selectOne(String num) {
		
		Connection conn = null;
		NoticeVo vo = null;
		
		try {
			//dao 호출하기
			conn = getConnection();
			vo = dao.selectOne(conn, num);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return vo;
	}



	//공지사항 삭제하기
	public int delete(String num) {
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			result = dao.delete(conn, num);
			
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
		
		return result;
	}



	//공지사항 수정하기
	public int edit(NoticeVo vo) {
		
		
		if(vo.getTitle().length() > 30) {
			System.out.println("제목이 30글자를 초과하였습니다.");
			return -1;
		}
		
		if(vo.getContent().length() > 500) {
			System.out.println("내용이 500글자를 초과하였습니다.");
			return -2;
		}
		
		
		Connection conn = null;
		int result = 0;
		
	
		try {
			conn = getConnection();
			
			result = dao.edit(conn, vo);
			
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
		
		return result;
	}

}
