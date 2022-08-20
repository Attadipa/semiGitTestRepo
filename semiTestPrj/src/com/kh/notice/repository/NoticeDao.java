package com.kh.notice.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.PageVo;
import com.kh.notice.vo.NoticeVo;

public class NoticeDao {

	public ArrayList<NoticeVo> selectList(Connection conn, PageVo pageVo) {
		
		PreparedStatement pstmt = null;
		ArrayList<NoticeVo> voList = new ArrayList<NoticeVo>();
		ResultSet rs = null;
		
		//conn준비
		
		//sql 준비
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM ( SELECT N.NO , N.TITLE , N.CONTENT , N.CNT , N.ENROLL_DATE , M.MEMBER_NAME AS WRITER FROM NOTICE N JOIN MEMBER M ON N.WRITER = M.MEMBER_NO WHERE N.STATUS = 'N' ORDER BY N.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
		
		try {
			//sql 담을 객체 준비 및 쿼리 채우기
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
				
				NoticeVo vo = new NoticeVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setEnrollDate(enrollDate);
				vo.setCnt(cnt);
				
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


	public int increseNotice(Connection conn, String num) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE NOTICE SET CNT=CNT+1 WHERE NO = ? AND STATUS = 'N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public NoticeVo selectOne(Connection conn, String num) {
		
		//conn 준비
		
		PreparedStatement pstmt = null;
		NoticeVo vo = null;
		ResultSet rs = null;
		
		//sql 준비
		String sql = "SELECT N.NO, N.TITLE, N.CONTENT, M.MEMBER_NAME AS WRITER, N.CNT, N.ENROLL_DATE, N.STATUS FROM NOTICE N JOIN MEMBER M ON N.WRITER = M.MEMBER_NO WHERE N.STATUS = 'N' AND N.NO = ?";
		
		//sql 담을 객체 준비 및 쿼리 채우기
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			//sql 실행 및 결과 저장 (rs ->java)
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String no = rs.getString("NO");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writer = rs.getString("WRITER");
				String enrollDate = rs.getString("ENROLL_DATE");
				String cnt = rs.getString("CNT");
				String status = rs.getString("STATUS");
				
				vo = new NoticeVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setEnrollDate(enrollDate);
				vo.setCnt(cnt);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
			close(rs);
		}
		
		//실행 결과 리턴
		return vo;
	}

	public int delete(Connection conn, String num) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE NOTICE SET STATUS = 'Y' WHERE NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int edit(Connection conn, NoticeVo vo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE NOTICE SET TITLE = ? , CONTENT = ? WHERE NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}

	public int getCount(Connection conn) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		//SQL 준비
		String sql = "SELECT COUNT(NO) AS COUNT FROM NOTICE WHERE STATUS = 'N'";
		
		
		try {
			//SQL 을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			
			//SQL 실행 및 결과저장
			rs = pstmt.executeQuery();
			
			//실행결과 -> 자바 데이터
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		//실행결과 리턴
		return count;
			
	}


}
