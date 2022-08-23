package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.service.AdminService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/admin/edit")
public class MemberEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String num = req.getParameter("num");
				
		MemberVo vo = new AdminService().selectOne(num);
		
		resp.setCharacterEncoding("UTF-8");
		
		Gson g = new Gson();
		String voStr = g.toJson(vo);
		resp.getWriter().write(voStr);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 String num = req.getParameter("num");
		 String id = req.getParameter("memberId");
		 String name = req.getParameter("memberName");
		 String pwd = req.getParameter("memberPwd");
		 String phone = req.getParameter("memberPhone");
		 String email = req.getParameter("memberEmail");
		 String address = req.getParameter("memberAddress");
		 String zipcode = req.getParameter("memberZipcode");
		 String grade = req.getParameter("memberGrade");
		 
		 MemberVo vo = new MemberVo();
		 vo.setMemberNo(num);
		 vo.setMemberMid(id);
		 vo.setMemberName(name);
		 vo.setMemberPwd(pwd);
		 vo.setMemberPhone(phone);
		 vo.setMemberEmail(email);
		 vo.setMemberAddress(address);
		 vo.setMemberZipcode(zipcode);
		 vo.setMemberGrade(grade);
		 
		 
		 int result = new AdminService().editMember(vo);
		 
		 if(result == 1) {
			 req.getRequestDispatcher("/views/admin/adminForm.jsp").forward(req, resp);
		 }else {
			 req.setAttribute("errorMsg", "회원 정보 수정 실패 !");
			 req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		 }
			
	}

}
