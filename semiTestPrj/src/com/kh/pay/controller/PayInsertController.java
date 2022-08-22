package com.kh.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.pay.service.PayService;
import com.kh.pay.vo.DeliveryVo;
import com.kh.pay.vo.PayVo;

@WebServlet(urlPatterns = "/pay/insert")
public class PayInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tradeNo = req.getParameter("no");
//		TradeVo tradeVo = new TradeService().selectTrade(postNo);
//		req.setAttribute("tradeVo",tradeVo);
		req.getRequestDispatcher("/views/pay/payForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//일반결제
		String payAmount = req.getParameter("payAmount");
		String memberNo = req.getParameter("memberNo");
		String payMethodNo = req.getParameter("payMethodNo");
		String tradeNo = req.getParameter("tradeNo");
		
		PayVo payVo = new PayVo();
		payVo.setPayAmount(payAmount);
		payVo.setMemberNo(memberNo);
		payVo.setPayMethodNo(payMethodNo);
		payVo.setTradeNo(tradeNo);
		
		int result1 = new PayService().insertPay(payVo);
		
		//배송결제시 추가
		String deliveryAddr = req.getParameter("deliveryAddr");
		String requestContent = req.getParameter("requestContent");
		
		DeliveryVo deliveryVo = new DeliveryVo();
		
		
		if(deliveryAddr!="") {
			int result2 = new PayService().insertDelivery();
		}
		
		Gson g = new Gson();
		
		if(result1!=1) {
			System.out.println("성공");
			String jsonStr = g.toJson("");
			resp.getWriter().write(jsonStr);
		} else {
			System.out.println("실패");
			String jsonStr = g.toJson(list);
			resp.getWriter().write(jsonStr);
		}
		


		
		
	}
}
