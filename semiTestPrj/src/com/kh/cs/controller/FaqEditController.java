package com.kh.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cs.service.FaqService;
import com.kh.cs.vo.FaqVo;

@WebServlet(urlPatterns = "/cs/edit")
public class FaqEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		FaqVo vo = new FaqService().selectOne(num);
		
		if(vo != null) {
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/views/cs/csEdit.jsp").forward(req, resp);
		}else {
			req.setAttribute("errorMsg", "FAQ 수정하는 화면 불러오는 중 에러 발생 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String type = req.getParameter("faqType");
		String title = req.getParameter("title");
		String enrollDate = req.getParameter("enrollDate");
		String content = req.getParameter("content");
		String num = req.getParameter("num");
		
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
		vo.setEnrollDate(enrollDate);
		vo.setContent(content);
		vo.setNo(num);
		
		int result = new FaqService().edit(vo);
		
		if(result == 1) {
			//성공
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/views/cs/csDetail.jsp").forward(req, resp);
		}else {
			//실패
			req.setAttribute("errorMsg", "FAQ 수정 실패 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}

}
