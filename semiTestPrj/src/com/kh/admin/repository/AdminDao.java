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

	public MemberVo selectOne(Connection conn, String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		String sql = "SELECT MEMBER_MID, MEMBER_NAME, MEMBER_PWD, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS, MEMBER_ZIPCODE, MEMBER_GRADE FROM MEMBER WHERE MEMBER_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String mId = rs.getString("MEMBER_MID");
				String name = rs.getString("MEMBER_NAME");
				String pwd = rs.getString("MEMBER_PWD");
				String phone = rs.getString("MEMBER_PHONE");
				String email = rs.getString("MEMBER_EMAIL");
				String address = rs.getString("MEMBER_ADDRESS");
				String zipCode = rs.getString("MEMBER_ZIPCODE");
				String grade = rs.getString("MEMBER_GRADE");
				
				vo = new MemberVo();
				vo.setMemberNo(num);
				vo.setMemberMid(mId);
				vo.setMemberPwd(pwd);
				vo.setMemberPhone(phone);
				vo.setMemberEmail(email);
				vo.setMemberAddress(address);
				vo.setMemberZipcode(zipCode);
				vo.setMemberGrade(grade);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return vo;
	}

}
