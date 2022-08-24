package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/findPwd")
public class MemberFindPwdController extends HttpServlet{

	/*
	 * 비밀번호 찾기
	 */
	//비밀번호 찾기 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/member/findPwd.jsp").forward(req, resp);
		
	}
	
	//비밀번호 찾기 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//데이터 꺼내기
		String memberMid = req.getParameter("memberMid");
		String memberPhone = req.getParameter("memberPhone");
		
		//데이터 뭉치기
		MemberVo vo = new MemberVo();
		vo.setMemberName(memberMid);
		vo.setMemberPhone(memberPhone);
		
		//서비스 로직 실행
		String memberPwd = new MemberService().findPwd(memberMid, memberPhone);
		
		//결과에 따라 화면 선택
		if(memberPwd != null) {
			//비밀번호 찾기 성공 // 유저 정보 담기
			req.setAttribute("memberPwd", memberPwd);
			req.getSession().setAttribute("alertMsg", "비밀번호 찾기 완료!");
			req.getRequestDispatcher("/views/member/findPwdResult.jsp").forward(req, resp);
		}else {
			//비밀번호 찾기 실패
			req.setAttribute("errorMsg", "비밀번호 찾기 실패!");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	
		
	}

}