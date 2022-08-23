package com.kh.cs.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.cs.repository.ChatDao;
import com.kh.cs.vo.ChatVo;

public class ChatService {
	
	private final ChatDao dao = new ChatDao();

	public List<ChatVo> selectList(String num) {
		
		Connection conn = null;
		List<ChatVo> list = null;
		
		try {
			conn = getConnection();
			list = dao.selectList(conn, num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return list;
		
	}
	
	

}
