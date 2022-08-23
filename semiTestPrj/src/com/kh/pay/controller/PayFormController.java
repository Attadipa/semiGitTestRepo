package com.kh.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/pay/form")
public class PayFormController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String tradeNo = req.getParameter("tradeNo");
		int payCategory = Integer.parseInt(req.getParameter("payCategory"));
		
		TradeVo tradeVo = new TradeService().selectOne(tradeNo);
		
		if(tradeVo!=null) {
			req.setAttribute("tradeVo", tradeVo);
			req.setAttribute("payCategory", payCategory);
			req.getRequestDispatcher("/views/pay/payForm.jsp").forward(req, resp);
		}else {
			req.setAttribute("errorMsg", "실패");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	}
}
