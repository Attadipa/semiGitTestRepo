package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.search.service.SearchService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/search")
public class SearchController extends HttpServlet{


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String keyword = req.getParameter("keyword");
		String keywordOption = req.getParameter("keyword-option"); 
		
		String[] keywordsArr = keyword.split(" ");
		ArrayList keywordsList = new ArrayList<String>();
		String keywords = null;

		if(keyword != "") {
			
			//키워드에 ''붙여줘서 리스트로 만들어놓기
			for(String a : keywordsArr) {
				a = keywordOption +  " LIKE '%" + a + "%'";
				keywordsList.add(a);
			}
			
			//keyword-option 에 따른 sql where 구문 작성
			keywords = String.join(" OR ", keywordsList);
			System.out.println(keywords);
			List<TradeVo> searchList = new SearchService().searchToKeywords(keywords);
			req.setAttribute("seartList", searchList);
			req.getRequestDispatcher("/views/search/searchList.jsp").forward(req, resp);
			
		} else {
			// 키워드 입력이나 옵션 선택안하면
			// 검색 실패
			req.setAttribute("searchErrorMsg", "검색 키워드 작성과 옵션 선택을 해주세요 : )");
			req.getRequestDispatcher("/views/search/searchList.jsp").forward(req, resp);
		}

		

		
	}
	
	
}
