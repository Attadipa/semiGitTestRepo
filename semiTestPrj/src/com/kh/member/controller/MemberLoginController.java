package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/login")
public class MemberLoginController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/member/loginForm.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String memberMid = req.getParameter("memberMid");
		String memberPwd = req.getParameter("memberPwd");
		
		//데이터 뭉치기
		MemberVo vo = new MemberVo();
		vo.setMemberMid(memberMid);
		vo.setMemberPwd(memberPwd);
		
		//서비스 로직 실행
		MemberVo loginMember = new MemberService().login(vo);
		
		//결과에 따라 화면 선택
		if(loginMember != null) {
			//로그인 성공 //세션에 로그인 유저 정보 담기
			req.getSession().setAttribute("loginMember", loginMember);
			req.getSession().setAttribute("alertMsg", "로그인 완료");
			
			resp.sendRedirect("/semiTestPrj");
		}else {
			//로그인 실패
			req.setAttribute("errorMsg", "로그인실패!");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	}

}
