package com.kh.cs.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.cs.repository.ChatDao;
import com.kh.cs.vo.ChatVo;
import com.kh.member.vo.MemberVo;

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

	public int insert(ChatVo vo) {
		
		Connection conn = null;
		
		conn = getConnection();
		
		int result = dao.insert(conn, vo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public List<ChatVo> showList() {
		
		Connection conn = null;
		List<ChatVo> list = null;
		
		try {
			conn = getConnection();
			list = dao.showList(conn);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return list;
	}
	
	

}
