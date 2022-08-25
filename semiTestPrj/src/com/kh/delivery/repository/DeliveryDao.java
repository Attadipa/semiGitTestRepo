package com.kh.delivery.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.kh.common.JDBCTemplate.*;
import com.kh.delivery.vo.DeliveryVo;

public class DeliveryDao {

	public int insertDelivery(Connection conn, DeliveryVo deliveryVo) {
		String sql = "INSERT INTO DELIVERY (DELIVERY_NO, DELIVERY_ADDR, REQUEST_CONTENT, TRADE_NO, ENROLL_DATE, DELETE_YN)"
				  + " VALUES (SEQ_DELIVERY_NO.NEXTVAL, ?, ?, ?,DEFAULT,DEFAULT)";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, deliveryVo.getDeliveryAddr());
			pstmt.setString(2, deliveryVo.getRequestContent());
			pstmt.setInt(3, Integer.parseInt(deliveryVo.getTradeNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
		
	}

}
