package com.kh.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cs.service.FaqService;

@WebServlet(urlPatterns = "/cs/delete")
public class FaqDeleteContoller extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		int result = new FaqService().delete(num);
		
		if(result == 1) {
			String cp = req.getContextPath();
			req.getSession().setAttribute("alertMsg", "삭제 성공 !");
			resp.sendRedirect(cp + "/cs/type?t=trade");
		}else {
			req.setAttribute("errorMsg", "공지사항 삭제 실패 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	}
}
