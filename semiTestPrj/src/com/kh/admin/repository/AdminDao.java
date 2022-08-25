package com.kh.admin.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.vo.EventVo;
import com.kh.attachment.vo.AttachmentVo;
import com.kh.common.PageVo;
import com.kh.member.vo.MemberVo;

public class AdminDao {

	public List<MemberVo> searchList(Connection conn, String searchData) {
		
		String sql = "SELECT MEMBER_NO, MEMBER_NAME, MEMBER_MID, STATUS FROM MEMBER WHERE MEMBER_NAME LIKE CONCAT(CONCAT('%', ?), '%') OR MEMBER_MID LIKE CONCAT(CONCAT('%', ?), '%') ORDER BY MEMBER_NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVo> list = new ArrayList<MemberVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("MEMBER_NO");
				String name = rs.getString("MEMBER_NAME");
				String id = rs.getString("MEMBER_MID");
				String status = rs.getString("STATUS");
				
				MemberVo vo = new MemberVo();
				vo.setMemberNo(no);
				vo.setMemberName(name);
				vo.setMemberMid(id);
				vo.setStatus(status);
				
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

	public MemberVo selectOne(Connection conn, String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		String sql = "SELECT MEMBER_MID, MEMBER_NAME, MEMBER_PWD, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS, MEMBER_ZIPCODE, MEMBER_GRADE FROM MEMBER WHERE MEMBER_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String mId = rs.getString("MEMBER_MID");
				String name = rs.getString("MEMBER_NAME");
				String pwd = rs.getString("MEMBER_PWD");
				String phone = rs.getString("MEMBER_PHONE");
				String email = rs.getString("MEMBER_EMAIL");
				String address = rs.getString("MEMBER_ADDRESS");
				String zipCode = rs.getString("MEMBER_ZIPCODE");
				String grade = rs.getString("MEMBER_GRADE");
				
				vo = new MemberVo();
				vo.setMemberNo(num);
				vo.setMemberMid(mId);
				vo.setMemberName(name);
				vo.setMemberPwd(pwd);
				vo.setMemberPhone(phone);
				vo.setMemberEmail(email);
				vo.setMemberAddress(address);
				vo.setMemberZipcode(zipCode);
				vo.setMemberGrade(grade);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return vo;
	}

	public int edit(Connection conn, MemberVo vo) {
		
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET MEMBER_MID=?, MEMBER_NAME=?, MEMBER_PWD=?, MEMBER_PHONE=?, MEMBER_EMAIL=?, MEMBER_ADDRESS=?, MEMBER_ZIPCODE=?, MEMBER_GRADE=?, MEMBER_MODIFY_DATE=SYSDATE WHERE MEMBER_NO=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberMid());
			pstmt.setString(2, vo.getMemberName());
			pstmt.setString(3, vo.getMemberPwd());
			pstmt.setString(4, vo.getMemberPhone());
			pstmt.setString(5, vo.getMemberEmail());
			pstmt.setString(6, vo.getMemberAddress());
			pstmt.setString(7, vo.getMemberZipcode());
			pstmt.setString(8, vo.getMemberGrade());
			pstmt.setString(9, vo.getMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection conn, String num) {
		
		String sql = "UPDATE MEMBER SET STATUS = 'Y' WHERE MEMBER_NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int returnMember(Connection conn, String num) {

		String sql = "UPDATE MEMBER SET STATUS = 'N' WHERE MEMBER_NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertBoard(Connection conn, EventVo evo) {
		
		String sql = "INSERT INTO EVENT (NO, TITLE, CONTENT, WRITER) VALUES (SEQ_EVENT_NO.NEXTVAL, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, evo.getTitle());
			pstmt.setString(2, evo.getContent());
			pstmt.setString(3, evo.getWriter());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	

	
	public int insertAttachment(Connection conn, AttachmentVo avo) {
			//conn 준비
	
			//SQL 준비
			String sql = "INSERT INTO ETTACHMENT ( NO ,REF_ENO ,ORIGIN_NAME ,CHANGE_NAME ,FILE_PATH ) VALUES ( SEQ_ETTACHMENT_NO.NEXTVAL , SEQ_EVENT_NO.CURRVAL , ? , ? , ? ) ";
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			try {
				//SQL을 객체에 담기 및 완성하기
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, avo.getOriginName());
				pstmt.setString(2, avo.getChangeName());
				pstmt.setString(3, avo.getFilePath());
				
				//SQL 실행 및 결과 저장
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			//결과 리턴
			return result;
	}

	public List<EventVo> showList(Connection conn, PageVo pageVo) {
		
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT E.NO ,   E.TITLE ,   E.CONTENT , E.UPLOAD_DATE , M.MEMBER_NAME AS WRITER FROM EVENT E JOIN MEMBER M ON E.WRITER = M.MEMBER_NO ORDER BY E.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EventVo> list = new ArrayList<EventVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("NO");
				String title = rs.getString("TITLE");
				String name = rs.getString("WRITER");
				
				EventVo vo = new EventVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setWriter(name);
				
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

	public int getCount(Connection conn) {

		//Connection 준비
		
		//SQL 준비
		String sql = "SELECT COUNT(NO) AS COUNT FROM EVENT";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			//SQL을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//실행결과 -> 자바 데이터
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		
		//실행결과 리턴
		return count;
	}

	public EventVo selectEvent(Connection conn, String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EventVo evo = null;
		
		String sql = "SELECT M.MEMBER_NAME WRITER, E.TITLE, E.CONTENT FROM EVENT E JOIN MEMBER M ON E.WRITER = M.MEMBER_NO WHERE E.NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				String no = num;
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writer = rs.getString("WRITER");
				
				evo = new EventVo();
				evo.setNo(no);
				evo.setTitle(title);
				evo.setContent(content);
				evo.setWriter(writer);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return evo;
	}

	public AttachmentVo selectAtmt(Connection conn, String num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AttachmentVo avo = null;
		
		//sql 준비
		String sql = "SELECT FILE_PATH, CHANGE_NAME FROM ETTACHMENT WHERE REF_ENO = ?";
		
		try {
			//sql 객체에 담기 -> 물음표 채욱
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			//sql 실행 및 결과 저장
			rs = pstmt.executeQuery();

			if(rs.next()) {
				avo = new AttachmentVo();
				avo.setFilePath(rs.getString("FILE_PATH"));
				avo.setChangeName(rs.getString("CHANGE_NAME"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		//결과 리턴
		return avo;
	}

	public int editEvent(Connection conn, EventVo evo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = "UPDATE EVENT SET TITLE = ? , CONTENT = ?, WRITER = ? WHERE NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, evo.getTitle());
			pstmt.setString(2, evo.getContent());
			pstmt.setString(3, evo.getWriter());
			pstmt.setString(4, evo.getNo());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int delete(Connection conn, String num) {
		
		int result = 0;
		String sql = "UPDATE EVENT SET STATUS = 'Y' WHERE NO = ?";
		//sql객체에 담기 -> 물음표 채우기
		PreparedStatement pstmt = null;
		try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, num);
				
				result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//결과 리턴
		return result;
	}	
}