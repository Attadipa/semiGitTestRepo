package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/join")
public class MemberJoinController extends HttpServlet{

	//회원가입 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/member/joinForm.jsp").forward(req, resp);
		
	}
	
	//회원가입 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
//		String mid = req.getParameter("frm_id");
//		String pwd = req.getParameter("frm_password");
//		String name = req.getParameter("frm_name");
//		String email = req.getParameter("frm_email");
//		String phone = req.getParameter("frm_phone");
//		String zipcode = req.getParameter("zipcode");
//		String address = req.getParameter("address");
//		String[] phoneFirst = req.getParameterValues("phoneFirst");
		
		String memberMid = req.getParameter("frmId");
		String memberPwd = req.getParameter("frmPassword");
		String memberName = req.getParameter("frmName");
		String memberEmail = req.getParameter("frmEmail");
		String memberPhone = req.getParameter("frmPhone");
		String memberZipcode = req.getParameter("zipcode");
		String memberAddress = req.getParameter("address");
		String[] phoneFirst = req.getParameterValues("phoneFirst");
		
		
		MemberVo vo = new MemberVo();
		
		vo.setMemberMid(memberMid);
		vo.setMemberPwd(memberPwd);
		vo.setMemberName(memberName);
		vo.setMemberEmail(memberEmail);
		vo.setMemberPhone(memberPhone);
		vo.setMemberZipcode(memberZipcode);
		vo.setMemberAddress(memberAddress);
		
		// 010, 017 유효검사
		if(phoneFirst[0].equals("010")) {
			vo.setMemberPhone(phoneFirst[0] +"-"+ memberPhone);
		}else {
			vo.setMemberPhone(phoneFirst[1] +"-"+ memberPhone);
		}
				
		//객체 이용해서 회원가입 진행
		int result = new MemberService().join(vo);
		
		//insert 결과를 가지고, 화면 선택
		if(result == 1) {
			//회원가입 성공
			System.out.println("회원가입 성공!");
			resp.sendRedirect("/semiTestPrj/views/member/complete.jsp");
		}else {
			//회원가입 실패
			System.out.println("[ERROR-CODE:" + result + "] 회원가입 실패");
			resp.sendRedirect("/semiTestPrj/views/error/errorPage.jsp");
		}
	}
}
