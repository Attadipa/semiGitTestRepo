package com.kh.delivery.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;

import com.kh.delivery.repository.DeliveryDao;
import com.kh.delivery.vo.DeliveryVo;

public class DeliveryService {
	
	DeliveryDao deliveryDao = new DeliveryDao();
	
	public int insertDelivery(DeliveryVo deliveryVo) {
		
		Connection conn = getConnection();
		
		int result = new DeliveryDao().insertDelivery(conn,deliveryVo);
		
		if(result==1) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
}
