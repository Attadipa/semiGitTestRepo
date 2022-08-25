package com.kh.admin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.admin.service.AdminService;
import com.kh.admin.vo.EventVo;
import com.kh.attachment.vo.AttachmentVo;
import com.kh.member.vo.MemberVo;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 50,
		maxRequestSize = 1024 * 1024 * 50 * 5
		)

@WebServlet(urlPatterns = "/event/insert")
public class EventInsertController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String no = req.getParameter("memberNo");
		Part file = req.getPart("file");
		
		
		
		EventVo evo = new EventVo();
		evo.setTitle(title);
		evo.setContent(content);
		evo.setWriter(no);
		
		AttachmentVo avo = null;
		String savePath = "";
		if(file.getSubmittedFileName().length() > 0) {			//제출된 파일 있는 경우
			//파일 업로드
			String originName = file.getSubmittedFileName();	//원본 파일명 얻기
			String changeName = new AdminService().createChangeName(originName);
			
			//인풋 스트림 준비
			InputStream is = file.getInputStream();
			BufferedInputStream bis = new BufferedInputStream(is);
			
			//아웃풋 스트림 준비 (서버에 저장하기 위함)
			String realPath = req.getServletContext().getRealPath("/resources/event");
			savePath = realPath + File.separator + changeName;
			FileOutputStream os = new FileOutputStream(savePath);
			BufferedOutputStream bos = new BufferedOutputStream(os);
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size = bis.read(buf)) != -1) {
				bos.write(buf, 0, size);
			}
			
			bos.flush();
			bis.close();
			bos.close();
			
			//Attachment 테이블 관련 데이터는 위에 준비되어 있음 (원본파일명, 변경파일명, 경로)
			//준비된 데이터를 사용하여, 객체로 뭉치기
			avo = new AttachmentVo();
			avo.setOriginName(originName);
			avo.setChangeName(changeName);
			avo.setFilePath(savePath);
		}
		
		//Event 테이블 채우기(insert)
		int result = new AdminService().insertEvent(evo, avo);
		
		//결과에 따라 작업
		if(result == 1) {
			//성공 -> 이벤트 목록 1페이지 + 알람
			req.setAttribute("alertMsg", "이벤트 [" + title + "] 등록을 성공했습니다!");
			req.getRequestDispatcher("/views/admin/adminForm.jsp").forward(req, resp);
		}else {
			//실패 -> 에러페이지
			//만약 첨부파일이 있었다면? 이미 파일업로드는 끝남 -> 파일 삭제
			req.setAttribute("errorMsg", "이벤트 등록 실패 !");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
			
			if(avo != null) {	//첨부파일이 있음 : 업로드 이미 되어있을 수 있음
				new File(savePath).delete();
			}
		}
	}
	

}
