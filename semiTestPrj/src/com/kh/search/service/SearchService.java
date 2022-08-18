package com.kh.search.service;

import java.sql.Connection;
import java.util.List;

import com.kh.search.controller.BoardVo;
import com.kh.search.dao.SearchDao;

import static com.kh.common.JDBCTemplate.*;

public class SearchService {

	public List<TradeVo> searchToKeywords(String[] keywords) {

		Connection conn = getConnection();
		
		List<TradeVo> list = new SearchDao().searchToKeyword(conn, keywords);
		
		close(conn);
		
		return list;
	
	}

}
