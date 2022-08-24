package com.kh.cs.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.cs.vo.ChatVo;
import com.kh.member.vo.MemberVo;

public class ChatDao {

	public List<ChatVo> selectList(Connection conn, String num) {
		
		String sql = "SELECT MEMBER_GRADE, CONTENT, TO_CHAR(CHAT_DATE, 'YY/MM/DD HH24:MI') AS CHAT_DATE FROM CHAT WHERE MEMBER_NO=? ORDER BY NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ChatVo> list = new ArrayList<ChatVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String grade = rs.getString("MEMBER_GRADE");
				String content = rs.getString("CONTENT");
				String chatDate = rs.getString("CHAT_DATE");
				
				ChatVo vo = new ChatVo();
				vo.setGrade(grade);
				vo.setContent(content);
				vo.setChatDate(chatDate);
				
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

	public int insert(Connection conn, ChatVo vo) {

		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CHAT(NO, MEMBER_NO, MEMBER_GRADE, CONTENT) VALUES(SEQ_CHAT_NO.NEXTVAL, ?, ?, ?)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNo());
			pstmt.setString(2, vo.getGrade());
			pstmt.setString(3, vo.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<ChatVo> showList(Connection conn) {
		
		String sql = "SELECT MEMBER_NO, CONTENT, MEMBER_NAME FROM ( SELECT C.MEMBER_NO, C.CONTENT, M.MEMBER_NAME, ROW_NUMBER() OVER (PARTITION BY MEMBER_NAME ORDER BY C.NO DESC) AS RECENT_NO FROM CHAT C JOIN MEMBER M ON C.MEMBER_NO = M.MEMBER_NO ) WHERE RECENT_NO = 1 ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ChatVo> list = new ArrayList<ChatVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("MEMBER_NO");
				String content = rs.getString("CONTENT");
				String name = rs.getString("MEMBER_NAME");
				
				ChatVo vo = new ChatVo();
				vo.setMemberNo(no);
				vo.setContent(content);
				vo.setMemberName(name);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

}
