package com.kh.ad.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ad.service.AdService;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/ad/insert")
public class AdInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tradeNo = req.getParameter("num");
		
		TradeVo tradeVo = new TradeService().selectOne(tradeNo);
		int payCategory = 3;
		
		
		if(tradeVo!=null) {
			req.setAttribute("tradeVo", tradeVo);
			req.setAttribute("payCategory", 3);
			req.getRequestDispatcher("/views/pay/payForm.jsp").forward(req, resp);
		}else {
			req.setAttribute("errorMsg", "실패");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}
}
