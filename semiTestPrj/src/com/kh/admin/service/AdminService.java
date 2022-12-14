package com.kh.admin.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.UUID;

import com.kh.admin.repository.AdminDao;
import com.kh.admin.vo.EventVo;
import com.kh.attachment.vo.AttachmentVo;
import com.kh.common.PageVo;
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
		
		//????????? ????????????
		int dotIdx = originName.lastIndexOf(".");
		String ext = originName.substring(dotIdx);
		
		//?????? ?????? ?????????
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
		
		//DAO ??????
		int result1 = dao.insertBoard(conn, evo);
		
		int result2 = 1;
		if(avo != null) {
			result2 = dao.insertAttachment(conn, avo);			
		}
		
		//???????????? ??????
		if(result1 * result2 == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public List<EventVo> showList(PageVo pageVo) {
		
		Connection conn = null;
		List<EventVo> list = null;
		
		try {
			conn = getConnection();
			list = dao.showList(conn, pageVo);			
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
			//DAO ??????
			result = dao.getCount(conn);	//select count ??????			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
	}

	public EventVo selectEvent(String num) {
		
		EventVo evo = null;
		Connection conn = null;
		
		try {
			conn = getConnection();
			
			evo = dao.selectEvent(conn, num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return evo;
	}

	public AttachmentVo selectAtmt(String num) {
		AttachmentVo result = null;
		Connection conn = null;
		
		try{
			conn = getConnection();
			//dao ??????
			result = dao.selectAtmt(conn, num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}

		return result;
	}

	public int editEvent(EventVo evo) {
		Connection conn = getConnection();
		int result = 0;
		
		//DAO ??????
		result = dao.editEvent(conn, evo);
		
		if(result  == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int delete(String num) {
		Connection conn = getConnection();
		int result = 0;
		
		//DAO ??????
		result = dao.delete(conn, num);
		
		if(result  == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
