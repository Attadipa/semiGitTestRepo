package com.kh.trade.controller;

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

import com.kh.attachment.vo.AttachmentVo;
import com.kh.trade.service.TradeService;
import com.kh.trade.vo.TradeVo;

@MultipartConfig(
//			fileSizeThreshold = 1024 * 1024,
//			location = "/swy/temp",
			maxFileSize = 1024 * 1024 * 50,
			maxRequestSize = 1024 * 1024 * 50 * 5
		)

@WebServlet(urlPatterns = "/trade/insert")
public class TradeInsertController extends HttpServlet {
	
	
	//거래 게시판 작성 화면 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/trade/tradeInsertForm.jsp").forward(req, resp);
	}
	
	//거래 게시판 작성하기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String writerNo = req.getParameter("writerNo");
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String location = req.getParameter("location");
		String condition = req.getParameter("condition");
		String exchange = req.getParameter("exchange");
		String ship = req.getParameter("ship");
		String price = req.getParameter("price");
		String explain = req.getParameter("explain");
		String count = req.getParameter("count");
		Part f = req.getPart("f");
		
		TradeVo tvo = new TradeVo();
		tvo.setWriter(writerNo);
		tvo.setTitle(title);
		tvo.setRefCategoryNo(category);
		tvo.setLocation(location);
		tvo.setCondition(condition);
		tvo.setExchange(exchange);
		tvo.setShip(ship);
		tvo.setPrice(price);
		tvo.setExplain(explain);
		tvo.setCount(count);
		
		AttachmentVo avo = null;
		String savePath = "";
		if(f.getSubmittedFileName().length() > 0) { //제출된 파일 있는 경우
			//파일 업로드
			String originName = f.getSubmittedFileName(); //원본 파일명 얻기
			String changeName = new TradeService().createChangeName(originName);
			
			//인풋 스트림 준비
			InputStream is = f.getInputStream();
			BufferedInputStream bis = new BufferedInputStream(is);
			
			//아웃풋 스트림 준비 (서버에 저장하기 위함)
			String realPath = req.getServletContext().getRealPath("/resources/upload");
			savePath = realPath + File.separator + changeName;
			FileOutputStream os = new FileOutputStream(savePath);
			BufferedOutputStream bos = new BufferedOutputStream(os);
			
			//실제로 파일 업로드 하기 (근데 좀 느림)
//			int data = 0;
//			while((data = is.read()) != -1) {
//				os.write(data);
//			}
			
			byte[] buf = new byte[1024];
			int size = 0;
			while( (size = bis.read(buf)) != -1 ) {
				bos.write(buf, 0, size);
			}
			
			bos.flush();
			bis.close();
			bos.close();
			
			//Attachment 테이블 관련 데이터는 위에 준비 되어있는 상태 (원본파일명, 변경파일명, 경로)
			//준비된 데이터를 사용하여, 객체로 뭉치기
			avo = new AttachmentVo();
			avo.setOriginName(originName);
			avo.setChangeName(changeName);
			avo.setFilePath(realPath);
		}

		int result = new TradeService().insert(tvo, avo);
//		System.out.println(result);
		
		if(result == 1) {
			//작성 성공-> 리스트 보여주기
			req.setAttribute("alertMsg", "글이 작성되었습니다");
			resp.sendRedirect("/semiTestPrj/trade/myList?p=1");
		} else {
			//작성 실패 -> 에러페이지
			req.setAttribute("errorPage", "작성에 실패하셨습니다.");
			req.getRequestDispatcher("/views/error/errorPage.jsp").forward(req, resp);
		}
		
		
		
	}

}
