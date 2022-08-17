package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.service.NoticeService;
import com.kh.notice.vo.NoticeVo;

@WebServlet(urlPatterns = "/notice/detail")
public class NoticeDetailController extends HttpServlet {

	//공지사항 상세조회 화면 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 우선, num번 게시글의 조회수 증가시키기
		String num = req.getParameter("num");
		
//		int result = new NoticeService().increseNotice();
//		
//		if(result == 1) {
//			
//			//상세보기 화면 보여주기 -> 디비에서 특정 공지사항 정보 조회
//			NoticeVo vo = 
//			
//			
//			
//		}else {
//			//에러페이지
//			
//			
//			
//			
//		}
		
		
	}
	
}
