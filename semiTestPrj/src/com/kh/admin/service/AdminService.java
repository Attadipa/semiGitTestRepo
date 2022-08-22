package com.kh.admin.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.admin.repository.AdminDao;
import com.kh.member.vo.MemberVo;

public class AdminService {
	
	private final AdminDao dao = new AdminDao();

	public List<MemberVo> searchList(String searchData) {
		
		Connection conn = null;
		List<MemberVo> voList = null;
		
		try {
			conn = getConnection();
			voList = dao.searchList(conn, searchData);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return voList;
	}

}
