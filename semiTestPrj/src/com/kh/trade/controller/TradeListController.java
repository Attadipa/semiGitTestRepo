package com.kh.trade.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/trade/list")
public class TradeListController extends HttpServlet {

	//거래 게시판 목록 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		List<TradeVo> voList = new TradeService().selectList();
		
		if(voList != null) {
			//조회 성공 -> tradeList 화면 보여주기
			req.setAttribute("voList", voList);
			req.getRequestDispatcher("/views/trade/tradeList.jsp");
			System.out.println(voList);
			System.out.println(voList.size());
		} else {
			//실패
			req.setAttribute("errorMsg", "조회에 실패하였습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp");
		}
	
		
		
	}
}
