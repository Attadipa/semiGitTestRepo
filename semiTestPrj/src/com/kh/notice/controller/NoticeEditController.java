package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.service.NoticeService;
import com.kh.notice.vo.NoticeVo;

@WebServlet(urlPatterns = "/notice/edit")
public class NoticeEditController extends HttpServlet {

	//공지사항 수정하기 화면 보여주기 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String num = req.getParameter("num");
		
		NoticeVo vo = new NoticeService().selectOne(num);
		
		if(vo != null) {
			//성공 -> 수정하기 화면 보여주기
			req.setAttribute("vo", vo);
			req.setAttribute("alertMsg", "수정 완료하였습니다.");
			req.getRequestDispatcher("/views/notice/noticeEdit.jsp").forward(req, resp);
			
		} else {
			//실패 -> 에러페이지
			req.setAttribute("errorMsg", "공지사항을 수정하실 수 없습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp");
		}
		
		
	}
	
	
	//공지사항 수정하기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String num = req.getParameter("num");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		NoticeVo vo = new NoticeVo();
		vo.setNo(num);
		vo.setTitle(title);
		vo.setContent(content);
		
		int result = new NoticeService().edit(vo);
		
		if(result == 1) {
			//수정하기 성공 -> 상세페이지
			resp.sendRedirect("/semiTestPrj/notice/detail?num="+num);
		} else {
			//수정하기 실패 -> 에러페이지
			req.setAttribute("errorMsg", "수정에 실패하였습니다.");
			req.getRequestDispatcher("/views/error/errorMsg.jsp");
		}
		
	}
	
	
	
}
