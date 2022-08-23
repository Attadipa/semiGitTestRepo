package com.kh.ad.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.ad.vo.AdVo;
import com.kh.common.PageVo;

public class AdDao {

	public int insertAd(Connection conn, AdVo adVo) {
		String sql = "INSERT INTO AD (AD_NO, MEMBER_NO, TRADE_NO, PERIOD, KEYWORD1, KEYWORD2, KEYWORD3, ENROLL_DATE, DELETE_YN)\r\n"
				   + "VALUES (SEQ_AD_NO.NEXTVAL, 1, 1, 7, '신발','나이키','운동화', DEFAULT, DEFAULT);";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(adVo.getMemberNo()));
			pstmt.setInt(2, Integer.parseInt(adVo.getTradeNo()));
			pstmt.setInt(3, Integer.parseInt(adVo.getPeriod()));
			pstmt.setString(4, adVo.getKeyword1());
			pstmt.setString(5, adVo.getKeyword2());
			pstmt.setString(6, adVo.getKeyword3());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int getCount(Connection conn, String memberNo) {
		String sql = "SELECT COUNT(*) AS COUNT FROM AD WHERE MEMBER_NO = ? AND DELETE_YN = 'N'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt=conn.prepareStatement(sql);	
			
			pstmt.setInt(1, Integer.parseInt(memberNo));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}

	public List<AdVo> selectList(Connection conn, String memberNo, PageVo pageVo) {
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM (  SELECT A.AD_NO, A.TRADE_NO, T.TITLE, T.PRICE, A.PERIOD AS PERIOD, TO_CHAR(A.ENROLL_DATE,'YY/MM/DD HH24:MI:SS') AS ENROLL_DATE, A.KEYWORD1, A.KEYWORD2, A.KEYWORD3, S.AD_STATUS FROM AD A JOIN TRADE T ON A.TRADE_NO = T.TRADE_NO JOIN AD_STATUS S ON A.AD_STATUS_NO = S.AD_STATUS_NO WHERE DELETE_YN = 'N' ORDER BY AD_NO ) T ) WHERE RNUM BETWEEN ? AND ?";
		ArrayList<AdVo> list = new ArrayList<AdVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String adNo = rs.getString("AD_NO");
				String tradeNo = rs.getString("TRADE_NO");
				String title = rs.getString("TITLE");
				String price = rs.getString("PRICE");
				String period = rs.getString("PERIOD");
				String enrollDate = rs.getString("ENROLL_DATE");
				String keyword1 = rs.getString("KEYWORD1");
				String keyword2 = rs.getString("KEYWORD2");
				String keyword3 = rs.getString("KEYWORD3");
				String adStatus = rs.getString("AD_STATUS");

				AdVo advo = new AdVo();
				advo.setAdNo(adNo);
				advo.setTradeNo(tradeNo);
				advo.setTitle(title);
				advo.setPrice(price);
				advo.setPeriod(period);
				advo.setEnrollDate(enrollDate);
				advo.setKeyword1(keyword1);
				advo.setKeyword2(keyword2);
				advo.setKeyword3(keyword3);
				advo.setAdStatus(adStatus);
				
				list.add(advo);				
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}






}
