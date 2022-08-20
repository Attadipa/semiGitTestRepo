package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;

@WebServlet(urlPatterns = "/memeber/idCheck")
public class MemberIdCheckController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인코딩
		req.setCharacterEncoding("UTF-8");
		
		//클라이언트가 보낸 data 꺼내기
		String memberMid = req.getParameter("frmId");
		
		System.out.println("ID중복체크를 위해 DB 확인" + memberMid);
		
		//서비스 호출
		int result = new MemberService().idCheck(memberMid);
		
		//실행 결과에 따라 화면 선택
		if(result == 1) {
			//성공
			req.getSession().setAttribute("alertMsg", "사용 가능한 아이디 입니다.");
			resp.sendRedirect("/semiTestPrj/member/join");
		}else {
			//실패
			req.setAttribute("alertMsg", "중복된 아이디 입니다");
		}
	}
	
}
