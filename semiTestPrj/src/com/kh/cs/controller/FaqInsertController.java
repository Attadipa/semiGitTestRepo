package com.kh.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cs.service.FaqService;
import com.kh.cs.vo.FaqVo;

@WebServlet(urlPatterns = "/cs/insert")
public class FaqInsertController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String type = req.getParameter("faqType");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		switch(type) {
			case "trade": type = "거래 관련"; break;
			case "id": type = "계정 관련"; break;
			case "event": type = "행사 관련"; break;
			case "ads": type = "광고 관련"; break;
			case "rule": type = "운영 정책"; break;
			case "etc": type = "기타"; break;
		}
		
		FaqVo vo = new FaqVo();
		vo.setFaqType(type);
		vo.setTitle(title);
		vo.setContent(content);
		
		int result = new FaqService().insert(vo);
		
		if(result == 1) {
			//성공
			req.getRequestDispatcher("/views/admin/adminForm.jsp").forward(req, resp);
		}else {
			//실패
			req.setAttribute("errorMsg", "FAQ 등록 실패 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	
	}

}
