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
		req.getRequestDispatcher("/views/pay/payForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int payAmount = Integer.parseInt(req.getParameter("payAmount"));
		int memberNo = Integer.parseInt(req.getParameter("memberNo"));
		int payMethodNo = Integer.parseInt(req.getParameter("payMethodNo"));
		int postNo = Integer.parseInt(req.getParameter("postNo"));
		
		PayVo vo = new PayVo();
		vo.setPayAmount(payAmount);
		vo.setMemberNo(memberNo);
		vo.setPayMethodNo(payMethodNo);
		vo.setPostNo(postNo);
		
		int result = new PayService().payInsert();
		if(result==1) {
			req.getRequestDispatcher("/views/pay/payResult.jsp").forward(req, resp);
		}else {
			//에러창 이동 - 아직 미완성
		}
		
		
	}
}
