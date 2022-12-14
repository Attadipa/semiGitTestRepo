package com.kh.ad.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.ad.repository.AdDao;
import com.kh.ad.vo.AdVo;
import com.kh.common.PageVo;
import com.kh.pay.repository.PayDao;
import com.kh.trade.vo.TradeVo;

public class AdService {
	
	AdDao adDao = new AdDao();

	public int insertAd(AdVo adVo) {
		
		Connection conn = getConnection();
		int result = adDao.insertAd(conn,adVo);
		
		if(result==1) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public List<AdVo> selectList(String memberNo,PageVo pageVo) {
		
		Connection conn = getConnection();
		List<AdVo> list = adDao.selectList(conn,memberNo,pageVo);
		close(conn);
		
		return list;
	}

	public int getCount(String memberNo) {
		
		Connection conn = getConnection();
		
		int count = adDao.getCount(conn,memberNo);
		
		close(conn);
		
		return count;
	}

	public int getCountNotAd(String memberNo) {
		
		Connection conn = getConnection();
		
		int count = adDao.getCountNotAd(conn,memberNo);
		
		close(conn);
		
		return count;
	}

	public List<TradeVo> selectNotAdList(String memberNo, PageVo pageVo) {
		Connection conn = getConnection();
		List<TradeVo> list = adDao.selectNotAdList(conn,memberNo,pageVo);
		close(conn);
		
		return list;
	}

	public int deleteAdPlusPay(String memberNo, String tradeNo) {
		
		Connection conn = getConnection();
		
		int result = 0;
		int result1 = adDao.deleteAd(conn,tradeNo);
		System.out.println("result1 "+result1);
		int result2 = new PayDao().deletePay(conn,memberNo,tradeNo);
		System.out.println("result2 "+result2);
		if(result1==1 && result2==1) {
			result=1;
			commit(conn);
		}
		else {
			result=-1;
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
