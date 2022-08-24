package com.kh.trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.trade.service.TradeService;

@WebServlet(urlPatterns = "/trade/delete")
public class TradeDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		int result = new TradeService().delete(num);
		
		if(result==1) {
			req.getSession().setAttribute("alertMsg", "거래를 삭제했습니다.");
			resp.sendRedirect("/semiTestPrj/trade/myList?p=1");
		}
		
	}
	
}
