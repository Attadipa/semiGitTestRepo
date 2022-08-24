package com.kh.trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/trade/edit")
public class tradeEditController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 String num = req.getParameter("num");
		
		 TradeVo tvo = new TradeService().selectOne(num);
		 
		 req.setAttribute("tvo", tvo);
		 req.setAttribute("num", num);
		 req.getRequestDispatcher("/views/trade/tradeEditForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String tradeNo = req.getParameter("tradeNo");
		String writerNo = req.getParameter("writerNo");
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String condition = req.getParameter("condition");
		String exchange = req.getParameter("exchange");
		String ship = req.getParameter("ship");
		String price = req.getParameter("price");
		String explain = req.getParameter("explain");
		String count = req.getParameter("count");
		
		
		TradeVo tvo = new TradeVo();
		tvo.setTradeNo(tradeNo);
		tvo.setWriter(writerNo);
		tvo.setTitle(title);
		tvo.setRefCategoryNo(category);
		tvo.setCondition(condition);
		tvo.setExchange(exchange);
		tvo.setShip(ship);
		tvo.setPrice(price);
		tvo.setExplain(explain);
		tvo.setCount(count);

		int result = new TradeService().edit(tvo);
		
		if(result==1) {
			req.getSession().setAttribute("alertMsg", "거래를 수정했습니다.");
			resp.sendRedirect("/semiTestPrj/trade/detail?num="+tradeNo);
		} else {
			//수정하기 실패 -> 에러페이지
			req.setAttribute("errorMsg", "수정에 실패하였습니다.");
			req.getRequestDispatcher("/views/error/errorMsg.jsp");
		}
		
	}
	
}
