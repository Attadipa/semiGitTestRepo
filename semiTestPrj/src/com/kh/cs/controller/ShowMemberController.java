package com.kh.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cs.service.ChatService;
import com.kh.cs.vo.ChatVo;

@WebServlet(urlPatterns = "/cs/member")
public class ShowMemberController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<ChatVo> list = new ChatService().showList();
		
		resp.setCharacterEncoding("UTF-8");
		
		Gson g = new Gson();
		String listStr = g.toJson(list);
		resp.getWriter().write(listStr);
		
	}

}
