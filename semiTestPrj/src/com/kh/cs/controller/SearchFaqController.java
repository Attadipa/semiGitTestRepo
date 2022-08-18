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

@WebServlet(urlPatterns = "/cs/search")
public class SearchFaqController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/cs/csForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		//데이터 꺼내기
		String searchContent = req.getParameter("searchFaq");
		
		//서비스 로직 실행
		List<FaqVo> voList = new FaqService().searchList(searchContent);
		
		//결과에 따라 화면 선택
		
		req.setAttribute("voList", voList);
		req.getRequestDispatcher("/views/cs/csTypeForm.jsp").forward(req, resp);
		
	}

}//class
