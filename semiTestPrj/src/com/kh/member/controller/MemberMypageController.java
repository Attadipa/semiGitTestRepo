package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/mypage")
public class MemberMypageController extends HttpServlet{

	//마이페이지 화면 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		
		if(loginMember != null) {
			req.getRequestDispatcher("/views/member/myPageForm.jsp").forward(req, resp);
		}else {
			req.getSession().setAttribute("alertMsg", "로그인 후 접근 가능합니다");
			resp.sendRedirect(req.getContextPath());
		}
	}
	
	//회원정보 변경
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//데이터 받기 -> 객체
		String memberName = req.getParameter("memberName");
		String memberEmail = req.getParameter("memberEmail");
		String memberPhone = req.getParameter("memberPhone");
		String memberAddress = req.getParameter("memberAddress");
		String memberZipcode = req.getParameter("memberZipcode");
		
		String memberNo = ((MemberVo)req.getSession().getAttribute("loginMember")).getMemberNo();
		
		MemberVo vo = new MemberVo();
		vo.setMemberNo(memberNo);
		vo.setMemberName(memberName);
		vo.setMemberEmail(memberEmail);
		vo.setMemberPhone(memberPhone);
		vo.setMemberAddress(memberAddress);
		vo.setMemberZipcode(memberZipcode);
		
		//서비스 호출(객체)
		MemberVo updateVo = new MemberService().edit(vo);
		
		//실행결과에 따라 화면 선택
		if(updateVo != null) {
			//성공 화면
			req.getSession().setAttribute("loginMember", updateVo);
			req.getSession().setAttribute("alertMsg", "회원정보 수정 완료!");
			resp.sendRedirect("/semiTestPrj/member/mypage");
		}else {
			//실패 화면
			req.setAttribute("errorMsg", "회원정보 수정 실패!");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	}
}
