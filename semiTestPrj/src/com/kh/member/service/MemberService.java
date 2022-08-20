package com.kh.member.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.repository.MemberDao;
import com.kh.member.vo.MemberVo;

public class MemberService {
	
	private final MemberDao dao = new MemberDao();

	//회원가입
	public int join(MemberVo vo) {
		
		//id 유효성 검사(n글자 이상인지)
		if(vo.getMemberMid().length() < 4) {
			//회원가입 불가. 다음단계 진행 X
			return -1;
		}
		
		//pwd 검사 (n글자 이상인지)
		if(vo.getMemberPwd().length() < 4) {
			//회원가입 불가. 다음단계 진행 X
			return -2;
		}
		
	
		//아이디 중복 검사
		
		//vo를 DB에 insert
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			result = dao.join(vo, conn);
			
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
			
		}finally {
			close(conn);
		}
		
		return result;
		
	}//회원 가입
	
	
	//로그인
	public MemberVo login(MemberVo vo) {
		
		//SQL 실행을 위헤서 Connection 준비
		Connection conn = null;
		MemberVo loginMember = null;
		
		try {
			conn = getConnection();
			
			//SQL 실행결과 리턴
			loginMember = dao.login(conn, vo);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return loginMember;
		
	}//로그인
	
	
	//회원 정보 수정
	public MemberVo edit(MemberVo vo) {
		//비지니스 로직 (자바 || SQL)
		if(vo.getMemberName().length() > 20) {
			//문제발생. 다음단계 진행 X
			System.out.println("한글은 10글자, 영어는 20글자까지가능");
			return null;
		}
		
		Connection conn = null;
		int result = 0;
		MemberVo updateVo = null;
		
		try {
			conn = getConnection();
			result = dao.edit(conn, vo);
			
			//트랜잭션 처리(commit || rollback)
			if(result ==1) {
				commit(conn);
				//다시한번 회원 정보 조회 (회원번호)
				updateVo = selectOneByNo(vo.getMemberNo());
			}else {
				rollback(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
			
		}finally {
			close(conn);
		}
		
		//실행결과 리턴
		return updateVo;
		
	}//회원 정보 수정
	

	//회원정보 조회 (회원번호)
	private MemberVo selectOneByNo(String memberNo) {
	
		Connection conn = null;
		MemberVo vo = null;
		
		try {
			conn = getConnection();
			vo = dao.selectOneByNo(conn, memberNo);
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(conn);
		}
		
		return vo;
		
	}//회원정보 조회 (회원번호)
	
	
	//비밀번호 변경
	public int changePw(String memberMid, String memberPwd, String memberPwdNew, String meberPwdNew2) {
		
		//비지니스 로직
		if(memberPwdNew.equals(meberPwdNew2) == false) {
			System.out.println("신규 비밀번호가 일치하지 않음");
			return -1;
		}
		
		if(memberPwdNew.length() < 8) {
			System.out.println("비밀번호가 8자리 미만임");
			return -2;
		}
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			//DAO 호출 (SQL 실행)
			result = dao.changePw(conn, memberMid, memberPwd, memberPwdNew);
			
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			
		}finally {
			close(conn);
		}
		
		return result;
		
	}//비밀번호 변경
	
	
	//아이디 찾기 (이름 + 폰번호)
	public String findId(Connection conn, String memberName, String memberPhone) {
		
		return null;
			
		
	}//아이디 찾기 (이름 + 폰번호
	
	
	//비밀번호 찾기 (아이디 + 폰번호)
	public String findPw(Connection conn, String memberMid, String memberPhone) {
			
		return null;
		
	}//비밀번호 찾기 (아이디 + 폰번호)
	
	
	//회원등급 조회
	public MemberVo selectGrade(String memberGrade) {
	
		Connection conn = null;
		MemberVo vo = null;
		
		try {
			conn = getConnection();
			vo = dao.selectGrade(conn, memberGrade);
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(conn);
		}
		
		return vo;
		
	}//회원등급 조회


	public int idCheck(String memberMid) {
				
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			//DAO 호출 (SQL 실행)
			result = dao.idCheck(conn, memberMid);
			
			if(result == 1) {
				
			}else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(conn);
		}
		
		return result;
	}




}//class
