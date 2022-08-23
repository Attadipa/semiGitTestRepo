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

public class AdService {
	
	AdDao AdDao = new AdDao();

	public int insertAd(AdVo adVo) {
		
		Connection conn = getConnection();
		int result = AdDao.insertAd(conn,adVo);
		
		if(result==1) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public List<AdVo> selectList(String memberNo,PageVo pageVo) {
		
		Connection conn = getConnection();
		List<AdVo> list = AdDao.selectList(conn,memberNo,pageVo);
		close(conn);
		
		return list;
	}

	public int getCount(String memberNo) {
		
		Connection conn = getConnection();
		
		int count = AdDao.getCount(conn,memberNo);
		
		close(conn);
		
		return count;
	}

}
