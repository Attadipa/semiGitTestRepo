package com.kh.trade.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.trade.repository.TradeDao;
import com.kh.trade.vo.TradeVo;

public class TradeService {
	
	private final TradeDao dao = new TradeDao();

	public List<TradeVo> selectList() {
		
		Connection conn = null;
		List<TradeVo> voList = null;
		
		
		conn = getConnection();
		voList = dao.selectList(conn);
		
		close(conn);
		
		return voList;
	}

}
