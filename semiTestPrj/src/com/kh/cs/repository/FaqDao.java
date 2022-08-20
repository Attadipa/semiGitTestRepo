package com.kh.cs.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.kh.common.JDBCTemplate.*;
import com.kh.cs.vo.FaqVo;

public class FaqDao {

	public List<FaqVo> searchList(Connection conn, String searchContent) {
		
		//SQL 준비
		String sql = "SELECT FAQ_NO, TITLE, CONTENT, FAQ_TYPE FROM FAQ WHERE TITLE LIKE CONCAT(CONCAT('%', ?), '%') OR CONTENT LIKE CONCAT(CONCAT('%', ?), '%') AND STATUS = 'N' ORDER BY FAQ_NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FaqVo> list = new ArrayList<FaqVo>();
		
		try {
			//SQL 객체에 담기 및 완성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchContent);
			pstmt.setString(2, searchContent);
			
			//SQL 실행
			rs = pstmt.executeQuery();
			
			//결과 변환 // ResultSet -> 자바객체(FaqVo)
			while(rs.next()) {
				String faqNo = rs.getString("FAQ_NO");
				String title =  rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String faqType = rs.getString("FAQ_TYPE");
				
				FaqVo vo = new FaqVo();
				vo.setNo(faqNo);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setFaqType(faqType);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		//결과 리턴
		return list;
	}

	public List<FaqVo> typeList(String type, Connection conn) {
		
		String sql = "SELECT FAQ_NO, TITLE, CONTENT, FAQ_TYPE FROM FAQ WHERE FAQ_TYPE = ? AND STATUS = 'N' ORDER BY FAQ_NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FaqVo> voList = new ArrayList<FaqVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, type);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String faqNo = rs.getString("FAQ_NO");
				String title =  rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String faqType = rs.getString("FAQ_TYPE");
				
				FaqVo vo = new FaqVo();
				vo.setNo(faqNo);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setFaqType(faqType);
				
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return voList;
	}

	public FaqVo selectOne(Connection conn, String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FaqVo vo = null;
		
		String sql = "SELECT FAQ_NO, TITLE, FAQ_TYPE, ENROLL_DATE, CONTENT FROM FAQ WHERE FAQ_NO = ? AND STATUS = 'N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String no = rs.getString("FAQ_NO");
				String title = rs.getString("TITLE");
				String faqType = rs.getString("FAQ_TYPE");
				String enrollDate = rs.getString("ENROLL_DATE");
				String content = rs.getString("CONTENT");
				
				vo = new FaqVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setFaqType(faqType);
				vo.setEnrollDate(enrollDate);
				vo.setContent(content);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return vo;
	}

	public int edit(Connection conn, FaqVo vo) {
		
		PreparedStatement pstmt = null;
		String sql = "UPDATE FAQ SET FAQ_TYPE=?, TITLE=?, CONTENT=?, MODIFY_DATE=SYSDATE WHERE FAQ_NO=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getFaqType());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<FaqVo> selectTen(Connection conn) {
		
		String sql = "SELECT FAQ_NO, TITLE FROM FAQ WHERE FAQ_NO <= 10 AND STATUS = 'N' ORDER BY FAQ_NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FaqVo> voList = new ArrayList<FaqVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = String.format("%02d", rs.getInt("FAQ_NO"));
				String title =  rs.getString("TITLE");
				
				FaqVo vo = new FaqVo();
				vo.setNo(no);
				vo.setTitle(title);
				
				voList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return voList;
	}

	public int delete(Connection conn, String num) {
		
		String sql = "UPDATE FAQ SET STATUS = 'Y' WHERE FAQ_NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insert(Connection conn, FaqVo vo) {
		
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FAQ(FAQ_NO, TITLE, CONTENT, FAQ_TYPE) VALUES(SEQ_FAQ_NO.NEXTVAL, ?, ?, ?)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getFaqType());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
