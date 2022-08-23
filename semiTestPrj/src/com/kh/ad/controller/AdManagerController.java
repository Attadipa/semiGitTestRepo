package com.kh.ad.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ad.service.AdService;
import com.kh.ad.vo.AdVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/ad/manager")
public class AdManagerController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		String memberNo = loginMember.getMemberNo();
		
		List<AdVo> list = new AdService().selectList(memberNo);
		
		if(list != null) {
			req.setAttribute("adList", list);
			req.getRequestDispatcher("/views/ad/adManager.jsp").forward(req, resp);			
		} else {
			req.setAttribute("errorMsg","내 광고목록 불러오기 실패");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		

	}
}
