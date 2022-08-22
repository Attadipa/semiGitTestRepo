package com.kh.wishlist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.wishlist.service.WishlistService;
import com.kh.wishlist.vo.WishVo;

@WebServlet(urlPatterns = "/wishlist/insert")
public class InsertWishlist extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String tn = req.getParameter("postNo");
		String mn = req.getParameter("memberNo");
		String title = req.getParameter("title");
		
		WishVo vo = new WishVo();
		vo.setPostNo(tn);
		vo.setMemberNo(mn);
		vo.setTitle(title.trim());
		
		int result =  new WishlistService().Insert(vo);
		
		
		if(result==1) {
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print("장바구니에 추가되었습니다.");
		}
		
	}
	
}
