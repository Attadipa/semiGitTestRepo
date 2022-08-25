package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.service.AdminService;
import com.kh.admin.vo.EventVo;
import com.kh.attachment.vo.AttachmentVo;

@WebServlet(urlPatterns = "/event/detail")
public class EventDetailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		EventVo evo = new AdminService().selectEvent(num);
		AttachmentVo avo = new AdminService().selectAtmt(num);
		
		
		if(evo != null) {
			req.setAttribute("evo", evo);
			if(avo != null) {
				String str = "../.." + avo.getFilePath().substring(18, 31) + avo.getFilePath().substring(42);
				avo.setFilePath(str.replace("\\", "/"));
				req.setAttribute("avo", avo);
			}
			req.getRequestDispatcher("/views/admin/eventDetail.jsp").forward(req, resp);
			
		} else {
			req.setAttribute("errorMsg", "이벤트 조회 실패 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
		
	}

}
