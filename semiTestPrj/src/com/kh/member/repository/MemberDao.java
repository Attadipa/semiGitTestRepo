package com.kh.member.repository;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.vo.MemberVo;

public class MemberDao {

	//회원가입
	public int join(MemberVo vo, Connection conn){

		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			//SQL 준비
			String sql = 
					"INSERT INTO MEMBER(MEMBER_NO, MEMBER_MID, MEMBER_PWD, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS, MEMBER_ZIPCODE) VALUES(SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
			
			//SQL 객체에 담고, SQL 완성하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberMid());
			pstmt.setString(2, vo.getMemberPwd());
			pstmt.setString(3, vo.getMemberName());
			pstmt.setString(4, vo.getMemberPhone());
			pstmt.setString(5, vo.getMemberEmail());
			pstmt.setString(6, vo.getMemberAddress());
			pstmt.setString(7, vo.getMemberZipcode());
		
			//SQL 실행 및 실행결과 받기
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
}//회원가입
	
	
	
	//로그인
	public MemberVo login(Connection conn, MemberVo vo) {
		//Connection준비
		
		MemberVo loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//SQL준비
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_MID = ? AND MEMBER_PWD = ? AND STATUS = 'N'";
		
		try {
			//SQL객체에 담고, SQL 물음표 채우기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberMid());
			pstmt.setString(2, vo.getMemberPwd());
		
			//SQL 실행 및 결과저장
			rs = pstmt.executeQuery();
			
			//rs에서 데이터 거내서 객체로 만들기
			if(rs.next()) {
				String memberNo = rs.getString("MEMBER_NO");
				String memberMid = rs.getString("MEMBER_MID");
				String memberName = rs.getString("MEMBER_NAME");
				String memberPhone = rs.getString("MEMBER_PHONE");
				String memberEmail = rs.getString("MEMBER_EMAIL");
				String memberAddress = rs.getString("MEMBER_ADDRESS");
				String memberZipcode = rs.getString("MEMBER_ZIPCODE");
				Timestamp memberEnrollDate = rs.getTimestamp("MEMBER_ENROLL_DATE");
				Timestamp memberModifyDate = rs.getTimestamp("MEMBER_MODIFY_DATE");
				String memberGrade = rs.getString("MEMBER_GRADE");
				
				
				loginMember = new MemberVo();
				loginMember.setMemberNo(memberNo);
				loginMember.setMemberMid(memberMid);
				loginMember.setMemberName(memberName);
				loginMember.setMemberPhone(memberPhone);
				loginMember.setMemberEmail(memberEmail);
				loginMember.setMemberAddress(memberAddress);
				loginMember.setMemberZipcode(memberZipcode);
				loginMember.setMemberEnrollDate(memberEnrollDate);
				loginMember.setMemberModifyDate(memberModifyDate);
				loginMember.setMemberGrade(memberGrade);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			//자원 반납
			close(pstmt);
			close(rs);
		}
		
		//만들어진 객체 리턴
		return loginMember;
		
}//로그인
	
	
	
	//회원 정보 수정(마이페이지)
	public int edit(Connection conn, MemberVo vo) throws Exception {
		//Connection 준비
		
		//SQL 준비
		String sql = "UPDATE MEMBER SET MEMBER_NAME = ? , MEMBER_EMAIL = ? , MEMBER_PHONE = ?, MEMBER_ADDRESS = ? , MEMBER_ZIPCODE = ? , MEMBER_MODIFY_DATE = SYSDATE , MEMBER_GRADE = DEFAULT WHERE MEMBER_NO =?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			//SQL 객체에 담고 , 완성하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberName());
			pstmt.setString(2, vo.getMemberEmail());
			pstmt.setString(3, vo.getMemberPhone());
			pstmt.setString(4, vo.getMemberAddress());
			pstmt.setString(5, vo.getMemberZipcode());
			pstmt.setString(6, vo.getMemberNo());
//			pstmt.setString(7, vo.getMemberGrade());
			
			//SQL 실행 및 결과 저장
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		finally {
			//자원 반납
			close(pstmt);
		}
		
		//SQL 실행결과 리턴
		return result;
		
}//회원 정보 수정
	
	
	
	//회원 정보 조회 (회원번호)
	public MemberVo selectOneByNo(Connection conn, String num) {
		//connection 준비
		
		//SQL 준비
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_NO = ? AND STATUS ='N'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		//SQL 객체에 담기 및 쿼리 완성
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//ResultSet -> 자바객체 (MemberVo)
			if(rs.next()) {
				String memberNo = rs.getString("MEMBER_NO");
				String memberMid = rs.getString("MEMBER_MID");
				String memberName = rs.getString("MEMBER_NAME");
				String memberPhone = rs.getString("MEMBER_PHONE");
				String memberEmail = rs.getString("MEMBER_EMAIL");
				String memberAddress = rs.getString("MEMBER_ADDRESS");
				String memberZipcode = rs.getString("MEMBER_ZIPCODE");
				Timestamp memberEnrollDate = rs.getTimestamp("MEMBER_ENROLL_DATE");
				Timestamp memberModifyDate = rs.getTimestamp("MEMBER_MODIFY_DATE");
				String memberGrade = rs.getString("MEMBER_GRADE");
				
				vo = new MemberVo();
				vo.setMemberNo(memberNo);
				vo.setMemberMid(memberMid);
				vo.setMemberName(memberName);
				vo.setMemberPhone(memberPhone);
				vo.setMemberEmail(memberEmail);
				vo.setMemberAddress(memberAddress);
				vo.setMemberZipcode(memberZipcode);
				vo.setMemberEnrollDate(memberEnrollDate);
				vo.setMemberModifyDate(memberModifyDate);
				vo.setMemberGrade(memberGrade);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//자원 반납
			close(pstmt);
			close(rs);
		}
		
		//SQL 실행결과(자바객체) 리턴
		return vo;
		
}//회원 정보 조회 (회원번호)
	
	
	
	//아이디 찾기 (이름 + 폰번호)
	public String findId(Connection conn, String memberName, String memberPhone) {
		//connection 준비

		//SQL 준비
		String sql = "SELECT MEMBER_MID FROM MEMBER WHERE MEMBER_NAME = ? AND MEMBER_PHONE = ?";
		
		System.out.println("=====");
		System.out.println(memberName);
		System.out.println(memberPhone);
		
		String memberMid = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberPhone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberMid = rs.getString("MEMBER_MID");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//자원 반납
			close(pstmt);
			close(rs);
		}
		
		//실행 결과 리턴
		return memberMid;

}//아이디 찾기 (이름 + 폰번호)
	
	
	
