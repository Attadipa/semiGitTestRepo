package com.kh.wishlist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/wishlist")
public class WishlistController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberVo vo = (MemberVo)req.getSession().getAttribute("loginMember");
		
		int memberNo = vo.getMemberNo();
		
		
		
	}
	
}
