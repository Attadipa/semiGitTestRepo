package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.service.AdminService;
import com.kh.admin.vo.EventVo;

@WebServlet(urlPatterns = "/event/edit")
public class EventEditController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("eventNo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String memNo = req.getParameter("memberNo");
		
		EventVo evo = new EventVo();
		evo.setNo(no);
		evo.setTitle(title);
		evo.setContent(content);
		evo.setWriter(memNo);
		
		int result = new AdminService().editEvent(evo);
		
		if(result==1) {
			req.getSession().setAttribute("alertMsg", "해당 이벤트를 수정 완료했습니다!");
			resp.sendRedirect("/semiTestPrj/event/detail?num=" + no);
		}else {
			req.setAttribute("errorMsg", "해당 이벤트 수정을 실패했습니다 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	}

}
