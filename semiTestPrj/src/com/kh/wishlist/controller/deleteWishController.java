package com.kh.wishlist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.wishlist.service.WishlistService;

@WebServlet(urlPatterns = "/wish/delete")
public class deleteWishController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] postNo = req.getParameterValues("postNo");
		
		int result = new WishlistService().delete(postNo);
		
		if(result==1) {
			req.getSession().setAttribute("alertMsg", "관심상품을 삭제했습니다.");
			resp.sendRedirect("/semiTestPrj/member/wishlist?p=1");
		}
	
	}
	
}
