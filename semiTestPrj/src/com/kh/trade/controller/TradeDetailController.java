package com.kh.trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.attachment.vo.AttachmentVo;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/trade/detail")
public class TradeDetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// num번 공지사항 조회수 증가
				String num = req.getParameter("num");
				
				int result = new TradeService().increaseTrade(num);
				
				if(result==1) {
					//DB에 가서 특정 공지사항 정보 조회
					 TradeVo tvo = new TradeService().selectOne(num);
					 AttachmentVo avo = new TradeService().selectAtt(num);
					
					 
					//정보를 req에 담아서 다음타자에게 포워딩
					 
					if(tvo != null) {
						req.setAttribute("tvo", tvo);
						 if(avo != null) {
							 avo.setFilePath((avo.getFilePath().substring(14, 27)+avo.getFilePath().substring(38)+"\\"+avo.getChangeName()).replace("\\", "/"));
							 System.out.println(avo.getFilePath());
							 req.setAttribute("avo", avo);
						 }
						req.getRequestDispatcher("/views/trade/tradeDetail.jsp").forward(req, resp);
					} else {
						//조회실패
						req.setAttribute("errorMsg", "거래게시글 조회 실패!");
						req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
					}
					
				} else {
					//조회실패
					req.setAttribute("errorMsg", "거래게시글 조회 실패!");
					req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
				}
	
	}
	
}
