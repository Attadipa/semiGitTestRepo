package com.kh.trade.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.trade.vo.TradeVo;

public class TradeDao {

	public List<TradeVo> selectList(Connection conn) {
		
		//conn 가져오기
		
		
		PreparedStatement pstmt = null;
		List<TradeVo> voList = new ArrayList<TradeVo>();
		ResultSet rs = null;
		
		//sql 준비
		String sql = "SELECT T.NO, T.TITLE, M.NAME AS WRITER, TO_CHAR(T.ENROLL_DATE, 'YY/MM/DD') AS ENROLL_DATE FROM TRADE T JOIN MEMBER M ON T.WRITER = M.NO WHERE T.STATUS = 'N' ORDER BY T.NO DESC";
		
	
			try {
				//sql 담을 객체 준비 및 쿼리 채우기
				pstmt = conn.prepareStatement(sql);
				
				
				//sql 실행 및 결과 저장
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					String no = rs.getString("NO");
					String title = rs.getString("TITLE");
					String writer = rs.getString("WRITER");
					String enrollDate = rs.getString("ENROLL_DATE");
					
					TradeVo vo = new TradeVo();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setWriter(writer);
					vo.setEnrollDate(enrollDate);
					
					voList.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
	
			//결과 리턴
			return voList;
	
	}
}
