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

@WebServlet(urlPatterns = "/trade/today")
public class TodayTradeController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<TradeVo> tvo = new TradeService().today();
		List<AttachmentVo> avo = new TradeService().selectAtt(tvo);
		
		if(avo != null) {
			for(int i=0; i<avo.size();i++) {
				tvo.get(i).setExplain((avo.get(i).getFilePath().substring(14, 27)+avo.get(i).getFilePath().substring(38)+"\\"+avo.get(i).getChangeName()).replace("\\", "/"));
			}
		}
		
		Gson g = new Gson();
		
		String jsonTvo = g.toJson(tvo);
		
		System.out.println(tvo);
		resp.getWriter().write(jsonTvo);
		
	}
	
}
