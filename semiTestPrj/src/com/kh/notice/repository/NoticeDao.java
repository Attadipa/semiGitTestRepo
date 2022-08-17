package com.kh.notice.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.notice.vo.NoticeVo;

public class NoticeDao {

	public ArrayList<NoticeVo> selectList(Connection conn) {
		
		PreparedStatement pstmt = null;
		ArrayList<NoticeVo> voList = new ArrayList<NoticeVo>();
		ResultSet rs = null;
		
		//conn준비
		
		//sql 준비
		String sql = "SELECT N.NO ,N.TITLE ,N.CONTENT ,N.CNT ,TO_CHAR(N.ENROLL_DATE, 'YY/MM/DD HH:MI') AS ENROLL_DATE ,N.STATUS ,M.NAME AS WRITER FROM NOTICE N JOIN MEMBER M ON N.WRITER = M.NO WHERE N.STATUS = 'N' ORDER BY NO DESC";
		
		
		try {
			//sql 담을 객체 준비 및 쿼리 채우기
			pstmt = conn.prepareStatement(sql);
			
			
			//sql 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//rs -> java
			while(rs.next()) {
				String no = rs.getString("NO");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writer = rs.getString("WRITER");
				String enrollDate = rs.getString("ENROLL_DATE");
				String cnt = rs.getString("CNT");
				String status = rs.getString("STATUS");
				
				NoticeVo vo = new NoticeVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setEnrollDate(enrollDate);
				vo.setCnt(cnt);
				vo.setStatus(status);
				
				voList.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		

		//실행 결과 리턴
		return voList;
	}

	public int insert(Connection conn, NoticeVo vo) {
		
		//conn 준비
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		//sql 준비
		String sql = "INSERT INTO NOTICE ( NO ,TITLE ,CONTENT ,WRITER ) VALUES ( SEQ_NOTICE_NO.NEXTVAL , ? , ? , ? )";
		
		//sql 담을 객체 준비 및 쿼리 실행
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getWriter());
			
			//sql 실행 및 결과 저장
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		
		
		//결과 리턴
		return result;
	}


}