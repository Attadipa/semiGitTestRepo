package com.kh.wishlist.dao;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.common.PageVo;
import com.kh.trade.vo.TradeVo;
import com.kh.wishlist.vo.WishVo;

public class WishlistDao {

	public int insert(Connection conn, WishVo vo) {
		int result = 0;

		//conn준비
		//sql준비
		String sql = "INSERT INTO WISHLIST(WISH_NO, MEMBER_NO, POST_NO, TITLE) VALUES(SEQ_WISH_NO.NEXTVAL, ?, ?, ?)";
		//sql객체에 담기 -> 물음표 채우기
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberNo());
			pstmt.setString(2, vo.getPostNo());
			pstmt.setString(3, vo.getTitle());
			//sql 실행 및 결과 저장
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//결과 리턴
		return result;
	}

	public int getCountForWishlist(Connection conn, String memberNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(WISH_NO) AS COUNT FROM WISHLIST WHERE MEMBER_NO = ?";
		
		try {
			//SQL을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNo);
			
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

	public List<WishVo> list(Connection conn, String memberNo, PageVo pageVo) {
		PreparedStatement pstmt = null;
		List<WishVo> list = new ArrayList<WishVo>();
		ResultSet rs = null;
		
		//sql 준비
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM (SELECT W.WISH_NO, M.MEMBER_MID, T.TITLE TITLE, W.POST_NO, TO_CHAR(W.ENROLL_DATE, 'YY/MM/DD HH:MI') ENROLL_DATE FROM WISHLIST W JOIN MEMBER M ON M.MEMBER_NO = W.MEMBER_NO JOIN TRADE T ON T.TRADE_NO = W.POST_NO WHERE W.MEMBER_NO = ? ORDER BY WISH_NO DESC) T ) WHERE RNUM BETWEEN ? AND ?";
		
	
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit() + 1;
			int end   = start + pageVo.getBoardLimit() - 1;
			
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				WishVo vo = new WishVo();
				
				vo.setWishNo(rs.getString("WISH_NO"));
				vo.setMemberNo(rs.getString("MEMBER_MID"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setPostNo(rs.getString("POST_NO"));
				vo.setEnrollDate(rs.getString("ENROLL_DATE"));
				
				System.out.println(vo.getTitle());
				
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
