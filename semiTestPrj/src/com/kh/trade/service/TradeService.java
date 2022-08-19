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

	

}
