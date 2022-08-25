package com.kh.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ad.vo.AdVo;
import com.kh.delivery.vo.DeliveryVo;
import com.kh.pay.service.PayService;
import com.kh.pay.vo.PayVo;

@WebServlet(urlPatterns = "/pay/insert")
public class PayInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tradeNo = req.getParameter("no");
		req.getRequestDispatcher("/views/pay/payForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int payCategory = Integer.parseInt(req.getParameter("payCategory"));
		System.out.println("payCategory : "+payCategory);
		
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
		
		int result = 0;
		
		if(payCategory==1) {
			
			result = new PayService().insertPay(payVo);
			
		} else if(payCategory==2){
			
			//배송결제시 추가
			String deliveryAddr = req.getParameter("deliveryAddr");
			String requestContent = req.getParameter("requestContent");
			
			System.out.println("deliveryAddr : "+deliveryAddr);
			System.out.println("requestContent : "+requestContent);
			
			System.out.println("delivery진입");
			DeliveryVo deliveryVo = new DeliveryVo();
			deliveryVo.setTradeNo(tradeNo);
			deliveryVo.setDeliveryAddr(deliveryAddr);
			deliveryVo.setRequestContent(requestContent);
			
			result = new PayService().insertPayPlusDel(payVo,deliveryVo);
			
		} else if(payCategory==3){
			
			//광고결제시 추가
			String period = req.getParameter("period");
			String keyword1 = req.getParameter("keyword1");
			String keyword2 = req.getParameter("keyword2");
			String keyword3 = req.getParameter("keyword3");
			
			System.out.println("period : "+period);
			System.out.println("keyword1 : "+keyword1);
			System.out.println("keyword2 : "+keyword2);
			System.out.println("keyword3 : "+keyword3);
			
			System.out.println("광고결제진입");
			AdVo adVo = new AdVo();
			adVo.setMemberNo(memberNo);
			adVo.setTradeNo(tradeNo);
			adVo.setPeriod(period);
			adVo.setKeyword1(keyword1);
			adVo.setKeyword1(keyword2);
			adVo.setKeyword1(keyword3);
			
			result = new PayService().insertPayPlusAd(payVo,adVo);
			
		}

		resp.setCharacterEncoding("UTF-8");
		
		if(result==1) {
			System.out.println("결제DB입력성공");
			resp.getWriter().write("1");
		} else {
			System.out.println("결제DB입력실패");
			resp.getWriter().write("-1");
		}
		


		
		
	}
}
