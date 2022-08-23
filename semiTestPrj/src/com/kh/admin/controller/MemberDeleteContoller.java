package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.service.AdminService;

@WebServlet(urlPatterns = "/admin/delete")
public class MemberDeleteContoller extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		int result = new AdminService().deleteMember(num);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "회원을 추방하였습니다.");
			resp.sendRedirect(req.getContextPath() + "/admin/search");
		}else {
			req.setAttribute("errorMsg", "회원 추방 실패 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}

}
