package com.kh.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.attachment.vo.AttachmentVo;
import com.kh.common.PageVo;
import com.kh.search.service.SearchService;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@WebServlet(urlPatterns = "/search/category")
public class SearchToCategory extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String category = req.getParameter("c");
		
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
		listCount = new TradeService().getCountForCategory(category);
		
		currentPage = Integer.parseInt(p);
		pageLimit = 10;
		boardLimit = 12;
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
		
		List<TradeVo> searchList = new SearchService().searchToCategory(category, pageVo);
		
		List<AttachmentVo> avo = new TradeService().selectAtt(searchList);
		
		if(avo != null) {
			for(int i=0; i<avo.size();i++) {
				if(avo.get(i).getFilePath() != null) {
					avo.get(i).setFilePath((avo.get(i).getFilePath().substring(14, 27)+avo.get(i).getFilePath().substring(38)+"\\"+avo.get(i).getChangeName()).replace("\\", "/"));
					req.setAttribute("avo", avo);
				} else {
					avo.get(i).setFilePath("");
					req.setAttribute("avo", avo);
				}
			}
		}
		
		if(searchList != null) {
			req.setAttribute("pageVo", pageVo);
			req.setAttribute("searchList", searchList);
			req.getRequestDispatcher("/views/search/searchToCategory.jsp").forward(req, resp);
		} else {
			req.setAttribute("searchErrorMsg", "카테고리 조회 실패 : )");
			req.getRequestDispatcher("/views/search/ToCategory.jsp").forward(req, resp);
		}
	
	}
	
}
