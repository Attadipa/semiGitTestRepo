package com.kh.comment.service;

import java.sql.Connection;

import com.kh.comment.repository.CommentDao;
import com.kh.comment.vo.CommentVo;
import com.kh.common.JDBCTemplate;

public class CommentService {

	public int insert(CommentVo cvo) {
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = JDBCTemplate.getConnection();
			
			result = new CommentDao().insert(conn, cvo);
			
			if(result == 1) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			
		} catch (Exception e) {
			JDBCTemplate.rollback(conn);
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
		
	}

}
