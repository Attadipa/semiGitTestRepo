package com.kh.trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/trade/insert")
public class TradeInsertController extends HttpServlet {
	
	//거래 게시판 작성 화면 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/trade/tradeInsertForm.jsp").forward(req, resp);
	}
	
	//거래 게시판 작성하기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String no = req.getParameter("no");
		String writerNo = req.getParameter("writerNo");
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String location = req.getParameter("location");
		String condition = req.getParameter("condition");
		String exchange = req.getParameter("exchange");
		String ship = req.getParameter("ship");
		String price = req.getParameter("price");
		String explain = req.getParameter("explain");
		String count = req.getParameter("count");
		
		TradeVo vo = new TradeVo();
		vo.setTradeNo(no);
		vo.setWriter(writerNo);
		vo.setTitle(title);
		vo.setRefCategoryNo(category);
		vo.setLocation(location);
		vo.setCondition(condition);
		vo.setExchange(exchange);
		vo.setShip(ship);
		vo.setPrice(price);
		vo.setExplain(explain);
		vo.setCount(count);
		

		int result = new TradeService().insert(vo);
//		System.out.println(result);
		
		if(result == 1) {
			//작성 성공-> 리스트 보여주기
			req.setAttribute("alertMsg", "글이 작성되었습니다");
			resp.sendRedirect("/semiTestPrj/trade/list");
		} else {
			//작성 실패 -> 에러페이지
			req.setAttribute("errorPage", "작성에 실패하셨습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
		

		
		
	}

}
