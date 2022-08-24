package com.kh.trade.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.attachment.vo.AttachmentVo;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/trade/today/tvo")
public class TodayTradeTVOController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<TradeVo> tvo = new TradeService().today();
		
		Gson g = new Gson();
		
		String jsonTvo = g.toJson(tvo);
		
		resp.getWriter().write(jsonTvo);
		
	}
	
}
