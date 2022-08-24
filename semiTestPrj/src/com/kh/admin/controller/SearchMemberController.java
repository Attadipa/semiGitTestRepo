package com.kh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.service.AdminService;
import com.kh.common.PageVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/admin/search")
public class SearchMemberController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// ------------------------------ 페이징 처리 --------------------------------
		int listCount;					//현재 총 게시글 갯수
		int currentPage;				//현재 페이지 (==사용자가 요청한 페이지)
		int pageLimit;					//페이지 하단에 보여질 페이지 버튼의 최대 갯수
		int boardLimit;					//한 페이지 내 보여질 게시글 최대 갯수
		// 위의 4개를 이용해서 아래 3개 값 구하기
		int maxPage;					//가장 마지막 페이지 (==총 페이지 수)
		int startPage;					//페이징바의 시작
		int endPage;					//페이징바의 끝
		
		// listCount 값 구하기
		listCount = new AdminService().getCount();//DB에 가서, BOARD 테이블의 총 게시글 갯수

		// currentPage 값 구하기
		currentPage = Integer.parseInt(req.getParameter("p"));
		
		// pageLimit
		pageLimit = 10;
		
		// boardLimit
		boardLimit = 10;
		
		/*
		 * maxPage : 제일 마지막 페이지 (총 페이지 수)
		 * 
		 * listCount(현재 총 게시글 갯수), boardLimit(한 페이지 내 보여질 게시글 최대 갯수)
		 * 위 2개 값 이용하여 구할 수 있음
		 * 
		 * ex) 게시글이 10개씩 보여진다는 가정하에,
		 * 
		 * listCount	|	boardLimit				maxPage
		 *    100.0		/		10		=>	10.0	  10
		 *    101.0		/		10		=>	10.1	  11
		 *    105.0		/		10		=>	10.5	  11
		 *    110.0		/		10		=>	11.0	  11
		 *    111.0		/		10		=>	11.1	  12
		 */
		
		maxPage = (int)Math.ceil(((double)listCount / boardLimit));
		
		/*
		 * startPage : 페이징바의 시작
		 * 
		 * pageLimit(페이지 하단에 보여질 페이지 버튼의 최대 갯수), currentPage(현재 페이지)
		 * 위 2개 값 이용하여 구할 수 있음
		 * 
		 * ex) 페이징바의 목록이 10개 단위라는 가정하에,
		 * 		startPage : 1, 11, 21, 31, 41, 51 ...
		 * 				  : n * pageLimit + 1
		 * 
		 * 	currentPage		startPage			N * pageLimit + 1
		 * 		1				1			=>	0 * pageLimit + 1		// N=0
		 * 		5				1			=>	0 * pageLimit + 1		// N=0
		 * 		10				1			=>	0 * pageLimit + 1		// N=0
		 * 
		 * 		11				11			=>	1 * pageLimit + 1		// N=1
		 * 		15				11			=>	1 * pageLimit + 1		// N=1
		 * 		20				11			=>	1 * pageLimit + 1		// N=1
		 * 
		 * 	   1~10		=>	n=0
		 * 	   11~20 	=>	n=1
		 * 	   21~30 	=>	n=2
		 * 
		 * 		currentPage-1	/ pageLimit	=> n
		 * 			0~9			/	10		=> 0
		 * 			10~19		/	10		=> 1
		 * 			20~29		/	10		=> 2
		 * 
		 * 	
		 */
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		/*
		 * endPage : 페이징바의 끝
		 * 
		 * startPage, pageLimit, (+maxPage)
		 * 위 3개 값의 영향을 받음
		 * 
		 * ex) pageLimit 이 10이라는 가정하에,
		 * 
		 * startPage : 1	=> 10
		 * startPage : 11	=> 20
		 * startPage : 21	=> 30
		 */
		endPage = startPage + pageLimit - 1;
		
		// startPage가 11이면 endPage는 20 //근데, maxPage가 13이면?
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo pageVo = new PageVo();
		pageVo.setBoardLimit(boardLimit);
		pageVo.setCurrentPage(currentPage);
		pageVo.setEndPage(endPage);
		pageVo.setListCount(listCount);
		pageVo.setMaxPage(maxPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setStartPage(startPage);
		
		//준비한 데이터 담기
		req.setAttribute("pv", pageVo);
		req.getRequestDispatcher("/views/admin/adminForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String searchData = req.getParameter("searchData");
		
		List<MemberVo> voList = new AdminService().searchList(searchData);
		
		req.setAttribute("voList", voList);
		req.getRequestDispatcher("/views/admin/adminForm.jsp").forward(req, resp);
		
	}

}
