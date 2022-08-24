package com.kh.trade.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.attachment.vo.AttachmentVo;
import com.kh.common.PageVo;
import com.kh.trade.vo.TradeVo;

public class TradeDao {

	public List<TradeVo> selectMyList(Connection conn, String myNo, PageVo pageVo) {
		
		PreparedStatement pstmt = null;
		List<TradeVo> list = new ArrayList<TradeVo>();
		ResultSet rs = null;
		
		//sql 준비
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM (SELECT T.TRADE_NO, T.CNT, T.TITLE, TO_CHAR(T.ENROLL_DATE, 'YY/MM/DD HH:MI') ENROLL_DATE FROM TRADE T JOIN MEMBER M ON T.WRITER = M.MEMBER_NO WHERE WRITER = ? ORDER BY TRADE_NO DESC) T ) WHERE RNUM BETWEEN ? AND ?";
		
	
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage() - 1) * pageVo.getBoardLimit() + 1;
			int end   = start + pageVo.getBoardLimit() - 1;
			
			pstmt.setString(1, myNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TradeVo vo = new TradeVo();
				
				vo.setTradeNo(rs.getString("TRADE_NO"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setCnt(rs.getString("CNT"));
				vo.setEnrollDate(rs.getString("ENROLL_DATE"));
				
				list.add(vo);
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	
	}

	public int insert(Connection conn, TradeVo vo) {
		
		//conn 준비
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		//sql 준비
		String sql = "INSERT INTO TRADE(TRADE_NO, WRITER, TITLE, REF_CATEGORY_NO, LOCATION, CONDITION, EXCHANGE, SHIP, PRICE, EXPLAIN, COUNT) VALUES (SEQ_TRADE_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
		try {
			//sql 담을 객체 준비 및 쿼리 채우기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getRefCategoryNo());
			pstmt.setString(4, vo.getLocation());
			pstmt.setString(5, vo.getCondition());
			pstmt.setString(6, vo.getExchange());
			pstmt.setString(7, vo.getShip());
			pstmt.setString(8, vo.getPrice());
			pstmt.setString(9, vo.getExplain());
			pstmt.setString(10, vo.getCount());
			
			
			//sql 실행 및 결과 저장
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		
			//실행 결과 리턴
		System.out.println(result);
			return result;
	}

	//키워드 검색을 위한 cnt 조회
	public int getCountForSearch(Connection conn, String keywords) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(TRADE_NO) AS COUNT FROM TRADE WHERE STATUS = 'N' AND " + keywords;
		
		try {
			//SQL을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//실행결과 -> 자바 데이터
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}
	//카테고리 검색을 위한 cnt 조회
	public int getCountForCategory(Connection conn, String category) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(TRADE_NO) AS COUNT FROM TRADE WHERE STATUS = 'N' AND REF_CATEGORY_NO = ?";
		
		try {
			//SQL을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//실행결과 -> 자바 데이터
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}

	public int increaseTrade(Connection conn, String num) {
		//conn준비
		//sql준비
		String sql = "UPDATE TRADE SET CNT = CNT+1 WHERE TRADE_NO=? AND STATUS='N'";
		//sql객체에 담기 -> 물음표 채우기
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			//sql 실행 및 결과 저장
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//결과 리턴
		return result;
	}

	public TradeVo selectOne(Connection conn, String num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TradeVo vo = null;
		
		//sql 준비
		String sql = "SELECT M.MEMBER_MID WRITER, T.TITLE, TO_CHAR(T.ENROLL_DATE, 'YY/MM/DD HH:MI') ENROLL_DATE, T.CNT, T.PRICE, T.EXPLAIN, T.CONDITION, T.SHIP, T.EXCHANGE FROM TRADE T JOIN MEMBER M ON T.WRITER = M.MEMBER_NO WHERE TRADE_NO = ?";
		
		try {
			//sql 객체에 담기 -> 물음표 채욱
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			//sql 실행 및 결과 저장
			rs = pstmt.executeQuery();

			if(rs.next()) {
				String tradeNo = num;
				String title = rs.getString("TITLE");
				String writer = rs.getString("WRITER");
				String enrollDate = rs.getString("ENROLL_DATE");
				String content = rs.getString("EXPLAIN");
				String cnt = rs.getString("CNT");
				String price = rs.getString("PRICE");
				String condition = rs.getString("CONDITION");
				String ship = rs.getString("SHIP");
				String exchange = rs.getString("EXCHANGE");
				
				vo = new TradeVo();
				vo.setTradeNo(tradeNo);
				vo.setTitle(title);
				vo.setWriter(writer);
				vo.setEnrollDate(enrollDate);
				vo.setExplain(content);
				vo.setCnt(cnt);
				vo.setPrice(price);
				vo.setCondition(condition);
				vo.setShip(ship);
				vo.setExchange(exchange);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		//결과 리턴
		return vo;
	}
	
	public AttachmentVo selectAtt(Connection conn, String num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AttachmentVo vo = null;
		
		//sql 준비
		String sql = "SELECT FILE_PATH, CHANGE_NAME FROM ATTACHMENT WHERE REF_TNO = ?";
		
		try {
			//sql 객체에 담기 -> 물음표 채욱
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			//sql 실행 및 결과 저장
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new AttachmentVo();
				vo.setFilePath(rs.getString("FILE_PATH"));
				vo.setChangeName(rs.getString("CHANGE_NAME"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		//결과 리턴
		return vo;
	}

	public int getCountForMy(Connection conn, String myNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(TRADE_NO) AS COUNT FROM TRADE WHERE STATUS = 'N' AND WRITER = ?";
		
		try {
			//SQL을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myNo);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			//실행결과 -> 자바 데이터
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}

	public int insertAttachment(Connection conn, AttachmentVo avo) {
		//SQL 준비
		String sql = "INSERT INTO ATTACHMENT ( NO ,REF_TNO ,ORIGIN_NAME ,CHANGE_NAME ,FILE_PATH ) VALUES ( SEQ_ATTACHMENT_NO.NEXTVAL , SEQ_TRADE_NO.CURRVAL , ? , ? , ? )";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			//SQL 을 객체에 담기 및 완성하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, avo.getOriginName());
			pstmt.setString(2, avo.getChangeName());
			pstmt.setString(3, avo.getFilePath());
			
			//SQL 실행 및 결과저장
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		//실행결과 리턴
		return result;
	}

	public List<AttachmentVo> selectAtt(Connection conn, List<TradeVo> tvo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AttachmentVo> voList = new ArrayList<AttachmentVo>();
		
		//sql 준비
		String sql = "SELECT FILE_PATH, CHANGE_NAME FROM ATTACHMENT WHERE REF_TNO = ?";
		
		try {
			for(int i = 0; i < tvo.size(); i++) {
				//sql 객체에 담기 -> 물음표 채욱
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, tvo.get(i).getTradeNo());
				//sql 실행 및 결과 저장
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					AttachmentVo vo = new AttachmentVo();
					vo.setFilePath(rs.getString("FILE_PATH"));
					vo.setChangeName(rs.getString("CHANGE_NAME"));
					
					voList.add(vo);
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		//결과 리턴
		return voList;
	
	}

	public List<TradeVo> today(Connection conn) {
		ResultSet rs = null;
		List<TradeVo> list = new ArrayList<TradeVo>();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM (SELECT T.TRADE_NO, M.MEMBER_MID WRITER,T.TITLE, TO_CHAR(T.ENROLL_DATE, 'YY/MM/DD HH:MI') ENROLL_DATE FROM TRADE T JOIN MEMBER M ON T.WRITER = M.MEMBER_NO ORDER BY CNT DESC) T ) WHERE RNUM BETWEEN 1 AND 6";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TradeVo vo = new TradeVo();
				
				vo.setTradeNo(rs.getString("TRADE_NO"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setEnrollDate(rs.getString("ENROLL_DATE"));
				
				list.add(vo);
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;

	}

}


