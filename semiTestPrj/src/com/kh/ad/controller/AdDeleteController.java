package com.kh.ad.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ad.service.AdService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/ad/delete")
public class AdDeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		String memberNo = loginMember.getMemberNo();
		String tradeNo = req.getParameter("no");
		
		int result = new AdService().deleteAdPlusPay(memberNo, tradeNo);
		System.out.println(result);
		if(result == 1) {
			resp.sendRedirect("/semiTestPrj/ad/manager?p=1");
		} else {
			req.setAttribute("errorMsg", "광고취소실패");
			req.getRequestDispatcher("/views/error/errorPage.jsp");
		}
	}
}
