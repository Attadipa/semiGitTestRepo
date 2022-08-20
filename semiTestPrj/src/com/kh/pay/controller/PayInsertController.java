package com.kh.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pay.service.PayService;
import com.kh.pay.vo.PayVo;

@WebServlet(urlPatterns = "/pay/insert")
public class PayInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String postNo = req.getParameter("no");
//		TradeVo tradeVo = new TradeService().getTradeDetail(postNo);
//		req.setAttribute("tradeVo",tradeVo);
		req.getRequestDispatcher("/views/pay/payForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//일반결제
		int payAmount = Integer.parseInt(req.getParameter("payAmount"));
		int memberNo = Integer.parseInt(req.getParameter("memberNo"));
		int payMethodNo = Integer.parseInt(req.getParameter("payMethodNo"));
		int postNo = Integer.parseInt(req.getParameter("postNo"));
		
		PayVo payVo = new PayVo();
		payVo.setPayAmount(payAmount);
		payVo.setMemberNo(memberNo);
		payVo.setPayMethodNo(payMethodNo);
		payVo.setPostNo(postNo);
		
		//배송결제시 추가
		
		String deliveryAddr = req.getParameter("deliveryAddr");
		String requestContent = req.getParameter("requestContent");
		
		if(deliveryAddr!="") {
			System.out.println("blank아님");
		}else {
			System.out.println("blank맞음");
		}
		
		System.out.println(payAmount);
		System.out.println(memberNo);
		System.out.println(payMethodNo);
		System.out.println(postNo);
		System.out.println(deliveryAddr);
		System.out.println(requestContent);

//		int result = new PayService().insertPay();
//		if(result==1) {
//			req.getRequestDispatcher("/views/pay/payResult.jsp").forward(req, resp);
//		} else {
//			req.setAttribute("errorMsg", "결제결과 DB입력 실패..");
//			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
//		}
		


		
		
	}
}
