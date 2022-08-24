package com.kh.wishlist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.wishlist.service.WishlistService;
import com.kh.wishlist.vo.WishVo;

@WebServlet(urlPatterns = "/wish/check")
public class CheckWishController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String mn = req.getParameter("memberNo");
		String pn = req.getParameter("postNo");
		
		List<WishVo> wvo = new WishlistService().check(mn,pn);
		
		Gson g = new Gson();
		
		String jsonWvo = g.toJson(wvo.size());
		
		resp.getWriter().write(jsonWvo);
	
	}
	
}
