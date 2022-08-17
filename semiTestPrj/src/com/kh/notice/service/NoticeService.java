package com.kh.notice.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.notice.repository.NoticeDao;
import com.kh.notice.vo.NoticeVo;

public class NoticeService {
	
	private final NoticeDao dao = new NoticeDao();

	//공지사항 리스트 조회하기
	public ArrayList<NoticeVo> selectList() {
		
		Connection conn = null;
		ArrayList<NoticeVo> voList = null;
		
		//서비스 로직 작성 ㄴㄴ
		
		
		try {
			//dao 호출하기
			conn = getConnection();
			voList = dao.selectList(conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//트랜잭션 처리
			close(conn);
		}
		
		//실행결과 리턴
		return voList;
	}

	
	
	//공지사항 작성하기
	public int insert(NoticeVo vo) {
		
		Connection conn = null;
		int result = 0;
		
		//서비스 로직 작성하기
		if(vo.getTitle().length() > 20) {
			System.out.println("제목이 20글자를 초과하였습니다.");
			return -1;
		}
		
		if(vo.getContent().length() > 500) {
			System.out.println("내용이 500글자를 초과하였습니다.");
			return -2;
		}
		
		try {
			//dao 호출하기
			conn = getConnection();
			result = dao.insert(conn, vo);
			
			//트랜잭션 처리
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		//결과 리턴
		return result;
	}

}
