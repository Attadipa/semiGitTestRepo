package com.kh.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageVo;
import com.kh.community.service.CommunityService;
import com.kh.community.vo.CommunityVo;
import com.kh.community.vo.TypeVo;
import com.kh.notice.service.NoticeService;
import com.kh.notice.vo.NoticeVo;

@WebServlet(urlPatterns = "/community/list")
public class ComListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// -------------------- 페이징 처리 --------------------------
		int listCount;			//현재 총 게시글 갯수
		int currentPage;		//현재 페이지 (==사용자가 요청한 페이지)
		int pageLimit;			//페이지 하단에 보여질 페이지버튼의 최대 갯수
		int boardLimit;			//한 페이지 내 보여질 게시글 최대 갯수
		int maxPage;			//가장 마지막 페이지 (==총 페이지 수)
		int startPage;			//페이징바의 시작
		int endPage;			//페이징바의 끝
		
		listCount = new CommunityService().getCount();//DB에 가서, BOARD 테이블의 총 게시글 갯수
		
		
		currentPage = Integer.parseInt(req.getParameter("p"));
	
		
		pageLimit = 10;
		boardLimit = 20;
		
		maxPage =  (int)Math.ceil(((double)listCount / boardLimit));
		startPage = (currentPage-1)	/ pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		// startPage 가 11이면 endPage 는 20이지만 , maxPage가 15이면 endPage도 15여야 하므로.
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//vo에 페이지 관련 변수 담기
		PageVo pageVo = new PageVo();
		pageVo.setBoardLimit(boardLimit);
		pageVo.setCurrentPage(currentPage);
		pageVo.setEndPage(endPage);
		pageVo.setListCount(listCount);
		pageVo.setMaxPage(maxPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setStartPage(startPage);
		
		//데이터 받아오기
		String type = req.getParameter("type");
		
		CommunityVo vo = new CommunityVo();
		vo.setType(type);
		
		//서비스 호출하기
		List<CommunityVo> voList = new CommunityService().selectList(pageVo, vo);
		
		
		//화면 선택하기
		List<TypeVo> list = new CommunityService().selectTypeList();
		
		req.setAttribute("list", list);
		req.setAttribute("pv", pageVo);
		req.setAttribute("voList", voList);
		
//		if(type == null) {
//			req.getRequestDispatcher("/semiTestPrj/community/list?p=1").forward(req, resp);
//		} else {
			req.setAttribute("type", type);
			req.getRequestDispatcher("/views/community/comList.jsp").forward(req, resp);
//		}
		
	}

}
