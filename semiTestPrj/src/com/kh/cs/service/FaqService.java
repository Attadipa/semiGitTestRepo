package com.kh.cs.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.cs.repository.FaqDao;
import com.kh.cs.vo.FaqVo;

public class FaqService {
	
	private final FaqDao dao = new FaqDao();

	public List<FaqVo> searchList(String searchContent) {
		
		Connection conn = null;
		List<FaqVo> voList = null;
		
		try {
			conn = getConnection();
			voList = dao.searchList(conn, searchContent);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return voList;
	}

	public List<FaqVo> typeList(String type) {
		
		Connection conn = null;
		List<FaqVo> voList = null;
		
		conn = getConnection();
		
		voList = dao.typeList(type, conn);
		
		close(conn);
		
		return voList;
	}

	public FaqVo selectOne(String num) {

		Connection conn = null;
		FaqVo vo = null;
		
		try {
			conn = getConnection();
			
			vo = new FaqDao().selectOne(conn, num);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return vo;
	}

	public int edit(FaqVo vo) {
		
		Connection conn = null;
		
		conn = getConnection();
		
		int result = dao.edit(conn, vo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}

	public List<FaqVo> selectTen() {
		
		Connection conn = null;
		List<FaqVo> voList = null;
		
		conn = getConnection();
		
		voList = dao.selectTen(conn);
		
		close(conn);
		
		return voList;
	}

	public int delete(String num) {
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			result = new FaqDao().delete(conn, num);
			
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
		
		return result;
	}

	public int insert(FaqVo vo) {
		
Connection conn = null;
		
		conn = getConnection();
		
		int result = dao.insert(conn, vo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

}
