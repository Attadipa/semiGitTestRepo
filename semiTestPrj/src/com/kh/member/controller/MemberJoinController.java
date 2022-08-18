package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/member/join")
public class MemberJoinController extends HttpServlet{

	//회원가입 화면
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/member/joinForm.jsp").forward(req, resp);
		
	}
	
	//회원가입 처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
//		String mid = req.getParameter("frm_id");
//		String pwd = req.getParameter("frm_password");
//		String name = req.getParameter("frm_name");
//		String email = req.getParameter("frm_email");
//		String phone = req.getParameter("frm_phone");
//		String zipcode = req.getParameter("zipcode");
//		String address = req.getParameter("address");
//		String[] phoneFirst = req.getParameterValues("phoneFirst");
		
		String mid = req.getParameter("frmId");
		String pwd = req.getParameter("frmPassword");
		String name = req.getParameter("frmName");
		String email = req.getParameter("frmEmail");
		String phone = req.getParameter("frmPhone");
		String zipcode = req.getParameter("zipcode");
		String address = req.getParameter("address");
		String[] phoneFirst = req.getParameterValues("phoneFirst");
		
	}
}
