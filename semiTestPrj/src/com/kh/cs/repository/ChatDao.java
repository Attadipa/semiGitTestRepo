package com.kh.cs.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.cs.vo.ChatVo;

public class ChatDao {

	public List<ChatVo> selectList(Connection conn, String num) {
		
		String sql = "SELECT MEMBER_GRADE, CONTENT, CHAT_DATE FROM CHAT WHERE MEMBER_NO=? ORDER BY NO";
		
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

}
