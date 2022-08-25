package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.service.AdminService;

@WebServlet(urlPatterns = "/event/delete")
public class EventDeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		int result = new AdminService().delete(num);
		
		if(result==1) {
			req.setAttribute("alertMsg", "해당 이벤트를 삭제하였습니다!");
			req.getRequestDispatcher("").forward(req, resp);
		}
		
	}

}
