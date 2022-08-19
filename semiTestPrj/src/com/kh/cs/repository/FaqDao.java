package com.kh.cs.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.cs.vo.FaqVo;

public class FaqDao {

	public List<FaqVo> searchList(Connection conn, String searchContent) {
		
		//SQL 준비
		String sql = "SELECT FAQ_NO, TITLE, CONTENT, FAQ_TYPE FROM FAQ WHERE TITLE LIKE CONCAT(CONCAT('%', ?), '%') OR CONTENT LIKE CONCAT(CONCAT('%', ?), '%') ORDER BY FAQ_NO";
		
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
		
		String sql = "SELECT FAQ_NO, TITLE, CONTENT, FAQ_TYPE FROM FAQ WHERE FAQ_TYPE = ? ORDER BY FAQ_NO";
		
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

}
