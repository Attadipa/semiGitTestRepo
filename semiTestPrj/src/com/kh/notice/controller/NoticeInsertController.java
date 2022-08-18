package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.service.NoticeService;
import com.kh.notice.vo.NoticeVo;

@WebServlet(urlPatterns = "/notice/insert")
public class NoticeInsertController extends HttpServlet {
	
	// 공지사항 작성 화면 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/notice/noticeInsertForm.jsp").forward(req, resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인코딩
		req.setCharacterEncoding("UTF-8");
		
		//데이터 꺼내기
		String no = req.getParameter("writerNo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//데이터 뭉치기
		NoticeVo vo = new NoticeVo();
		vo.setWriter(no);
		vo.setTitle(title);
		vo.setContent(content);
		
		//서비스 호출하기
		int result = new NoticeService().insert(vo);
		
		
		//화면 선택하기
		if(result == 1) {
			//성공 -> 공지사항 리스트 
			req.setAttribute("alertMsg", "공지사항 작성이 완료되었습니다.");
			resp.sendRedirect("/semiTestPrj/notice/list");
			
		}else {
			//실패 -> 에러페이지 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++(수정하기)
			req.getSession().setAttribute("errorMsg", "공지사항 작성에 실패하였습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp");
			
		}
		
		
	}

}
