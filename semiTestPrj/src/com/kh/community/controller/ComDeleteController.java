package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.service.CommunityService;

@WebServlet(urlPatterns = "/community/delete")
public class ComDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		int result = new CommunityService().delete(num);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "정말 삭제하시겠습니까?");
			resp.sendRedirect("/semiTestPrj/community/list?p=1");
			
		} else {
			req.setAttribute("errorMsg", "삭제 실패하였습니다. 다시 시도해주세요.");
			req.getRequestDispatcher("/views/error/errorPage.jsp");
			
		}
	}

}
