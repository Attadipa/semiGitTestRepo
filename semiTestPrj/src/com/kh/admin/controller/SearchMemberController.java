package com.kh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.service.AdminService;
import com.kh.admin.vo.EventVo;
import com.kh.common.PageVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/admin/search")
public class SearchMemberController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/admin/adminForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String searchData = req.getParameter("searchData");
		
		List<MemberVo> voList = new AdminService().searchList(searchData);
		
		req.setAttribute("voList", voList);
		req.getRequestDispatcher("/views/admin/adminForm.jsp").forward(req, resp);
		
	}

}
