package com.kh.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cs.service.FaqService;
import com.kh.cs.vo.FaqVo;

@WebServlet(urlPatterns = "/cs/detail")
public class FaqDetail extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		FaqVo vo = new FaqService().selectOne(num);
		if(vo != null) {
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/views/cs/csDetail.jsp").forward(req, resp);
		}else {
			req.setAttribute("errorMsg", "FAQ 상세 조회 실패 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}

}
