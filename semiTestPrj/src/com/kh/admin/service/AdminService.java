package com.kh.admin.service;

import java.sql.Connection;
import java.util.List;
import java.util.UUID;

import static com.kh.common.JDBCTemplate.*;
import com.kh.admin.repository.AdminDao;
import com.kh.admin.vo.EventVo;
import com.kh.attachment.vo.AttachmentVo;
import com.kh.cs.vo.ChatVo;
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

	public String createChangeName(String originName) {
		
		//확장자 가져오기
		int dotIdx = originName.lastIndexOf(".");
		String ext = originName.substring(dotIdx);
		
		//파일 이름 만들기
		long noew = System.currentTimeMillis();
		String random = UUID.randomUUID().toString();
		random = random.substring(0, 8);
		
		String changeName = "EVENT_" + noew + "_" + random + ext;
		
		return changeName;
	}

	
	public int insertEvent(EventVo evo, AttachmentVo avo) {
		
		Connection conn = null;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//DAO 호출
		int result1 = dao.insertBoard(conn, evo);
		
		int result2 = 1;
		if(avo != null) {
			result2 = dao.insertAttachment(conn, avo);			
		}
		
		//트랜잭션 처리
		if(result1 * result2 == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public List<EventVo> showList() {
		
		Connection conn = null;
		List<EventVo> list = null;
		
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

	public int getCount() {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			//DAO 호출
			result = dao.getCount(conn);	//select count 쿼리			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
	}

}
