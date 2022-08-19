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
		
		switch(type) {
			case "trade": type = "거래 관련"; break;
			case "id": type = "계정 관련"; break;
			case "event": type = "행사 관련"; break;
			case "ads": type = "광고 관련"; break;
			case "suggest": type = "건의 및 제안"; break;
			case "etc": type = "기타"; break;
		}
		
		
		List<FaqVo> voList = new FaqService().typeList(type);
		
		req.setAttribute("voList", voList);
		
		req.getRequestDispatcher("/views/cs/csTypeForm.jsp").forward(req, resp);
		
	}

}
