package com.kh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.service.AdminService;
import com.kh.admin.vo.EventVo;

@WebServlet(urlPatterns = "/event/list")
public class ShowEventListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<EventVo> list = new AdminService().showList();
		
		resp.setCharacterEncoding("UTF-8");
		
		Gson g = new Gson();
		String listStr = g.toJson(list);
		resp.getWriter().write(listStr);
		
	}

}