	//비밀번호 찾기 (아이디 + 폰번호)
	public String findPwd(Connection conn, String memberMid, String memberPhone) {
		//connection 준비

		//SQL 준비
		String sql = "SELECT MEMBER_PWD FROM MEMBER WHERE MEMBER_MID = ? AND MEMBER_PHONE = ? ";
		
		String memberPwd = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberMid);
			pstmt.setString(2, memberPhone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberPwd = rs.getString("MEMBER_PWD");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//자원 반납
			close(pstmt);
			close(rs);
		}
		
		//실행 결과 리턴
		return memberPwd;

}//비밀번호 찾기 (아이디 + 폰번호)
	
	
	
	
	//비밀번호 변경
	public int changePwd(Connection conn, String memberMid, String memberPwd, String memberPwdNew) {
		//connection 준비
		
		//sql 준비
		String sql = "UPDATE MEMBER SET MEMBER_PWD = ? WHERE MEMBER_MID = ? AND MEMBER_PWD = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			//SQL 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberPwdNew);
			pstmt.setString(2, memberMid);
			pstmt.setString(3, memberPwd);
			
			//SQL 실행 및 결과저장
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		//실행결과 리턴
		return result;
	}
	
	
	
	//회원 등급 불러오기
	public MemberVo selectGrade(Connection conn, String memberGrade) {
		//connection 준비
		
		//SQL 준비
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_GRADE = ? AND STATUS ='N'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		//SQL 객체에 담기 및 쿼리 완성
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberGrade);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//ResultSet -> 자바객체 (MemberVo)
			if(rs.next()) {
				String memberNo = rs.getString("MEMBER_NO");
				String memberMid = rs.getString("MEMBER_MID");
				String memberName = rs.getString("MEMBER_NAME");
				String memberPhone = rs.getString("MEMBER_PHONE");
				String memberEmail = rs.getString("MEMBER_EMAIL");
				String memberAddress = rs.getString("MEMBER_ADDRESS");
				String memberZipcode = rs.getString("MEMBER_ZIPCODE");
				Timestamp memberEnrollDate = rs.getTimestamp("ENROLL_DATE");
				Timestamp memberModifyDate = rs.getTimestamp("MODIFY_DATE");
				
				vo = new MemberVo();
				vo.setMemberNo(memberNo);
				vo.setMemberMid(memberMid);
				vo.setMemberName(memberName);
				vo.setMemberPhone(memberPhone);
				vo.setMemberEmail(memberEmail);
				vo.setMemberAddress(memberAddress);
				vo.setMemberZipcode(memberZipcode);
				vo.setMemberEnrollDate(memberEnrollDate);
				vo.setMemberModifyDate(memberModifyDate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//자원 반납
			close(pstmt);
			close(rs);
		}
		
		//SQL 실행결과(자바객체) 리턴
		return vo;
		
}//회원 정보 조회 (회원번호)

	
	
	//아이디 중복체크
	public int idCheck(Connection conn, String memberMid) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; //오류발생
		
		//SQL 준비
		String sql = "SELECT MEMBER_MID FROM MEMBER WHERE MEMBER_MID = ?";
		System.out.println("ID중복체크");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberMid);
			
			//SQL 결과 저장
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//중복
				result = 1;
				System.out.println("중복된 아이디 입니다");
			}else {
				//존재하지 않을경우(사용가능)
				result = 0;
				System.out.println("사용 가능한 아이디 입니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return result;
	}
	
}//class

