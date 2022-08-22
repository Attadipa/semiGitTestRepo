package com.kh.admin.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.vo.MemberVo;

public class AdminDao {

	public List<MemberVo> searchList(Connection conn, String searchData) {
		
		String sql = "SELECT MEMBER_NO, MEMBER_NAME, MEMBER_MID, STATUS FROM MEMBER WHERE MEMBER_NAME LIKE CONCAT(CONCAT('%', ?), '%') OR MEMBER_MID LIKE CONCAT(CONCAT('%', ?), '%') ORDER BY MEMBER_NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVo> list = new ArrayList<MemberVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("MEMBER_NO");
				String name = rs.getString("MEMBER_NAME");
				String id = rs.getString("MEMBER_MID");
				String status = rs.getString("STATUS");
				
				MemberVo vo = new MemberVo();
				vo.setMemberNo(no);
				vo.setMemberName(name);
				vo.setMemberMid(id);
				vo.setStatus(status);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

}
