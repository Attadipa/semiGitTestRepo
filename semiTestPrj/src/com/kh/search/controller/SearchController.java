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
		
		// 화면에서 검색에 필요한 키워드와 키워드 옵션 받아오기
		String keyword = req.getParameter("keyword");
		String keywordOption = req.getParameter("keyword-option"); 
		
		// 한개 이상의 키워드에 대하여 배열로 변환해주기
		String[] keywordsArr = keyword.split(" ");
		ArrayList keywordsList = new ArrayList<String>();
		String keywords = "";
		String queryKeyword = "";

		if(!keyword.equals("")) {
			
			//키워드 배열의 value 마다 sql where 구문에 대한 조건식을 달아 다시 리스트에 저장 해주기
			for(String a : keywordsArr) {
				a = keywordOption +  " LIKE '%" + a + "%'";
				keywordsList.add(a);
			}
			
			//keyword-option 에 따른 sql where 구문 작성
			keywords = String.join(" OR ", keywordsList);
			
			//아래부턴 리스트 호출 시 필요한 페이징 처리 작업
			String p = req.getParameter("p");
			int listCount;		//현재 총 게시글 갯수
			int currentPage;	//현재 페이지(==사용자가 요청한 페이지)
			int pageLimit;		//페이지 하단에 보여질 페이지 버튼의 최대 갯수
			int boardLimit;		//한 페이지 내 보여질 게시글 최대 갯수
			int maxPage;		//가장 마지막 페이지 (==총 페이지 수)
			int startPage;		//페이징바의 시작
			int endPage;		//페이징바의 끝
			
			//검색 결과에 따른 총 게시글 수 조회하는 메소드 호출하여 변수에 값 저장
			listCount = new TradeService().getCountForSearch(keywords);
			
			//페이지 처리에 관한 변수 설정
			currentPage = Integer.parseInt(p);
			pageLimit = 10;
			boardLimit = 12;
			maxPage = (int) Math.ceil((double)listCount / boardLimit);
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1 ;
			endPage = startPage + pageLimit - 1;
			if(endPage>maxPage) endPage = maxPage;
			
			//페이지에 관련한 객체 생성 및 값 할당
			PageVo pageVo = new PageVo();
			pageVo.setBoardLimit(boardLimit);
			pageVo.setCurrentPage(currentPage);
			pageVo.setEndPage(endPage);
			pageVo.setListCount(listCount);
			pageVo.setMaxPage(maxPage);
			pageVo.setPageLimit(pageLimit);
			pageVo.setStartPage(startPage);
			
			//키워드와, 페이지를 이용하여 게시글에 대한 정보를 담아와서 거래 게시글 vo 타입의 리스트에 담아줌
			List<TradeVo> searchList = new SearchService().searchToKeywords(keywords, pageVo);
			
			//거래 게시글마다 있는 첨부파일의 경로도 담아와줌
			List<AttachmentVo> avo = new TradeService().selectAtt(searchList);
			
			//첨부파일의 경로를 실제로 사용 할 수 있게 처리 해 주는 작업
			//이 작업 후 페이지에 보낼 attribute에 담아준다.
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
			
			//조회 게시글 수로 판단하여 페이징 처리 해주는 작업
			if(searchList.size() != 0) {
				//페이지에 관련된 정보와, 게시글 정보를 보내준다.
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
