package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet(urlPatterns = "/search")
public class SearchController extends HttpServlet{


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String keyword = req.getParameter("keyword");
		String keywordOption = req.getParameter("keyword-option"); 
		
		String[] keywordsArr = keyword.split(" ");
		ArrayList keywordsList = new ArrayList<String>();
		String keywords = "";
		String queryKeyword = "";

		if(!keyword.equals("")) {
			//키워드에 ''붙여줘서 리스트로 만들어놓기
			for(String a : keywordsArr) {
				a = keywordOption +  " LIKE '%" + a + "%'";
				keywordsList.add(a);
			}
			//keyword-option 에 따른 sql where 구문 작성
			keywords = String.join(" OR ", keywordsList);
			
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
			listCount = new TradeService().getCountForSearch(keywords);
			
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
			
			List<TradeVo> searchList = new SearchService().searchToKeywords(keywords, pageVo);
			
			System.out.println(searchList.size());
			
			List<AttachmentVo> avo = new TradeService().selectAtt(searchList);
			
			if(avo.size() != 0) {
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
			if(searchList.size() != 0) {
				req.setAttribute("pageVo", pageVo);
				req.setAttribute("searchList", searchList);
				req.getRequestDispatcher("/views/search/searchList.jsp").forward(req, resp);
			} else {
				req.setAttribute("searchErrorMsg", keyword + " 에 대한 검색 결과가 없습니다 : )");
				req.getRequestDispatcher("/views/search/searchList.jsp").forward(req, resp);
			}
			
		} else {
			// 키워드 입력이나 옵션 선택안하면
			// 검색 실패
			req.setAttribute("searchErrorMsg", "검색 키워드 작성과 옵션 선택을 해주세요 : )");
			req.getRequestDispatcher("/views/search/searchList.jsp").forward(req, resp);
		}

		

		
	}
	
	
}
