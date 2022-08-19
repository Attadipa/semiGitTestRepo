package com.kh.search.service;

import java.sql.Connection;
import java.util.List;

import com.kh.search.repository.SearchDao;
import com.kh.trade.vo.TradeVo;

import static com.kh.common.JDBCTemplate.*;

public class SearchService {

	public List<TradeVo> searchToKeywords(String keywords) {

		Connection conn = getConnection();
		
		List<TradeVo> list = new SearchDao().searchToKeyword(conn, keywords);
		
		close(conn);
		
		return list;
	
	}

}
