package com.kh.ad.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ad.service.AdService;
import com.kh.common.PageVo;
import com.kh.member.vo.MemberVo;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/ad/request")
public class AdRequestController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memberNo = ((MemberVo)req.getSession().getAttribute("loginMember")).getMemberNo();
		String p = req.getParameter("p");
		
		//페이징 처리
		int listCount;		//현재 총 게시글 갯수
		int currentPage;	//현재 페이지(==사용자가 요청한 페이지)
		int pageLimit;		//페이지 하단에 보여질 페이지 버튼의 최대 갯수
		int boardLimit;		//한 페이지 내 보여질 게시글 최대 갯수
		int maxPage;		//가장 마지막 페이지 (==총 페이지 수)
		int startPage;		//페이징바의 시작
		int endPage;		//페이징바의 끝
		
		//listCount 값 구하기
		listCount = new AdService().getCountNotAd(memberNo);
		
		currentPage = Integer.parseInt(p);
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int) Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1 ;
		endPage = startPage + pageLimit - 1;
		if(endPage>maxPage) endPage = maxPage;
		

		PageVo pageVo = new PageVo();
		pageVo.setBoardLimit(boardLimit);
		pageVo.setCurrentPage(currentPage);
		pageVo.setEndPage(endPage);
		pageVo.setListCount(listCount);
		pageVo.setMaxPage(maxPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setStartPage(startPage);
		
		List<TradeVo> voList = new AdService().selectNotAdList(memberNo, pageVo);
		
		if(voList != null) {
			//조회 성공 -> tradeList 화면 보여주기
			req.setAttribute("pv", pageVo);
			req.setAttribute("voList", voList);
			req.getRequestDispatcher("/views/ad/adRequest.jsp").forward(req, resp);
		} else {
			//실패
			req.setAttribute("errorMsg", "조회 결과가 없습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	}
	
}
