package com.kh.comment.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.comment.vo.CommentVo;
import com.kh.common.JDBCTemplate;

public class CommentDao {

	public int insert(Connection conn, CommentVo cvo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO COMMENTS(NO, POST_NO, MEMBER_NO, CONTENT) VALUES (SEQ_COMMENTS_NO.NEXTVAL, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cvo.getPostNo());
			pstmt.setString(1, cvo.getMemberNo());
			pstmt.setString(1, cvo.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	

}
