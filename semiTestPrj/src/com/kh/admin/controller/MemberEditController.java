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

}
