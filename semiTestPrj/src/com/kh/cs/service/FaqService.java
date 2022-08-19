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

}
