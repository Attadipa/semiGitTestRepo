package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.service.NoticeService;
import com.kh.notice.vo.NoticeVo;

@WebServlet(urlPatterns = "/notice/list")
public class NoticeListController extends HttpServlet {

	// 공지사항 목록 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 ㄴㄴ
		
		//서비스 호출하기
		ArrayList<NoticeVo> voList = new NoticeService().selectList();
		
		
		//화면 선택하기
		req.setAttribute("voList", voList);
		req.getRequestDispatcher("/views/notice/noticeList.jsp").forward(req, resp);
	}
	
	
	
}
