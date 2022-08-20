package com.kh.trade.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.trade.vo.TradeVo;

public class TradeDao {

	public List<TradeVo> selectList(Connection conn) {
		
		//conn 가져오기
		
		
		PreparedStatement pstmt = null;
		List<TradeVo> voList = new ArrayList<TradeVo>();
		ResultSet rs = null;
		
		//sql 준비
		String sql = "SELECT T.NO, T.TITLE, M.MEMBER_NAME AS WRITER, TO_CHAR(T.ENROLL_DATE, 'YY/MM/DD') AS ENROLL_DATE FROM TRADE T JOIN MEMBER M ON T.WRITER = M.MEMBER_NO WHERE T.STATUS = 'N' ORDER BY T.NO DESC";
		
	
			try {
				//sql 담을 객체 준비 및 쿼리 채우기
				pstmt = conn.prepareStatement(sql);
				
				
				//sql 실행 및 결과 저장
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					String no = rs.getString("NO");
					String title = rs.getString("TITLE");
					String writer = rs.getString("WRITER");
					String enrollDate = rs.getString("ENROLL_DATE");
					
					TradeVo vo = new TradeVo();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setWriter(writer);
					vo.setEnrollDate(enrollDate);
					
					voList.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
	
			//결과 리턴
			return voList;
	
	}

	public int insert(Connection conn, TradeVo vo) {
		
		//conn 준비
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		//sql 준비
		String sql = "INSERT INTO TRADE(NO, WRITER, TITLE, REF_CATEGORY_NO, LOCATION, CONDITION, EXCHANGE, SHIP, PRICE, EXPLAIN, COUNT) VALUES (SEQ_TRADE_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
		try {
			//sql 담을 객체 준비 및 쿼리 채우기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getRefCategoryNo());
			pstmt.setString(4, vo.getLocation());
			pstmt.setString(5, vo.getCondition());
			pstmt.setString(6, vo.getExchange());
			pstmt.setString(7, vo.getShip());
			pstmt.setString(8, vo.getPrice());
			pstmt.setString(9, vo.getExplain());
			pstmt.setString(10, vo.getCount());
			
			
			//sql 실행 및 결과 저장
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		
			//실행 결과 리턴
		System.out.println(result);
			return result;
	}

	public int getCountForSearch(Connection conn, String keywords) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(NO) AS COUNT FROM TRADE WHERE STATUS = 'N' AND " + keywords;
		
		try {
			//SQL을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//실행결과 -> 자바 데이터
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}
}
