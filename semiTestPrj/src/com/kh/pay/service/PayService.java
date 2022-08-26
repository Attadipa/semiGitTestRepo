package com.kh.pay.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.ad.repository.AdDao;
import com.kh.ad.vo.AdVo;
import com.kh.delivery.repository.DeliveryDao;
import com.kh.delivery.vo.DeliveryVo;
import com.kh.pay.repository.PayDao;
import com.kh.pay.vo.PayVo;

public class PayService {

	public int insertPay(PayVo payVo) {
		Connection conn = getConnection();
		
		int result = new PayDao().insertPay(conn,payVo);
		
		if(result==1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public int insertPayPlusDel(PayVo payVo, DeliveryVo deliveryVo) {
		Connection conn = getConnection();
		int result = 0;
		
		String da = deliveryVo.getDeliveryAddr();
		String rc = deliveryVo.getRequestContent();
		
		if(da == null || da.equals("")) return result = -2;
		if(rc == null || rc.equals("")) return result = -3;
		
		
		int result1 = new PayDao().insertPay(conn,payVo);
		int result2 = new DeliveryDao().insertDelivery(conn, deliveryVo);
		
		if(result1==1 && result2==1) {
			result = 1;
			commit(conn);
		} else {
			result = -1;
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	

	public int insertPayPlusAd(PayVo payVo, AdVo adVo) {
		Connection conn = getConnection();
		int result = 0;

		int result1 = new PayDao().insertPay(conn,payVo);
		int result2 = new AdDao().insertAd(conn, adVo);
		
		if(result1==1 && result2==1) {
			result = 1;
			commit(conn);
		} else {
			result = -1;
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}



}
