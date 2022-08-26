package com.kh.ad.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.attachment.vo.AttachmentVo;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/ad/insert")
public class AdInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tradeNo = req.getParameter("num");
		
		TradeVo tvo = new TradeService().selectOne(tradeNo);
		AttachmentVo avo = new TradeService().selectAtt(tradeNo);
		
		if(tvo != null) {
			req.setAttribute("payCategory", 3);
			req.setAttribute("tradeVo", tvo);
			if(avo != null) {
				avo.setFilePath((avo.getFilePath().substring(22, 35)+avo.getFilePath().substring(46)+"\\"+avo.getChangeName()).replace("\\", "/"));
				req.setAttribute("avo", avo);
			}
			System.out.println("avo : "+avo);
			req.getRequestDispatcher("/views/pay/payForm.jsp").forward(req, resp);
		} else {
			//조회실패
			req.setAttribute("errorMsg", "게시글 조회실패");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}
}
