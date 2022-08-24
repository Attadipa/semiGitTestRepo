package com.kh.wishlist.service;
import static com.kh.common.JDBCTemplate.*;

import com.kh.common.PageVo;
import com.kh.trade.vo.TradeVo;
import com.kh.wishlist.dao.WishlistDao;
import com.kh.wishlist.vo.WishVo;

import java.sql.Connection;
import java.util.List;


public class WishlistService {

	private WishlistDao dao = new WishlistDao();
	
	public int Insert(WishVo vo) {

		Connection conn = getConnection();
		int result = 0;
		
		result = dao.insert(conn, vo);
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		} 
		close(conn);
		
		
		
		return result;
	}

	public int getCountForMy(String memberNo) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = getConnection();
			result = dao.getCountForWishlist(conn, memberNo);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		
		return result;
	}

	public List<WishVo> list(String memberNo, PageVo pageVo) {
		Connection conn = null;
		List<WishVo> voList = null;
		
		
		conn = getConnection();
		voList = dao.list(conn, memberNo, pageVo);
		
		close(conn);
		
		return voList;
	}

	public int delete(String[] postNo) {
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.delete(conn, postNo);
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		} 
		close(conn);
		
		return result;
	}

}
