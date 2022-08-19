package com.kh.search.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static com.kh.common.JDBCTemplate.*;
import com.kh.trade.vo.TradeVo;

public class SearchDao {

	public List<TradeVo> searchToKeyword(Connection conn, String keywords) {

		ResultSet rs = null;
		List<TradeVo> list = new ArrayList<TradeVo>();
		PreparedStatement pstmt = null;
		TradeVo vo = new TradeVo();
		
		String sql = "SELECT * FROM TRADE WHERE " + keywords;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			while(rs.next()) {
				
//				vo.setTitle(rs.getString("TITLE"));
//				vo.set어쩌구(rs.getString("~~~~"));
//				rs.getString("~~~~");
//				rs.getString("~~~~");
//				rs.getString("~~~~");
				
				list.add(vo);
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	
	}

	
	
}
