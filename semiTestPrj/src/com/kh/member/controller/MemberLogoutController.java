package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/member/logout")
public class MemberLogoutController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그아웃 == 세션만료
		req.getSession().invalidate();
		req.getSession().setAttribute("alertMsg", "로그아웃 완료");
		
		//메안화면 보여주기
		resp.sendRedirect(req.getContextPath());
	}
}
