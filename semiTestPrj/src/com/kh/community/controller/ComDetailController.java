package com.kh.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.repository.CommunityDao;
import com.kh.community.service.CommunityService;
import com.kh.community.vo.AttachmentComVo;
import com.kh.community.vo.CommunityVo;

@WebServlet(urlPatterns = "/community/detail")
public class ComDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//num번 게시글의 조회수 증가 시키기
		String num = req.getParameter("num");
		
		int result = new CommunityService().increaseCommunity(num);
		
		
		if(result == 1) {
			//조회수 증가 성공 조건 통과 시에만 -> 디비에서 특정 게시글 정보 조회
			CommunityVo vo =  new CommunityService().selectOne(num);
			AttachmentComVo att = new CommunityService().selectAtt(num);
			
			if(vo != null) {
				//조회 성공 -> 정보를 담아 포워딩
				req.setAttribute("vo", vo);
				
				if(att != null) {
					 att.setFilePath((att.getFilePath().substring(18, 31)+att.getFilePath().substring(42)+"\\"+att.getChangeName()).replace("\\", "/"));
					 System.out.println(att.getFilePath());
					 req.setAttribute("att", att);
				}
				req.getRequestDispatcher("/views/community/comDetail.jsp").forward(req, resp);
				
			} else {
				//조회 실패 -> 에러페이지
				req.setAttribute("errorMsg", "조회에 실패하셨습니다.");
				req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
			}
			
		} else {
			//조회수 증가 실패 -> 에러페이지
			req.setAttribute("errorMsg", "조회에 실패하셨습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
	}

}
