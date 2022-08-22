package com.kh.pay.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;
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
		
		return result;
		
	}

	public int insertDelivery() {
		// TODO Auto-generated method stub
		return 0;
	}



}
