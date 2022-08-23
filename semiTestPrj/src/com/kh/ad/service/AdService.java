package com.kh.ad.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.ad.repository.AdDao;
import com.kh.ad.vo.AdVo;

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

	public List<AdVo> selectList(String memberNo) {
		
		Connection conn = getConnection();
		
		List<AdVo> list = AdDao.selectList(conn,memberNo);
		
		if(list != null) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return list;
	}

}
