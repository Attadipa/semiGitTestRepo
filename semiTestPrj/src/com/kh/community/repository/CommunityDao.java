package com.kh.community.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.common.PageVo;
import com.kh.community.vo.AttachmentComVo;
import com.kh.community.vo.CommunityVo;
import com.kh.community.vo.TypeVo;

public class CommunityDao {

	// 게시글 총 개수 조회
	public int getCount(Connection conn) {

		// conn 준비

		// sql 준비
		String sql = "SELECT COUNT(NO) AS COUNT FROM COMMUNITY WHERE STATUS ='N'";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			// SQL 을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);

			// SQL 실행 및 결과저장
			rs = pstmt.executeQuery();

			// 실행결과 -> 자바 데이터
			if (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		// 실행결과 리턴
		return count;

	}

	// 타입이 0인 (1+2+3+4)인 리스트 조회하기
	public List<CommunityVo> selectAllList(Connection conn, PageVo pageVo) {
		// conn 준비

		PreparedStatement pstmt = null;
		List<CommunityVo> voList = new ArrayList<CommunityVo>();
		ResultSet rs = null;

		// sql 준비
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM ( SELECT C.NO , C.TYPE, C.TITLE , C.CONTENT , C.CNT , C.ENROLL_DATE , M.MEMBER_NAME AS WRITER FROM COMMUNITY C JOIN MEMBER M ON C.WRITER = M.MEMBER_NO WHERE C.STATUS = 'N' ORDER BY C.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";

		try {
			// sql 담을 객체 준비 및 쿼리 채우기
			pstmt = conn.prepareStatement(sql);

			int start = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			// sql 실행 및 결과 저장
			rs = pstmt.executeQuery();

			// rs -> java
			while (rs.next()) {
				String no = rs.getString("NO");
				String type = rs.getString("TYPE");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String cnt = rs.getString("CNT");
				String enrollDate = rs.getString("ENROLL_DATE");
				String writer = rs.getString("WRITER");

				CommunityVo vo = new CommunityVo();
				vo.setNo(no);
				vo.setType(type);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setCnt(cnt);
				vo.setEnrollDate(enrollDate);
				vo.setWriter(writer);

				voList.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return voList;
	}

	// 타입이 1,2,3,4인 리스트 조회하기
	public List<CommunityVo> selectList(Connection conn, PageVo pageVo, CommunityVo vo) {

		PreparedStatement pstmt = null;
		ArrayList<CommunityVo> voList = new ArrayList<CommunityVo>();
		ResultSet rs = null;

		// sql 준비
		// 타입별리스트
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM ( SELECT C.NO , C.TYPE, C.TITLE , C.CONTENT , C.CNT , C.ENROLL_DATE , M.MEMBER_NAME AS WRITER FROM COMMUNITY C JOIN MEMBER M ON C.WRITER = M.MEMBER_NO WHERE C.STATUS = 'N' AND C.TYPE = ? ORDER BY C.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
		// 전체리스트
//		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM ( SELECT C.NO , C.TYPE, C.TITLE , C.CONTENT , C.CNT , C.ENROLL_DATE , M.MEMBER_NAME AS WRITER FROM COMMUNITY C JOIN MEMBER M ON C.WRITER = M.MEMBER_NO WHERE C.STATUS = 'N' ORDER BY C.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";

		try {
			// sql 담을 객체 준비 및 쿼리 실행
			pstmt = conn.prepareStatement(sql);

			int start = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;

			pstmt.setString(1, vo.getType());
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			// sql 실행 및 결과 저장
			rs = pstmt.executeQuery();

			// rs -> java
			while (rs.next()) {
				String no = rs.getString("NO");
				String type = rs.getString("TYPE");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String cnt = rs.getString("CNT");
				String enrollDate = rs.getString("ENROLL_DATE");
				String writer = rs.getString("WRITER");

				vo = new CommunityVo();
				vo.setNo(no);
				vo.setType(type);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setCnt(cnt);
				vo.setEnrollDate(enrollDate);
				vo.setWriter(writer);

				voList.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(rs);
			close(pstmt);
		}

		// 결과 리턴
		return voList;

	}

	public List<TypeVo> selectTypeList(Connection conn) {

		// conn 준비

		// SQL 준비
		String sql = "SELECT TYPE_NO , TYPE_NAME FROM TYPE";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TypeVo> list = new ArrayList<TypeVo>();

		try {
			// SQL 을 객체에 담기 및 완성
			pstmt = conn.prepareStatement(sql);

			// SQL 실행 및 결과저장
			rs = pstmt.executeQuery();

			// rs -> java
			while (rs.next()) {
				list.add(new TypeVo(rs.getString("TYPE_NO"), rs.getString("TYPE_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		// 결과리턴
		return list;

	}

	public int insertCommunity(Connection conn, CommunityVo cvo) {

		// conn 준비

		// SQL 준비
		String sql = "INSERT INTO COMMUNITY ( NO ,TYPE ,TITLE ,CONTENT ,WRITER ) VALUES ( SEQ_COMMUNITY_NO.NEXTVAL , ? , ? , ? , ? )";

		PreparedStatement pstmt = null;
		int result = 0;

		try {
			// SQL 을 객체에 담기 및 완성하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cvo.getType());
			pstmt.setString(2, cvo.getTitle());
			pstmt.setString(3, cvo.getContent());
			pstmt.setString(4, cvo.getWriter());

			// SQL 실행 및 결과저장
			result = pstmt.executeUpdate();
			System.out.println(result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		// 실행결과 리턴
		return result;

	}

	public int insertAttachment(Connection conn, AttachmentComVo avo) {

		// conn 준비

		// SQL 준비
		String sql = "INSERT INTO ATTACHMENT_COM ( NO ,REF_CNO ,ORIGIN_NAME ,CHANGE_NAME ,FILE_PATH ) VALUES ( SEQ_ATTACHMENT_COM_NO.NEXTVAL , SEQ_COMMUNITY_NO.CURRVAL , ? , ? , ? )";

		PreparedStatement pstmt = null;
		int result = 0;

		try {
			// SQL 을 객체에 담기 및 완성하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, avo.getOriginName());
			pstmt.setString(2, avo.getChangeName());
			pstmt.setString(3, avo.getFilePath());

			// SQL 실행 및 결과저장
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		// 실행결과 리턴
		return result;
	}

	public int increaseCommunity(Connection conn, String num) {

		PreparedStatement pstmt = null;
		int result = 0;

		String sql = "UPDATE COMMUNITY SET CNT=CNT+1 WHERE NO = ? AND STATUS = 'N'";

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

	public CommunityVo selectOne(Connection conn, String num) {

		PreparedStatement pstmt = null;
		CommunityVo vo = null;
		ResultSet rs = null;

		String sql = "SELECT C.NO, C.TITLE, C.CONTENT, M.MEMBER_NAME AS WRITER, C.CNT, C.ENROLL_DATE, C.STATUS FROM COMMUNITY C JOIN MEMBER M ON C.WRITER = M.MEMBER_NO WHERE C.STATUS = 'N' AND C.NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String no = rs.getString("NO");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writer = rs.getString("WRITER");
				String cnt = rs.getString("CNT");
				String enrollDate = rs.getString("ENROLL_DATE");
				String status = rs.getString("STATUS");

				vo = new CommunityVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setCnt(cnt);
				vo.setEnrollDate(enrollDate);
				vo.setStatus(status);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(rs);
			close(pstmt);
		}

		return vo;

	}

	public int delete(Connection conn, String num) {

		PreparedStatement pstmt = null;
		int result = 0;

		String sql = "UPDATE COMMUNITY SET STATUS = 'Y' WHERE NO = ?";

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

	public int edit(Connection conn, CommunityVo vo) {

		PreparedStatement pstmt = null;
		int result = 0;

		String sql = "UPDATE COMMUNITY SET TITLE = ? , CONTENT = ? WHERE NO = ?";

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

	public AttachmentComVo selectAtt(Connection conn, String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AttachmentComVo att = null;
		
		String sql = "SELECT FILE_PATH, CHANGE_NAME FROM ATTACHMENT_COM WHERE REF_CNO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				att = new AttachmentComVo();
				att.setFilePath(rs.getString("FILE_PATH"));
				att.setChangeName(rs.getString("CHANGE_NAME"));
			}
			
		} catch (Exception e) {
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		System.out.println(att);
		return att;
	}

	public int deleteAll(Connection conn, String[] postNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "DELETE COMMUNITY WHERE NO = ?";
		
		try {
			
			for(String k : postNo) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, k);
				
				result = pstmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
