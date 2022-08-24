package com.kh.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.comment.service.CommentService;
import com.kh.comment.vo.CommentVo;

@WebServlet(urlPatterns = "/comment/insert")
public class CommentInsertController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String postNo = req.getParameter("postNo");
		String memberNo = req.getParameter("memberNo");
		String content = req.getParameter("content");
		
		CommentVo cvo = new CommentVo();
		cvo.setPostNo(postNo);
		cvo.setNo(memberNo);
		cvo.setContent(content);
		
		int result = new CommentService().insert(cvo);
		
		if(result == 1) {
			req.setAttribute("cvo", cvo);
			req.getRequestDispatcher("/views/notice/noticeDetail.jsp").forward(req, resp);
		} else {
			req.setAttribute("errorMsg", "댓글 작성 실패!");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}

}
