package com.kh.search.service;

import java.sql.Connection;
import java.util.List;

import com.kh.common.PageVo;
import com.kh.search.repository.SearchDao;
import com.kh.trade.vo.TradeVo;

import static com.kh.common.JDBCTemplate.*;

public class SearchService {

	public List<TradeVo> searchToKeywords(String keywords, PageVo pageVo) {

		Connection conn = getConnection();
		
		List<TradeVo> list = new SearchDao().searchToKeyword(conn, keywords, pageVo);
		
		close(conn);
		
		return list;
	
	}

	public List<TradeVo> searchToCategory(String category, PageVo pageVo) {

		Connection conn = getConnection();
		
		List<TradeVo> list = new SearchDao().searchToCategory(conn, category, pageVo);
		
		close(conn);
		
		return list;
	
	}

}
