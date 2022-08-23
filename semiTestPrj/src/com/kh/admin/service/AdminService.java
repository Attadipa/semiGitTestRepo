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

	public MemberVo selectOne(String num) {
		
		Connection conn = null;
		MemberVo vo = null;
				
		try {
			conn = getConnection();
			
			vo = dao.selectOne(conn, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return vo;
	}

	public int editMember(MemberVo vo) {
				
		Connection conn = getConnection();
		
		int result = dao.edit(conn, vo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteMember(String num) {
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			result = new AdminDao().deleteMember(conn, num);
			
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}

	public int returnMember(String num) {
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			result = new AdminDao().returnMember(conn, num);
			
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}

}
