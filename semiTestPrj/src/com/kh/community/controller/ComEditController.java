package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.service.CommunityService;
import com.kh.community.vo.CommunityVo;
import com.kh.notice.service.NoticeService;
import com.kh.notice.vo.NoticeVo;

@WebServlet(urlPatterns = "/community/edit")
public class ComEditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String num = req.getParameter("num");

		CommunityVo vo = new CommunityService().selectOne(num);

		if (vo != null) {
			// 성공 -> 수정화면 보여주기
			req.setAttribute("vo", vo);
			req.setAttribute("alertMsg", "수정 완료하였습니다.");
			req.getRequestDispatcher("/views/community/comEdit.jsp").forward(req, resp);

		} else {
			// 실패 -> 에러페이지
			req.setAttribute("errorMsg", "글을 수정하실 수 없습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String num = req.getParameter("num");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		CommunityVo vo = new CommunityVo();
		vo.setNo(num);
		vo.setTitle(title);
		vo.setContent(content);

		int result = new CommunityService().edit(vo);

		if (result == 1) {
			// 수정하기 성공 -> 상세페이지
			resp.sendRedirect("/semiTestPrj/community/detail?num=" + num);
		} else {
			// 수정하기 실패 -> 에러페이지
			req.setAttribute("errorMsg", "수정에 실패하였습니다.");
			req.getRequestDispatcher("/views/error/errorMsg.jsp");
		}

	}

}
