package com.kh.ad.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.vo.MemberVo;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/ad/request")
public class AdRequestController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		String MemberNo = loginMember.getMemberNo();
		ArrayList<TradeVo> list = new TradeService().selectList(MemberNo);
		if(list!=null) {
			System.out.println("성공");
			req.setAttribute("TradeList", list);
			req.getRequestDispatcher("/views/pay/payResult.jsp").forward(req, resp);
		} else {
			System.out.println("실패");
			req.setAttribute("errorMsg", "등록 매물 불러오기 실패..");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		req.getRequestDispatcher("/views/ad/adRequest.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/ad/ad.jsp").forward(req, resp);
	}
}
