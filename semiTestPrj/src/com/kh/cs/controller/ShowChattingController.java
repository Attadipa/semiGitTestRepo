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

@WebServlet(urlPatterns = "/cs/chat")
public class ShowChattingController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		List<ChatVo> list = new ChatService().selectList(num);
		
		resp.setCharacterEncoding("UTF-8");
		
		Gson g = new Gson();
		String listStr = g.toJson(list);
		resp.getWriter().write(listStr);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String content = req.getParameter("content");
		String num = req.getParameter("num");
		String grade = req.getParameter("grade");
		
		ChatVo vo = new ChatVo();
		vo.setContent(content);
		vo.setNo(num);
		vo.setGrade(grade);
		
		new ChatService().insert(vo);
		
		
	}

}
