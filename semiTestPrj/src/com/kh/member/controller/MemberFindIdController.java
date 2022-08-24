package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/findId")
public class MemberFindIdController extends HttpServlet{
	
	/*
	 * 아이디 찾기
	 */
	//아이디 찾기 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/member/findId.jsp").forward(req, resp);
		
	}
	
	//아이디 찾기 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//데이터 꺼내기
		String memberName = req.getParameter("memberName");
		String memberPhone = req.getParameter("memberPhone");
		
		//데이터 뭉치기
		MemberVo vo = new MemberVo();
		vo.setMemberName(memberName);
		vo.setMemberPhone(memberPhone);
		
		//아이디 찾기 처리
		String memberMid = new MemberService().findId(memberName, memberPhone);
		
		//결과에 따라 화면 선택
		if(memberMid != null) {
			//아이디 찾기 성공 //유저 정보 담기
			req.setAttribute("memberMid", memberMid);
			req.getSession().setAttribute("alertMsg", "아이디 찾기 완료!");
			req.getRequestDispatcher("/views/member/findIdResult.jsp").forward(req, resp);
		}else {
			//아이디 찾기 실패
			req.setAttribute("errorMsg", "아이디 찾기 실패!");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	
		
	}

}
