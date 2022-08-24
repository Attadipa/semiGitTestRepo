package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.service.CommunityService;
import com.kh.notice.service.NoticeService;

@WebServlet(urlPatterns = "/community/deleteAll")
public class CommunityDeleteAllController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String [] postNo = req.getParameterValues("postNo");
		
		int result = new CommunityService().deleteAll(postNo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "선택하신 게시물을 삭제하였습니다.");
			resp.sendRedirect("/semiTestPrj/community/list?p=1");
		}
	}
	
	
}
