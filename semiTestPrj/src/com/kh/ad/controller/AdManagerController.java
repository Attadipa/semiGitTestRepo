package com.kh.ad.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ad.service.AdService;
import com.kh.ad.vo.AdVo;
import com.kh.common.PageVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/ad/manager")
public class AdManagerController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		
		String memberNo = loginMember.getMemberNo();
		
		int listCount; 		//현재 총 게시글 갯수
		int currentPage;	//현재 페이지(사용자가 요청한 페이지)
		int pageLimit;		//페이지 하단에 보여질 페이지버튼의 최대 갯수
		int boardLimit;		//한 페이지 내 보여질 게시글 최대 갯수
		//위의 4개를 이용해서 아래 3개 값 구하기
		int maxPage;		//가장 마지막 페이지(총 페이지 수)
		int startPage;		//페이징 바의 시작
		int endPage;		//페이징 바의 끝
		
		listCount = new AdService().getCount(memberNo);
		currentPage = Integer.parseInt(req.getParameter("p"));
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil(((double)listCount/boardLimit));
		startPage = (currentPage-1)/boardLimit * pageLimit +1;
		endPage = startPage + pageLimit-1;
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		PageVo pageVo = new PageVo();
		pageVo.setBoardLimit(boardLimit);
		pageVo.setCurrentPage(currentPage);
		pageVo.setEndPage(endPage);
		pageVo.setListCount(listCount);
		pageVo.setMaxPage(maxPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setStartPage(startPage);
		
		
		List<AdVo> list = new AdService().selectList(memberNo,pageVo);
	
		
		if(list != null) {
			req.setAttribute("pv", pageVo);
			req.setAttribute("adList",list);
			req.getRequestDispatcher("/views/ad/adManager.jsp").forward(req, resp);			
		} else {
			req.setAttribute("errorMsg","내 광고목록 불러오기 실패");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
	}
}
