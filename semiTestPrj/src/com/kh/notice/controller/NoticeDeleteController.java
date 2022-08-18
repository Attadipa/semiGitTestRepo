package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.service.NoticeService;

@WebServlet(urlPatterns = "/notice/delete")
public class NoticeDeleteController extends HttpServlet {
	
	//공지사항 삭제하기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		int result = new NoticeService().delete(num);
		
		if(result == 1) {
			//공지사항 삭제 성공
			req.getSession().setAttribute("alertMsg", "정말 삭제하시겠습니까?");
			resp.sendRedirect("/semiTestPrj/notice/list");
			
		} else {
			req.setAttribute("errorMsg", "삭제 실패하였습니다. 다시 시도해주세요.");
			req.getRequestDispatcher("/views/error/errorPage.jsp");
			
		}
		
		
		
		
	}

}
