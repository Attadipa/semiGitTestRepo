package com.kh.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ad.service.AdService;
import com.kh.ad.vo.AdVo;
import com.kh.delivery.service.DeliveryService;
import com.kh.delivery.vo.DeliveryVo;
import com.kh.pay.service.PayService;
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
		
		System.out.println("payAmount : "+payAmount);
		System.out.println("memberNo : "+memberNo);
		System.out.println("payMethodNo : "+payMethodNo);
		System.out.println("tradeNo : "+tradeNo);
		
		PayVo payVo = new PayVo();
		payVo.setPayAmount(payAmount);
		payVo.setMemberNo(memberNo);
		payVo.setPayMethodNo(payMethodNo);
		payVo.setTradeNo(tradeNo);
		
		int result1 = new PayService().insertPay(payVo);
		
		
		
		//배송결제시 추가
		String deliveryAddr = req.getParameter("deliveryAddr");
		String requestContent = req.getParameter("requestContent");
		
		System.out.println("deliveryAddr : "+deliveryAddr);
		System.out.println("requestContent : "+requestContent);
			
		//광고결제시 추가
		String period = req.getParameter("period");
		String keyword1 = req.getParameter("keyword1");
		String keyword2 = req.getParameter("keyword2");
		String keyword3 = req.getParameter("keyword3");
		
		System.out.println("period : "+period);
		System.out.println("keyword1 : "+keyword1);
		System.out.println("keyword2 : "+keyword2);
		System.out.println("keyword3 : "+keyword3);
		
		if(!(deliveryAddr==null || deliveryAddr.equals(""))) {
			System.out.println("delvery진입");
			DeliveryVo deliveryVo = new DeliveryVo();
			deliveryVo.setDeliveryAddr(deliveryAddr);
			deliveryVo.setRequestContent(requestContent);
			int result2 = new DeliveryService().insertDelivery(deliveryVo);
			System.out.println("result2 : "+result2);
		}
		if(!(period==null || period.equals(""))) {
			System.out.println("광고결제진입");
			AdVo adVo = new AdVo();
			adVo.setPeriod(period);
			adVo.setKeyword1(keyword1);
			adVo.setKeyword1(keyword2);
			adVo.setKeyword1(keyword3);
			int result3 = new AdService().insertAd(adVo);
			System.out.println("result3 : "+result3);
		}
		
		resp.setCharacterEncoding("UTF-8");
		
		if(result1==1) {
			System.out.println("성공");
			resp.getWriter().write("1");
		} else {
			System.out.println("실패");
			resp.getWriter().write("-1");
		}
		


		
		
	}
}
