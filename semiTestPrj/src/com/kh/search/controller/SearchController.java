package com.kh.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.search.service.SearchService;

@WebServlet(urlPatterns = "/search")
public class SearchController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String keyword = req.getParameter("keyword");
		
		String[] keywords = keyword.split(" ");
		
		for(String a : keywords) {
			System.out.println(a);
		}
		
		List<TradeVo> searchResultList = new SearchService().searchToKeywords(keywords);
		
		req.getRequestDispatcher("").forward(req, resp);
		
	}
	
}
