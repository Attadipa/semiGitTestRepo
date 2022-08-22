package com.kh.search.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static com.kh.common.JDBCTemplate.*;

import com.kh.common.PageVo;
import com.kh.trade.vo.TradeVo;

public class SearchDao {

	public List<TradeVo> searchToKeyword(Connection conn, String keywords, PageVo pageVo) {

		ResultSet rs = null;
		List<TradeVo> list = new ArrayList<TradeVo>();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM (SELECT T.TRADE_NO, M.MEMBER_MID WRITER, T.TITLE, TO_CHAR(T.ENROLL_DATE, 'YY/MM/DD HH:MI') ENROLL_DATE FROM TRADE T JOIN MEMBER M ON T.WRITER = M.MEMBER_NO WHERE "+ keywords.trim() +" ORDER BY TRADE_NO DESC) T ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit() + 1;
			int end   = start + pageVo.getBoardLimit() - 1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TradeVo vo = new TradeVo();
				
				vo.setTradeNo(rs.getString("TRADE_NO"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setEnrollDate(rs.getString("ENROLL_DATE"));
				
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

	public List<TradeVo> searchToCategory(Connection conn, String category, PageVo pageVo) {
		ResultSet rs = null;
		List<TradeVo> list = new ArrayList<TradeVo>();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM (SELECT T.TRADE_NO, M.MEMBER_MID WRITER, T.TITLE, TO_CHAR(T.ENROLL_DATE, 'YY/MM/DD HH:MI') ENROLL_DATE FROM TRADE T JOIN MEMBER M ON T.WRITER = M.MEMBER_NO WHERE REF_CATEGORY_NO = ? ORDER BY TRADE_NO DESC) T ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit() + 1;
			int end   = start + pageVo.getBoardLimit() - 1;
			
			pstmt.setString(1, category);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TradeVo vo = new TradeVo();
				
				vo.setTradeNo(rs.getString("TRADE_NO"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setEnrollDate(rs.getString("ENROLL_DATE"));
				
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
