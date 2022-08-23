package com.kh.pay.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.pay.vo.PayVo;

public class PayDao {

	public int insertPay(Connection conn, PayVo payVo) {
		String sql = "INSERT INTO PAY (PAY_NO, PAY_METHOD_NO, TRADE_NO, MEMBER_NO, PAY_AMOUNT, ENROLL_DATE,DELETE_YN) "
				   + "VALUES (SEQ_PAY_NO.NEXTVAL, ?, ?, ?, ?,DEFAULT, DEFAULT)";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, Integer.parseInt(payVo.getPayMethodNo()));
			pstmt.setInt(2, Integer.parseInt(payVo.getTradeNo()));
			pstmt.setInt(3, Integer.parseInt(payVo.getMemberNo()));
			pstmt.setInt(4, Integer.parseInt(payVo.getPayAmount()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}



}
