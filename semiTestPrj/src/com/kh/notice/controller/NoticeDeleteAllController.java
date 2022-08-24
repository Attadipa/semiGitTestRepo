package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.service.NoticeService;

@WebServlet(urlPatterns = "/notice/deleteAll")
public class NoticeDeleteAllController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String [] postNo = req.getParameterValues("postNo");
		
		int result = new NoticeService().deleteAll(postNo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "선택하신 게시물을 삭제하였습니다.");
			resp.sendRedirect("/semiTestPrj/notice/list?p=1");
		}
	}

}
