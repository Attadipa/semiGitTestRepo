package com.kh.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cs.service.FaqService;
import com.kh.cs.vo.FaqVo;

@WebServlet(urlPatterns = "/cs/type")
public class ClickFaqTypeController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String type = req.getParameter("t");
		
		List<FaqVo> voList = new FaqService().typeList(type);
		
		req.setAttribute("voList", voList);
		
		req.getRequestDispatcher("/views/cs/csTypeForm.jsp").forward(req, resp);
		
	}

}
