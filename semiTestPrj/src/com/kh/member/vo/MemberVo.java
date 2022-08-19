package com.kh.member.vo;

import java.sql.Timestamp;

public class MemberVo {

	//기본생성자
	public MemberVo() {
		
	}
	

	public MemberVo(int memberNo, String memberMid, String memberPwd, String memberName, String memberEmail,
			String memberPhone, String memberAddress, String memberZipcode, Timestamp memberEnrollDate,
			Timestamp memberModifyDate, String status) {
	
		this.memberNo = memberNo;
		this.memberMid = memberMid;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberZipcode = memberZipcode;
		this.memberEnrollDate = memberEnrollDate;
		this.memberModifyDate = memberModifyDate;
		this.status = status;
	}



	//회원 가입시 사용하는 생성자
	public MemberVo(
			String memberMid,
			String memberPwd,
			String memberPwd2,
			String memberName,
			String memberEmail,
			String memberPhone,
			String memberAddress,
			String memberZipcode) {
		this.memberMid = memberMid;
		this.memberPwd = memberPwd;
		this.memberPwd = memberPwd2;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberZipcode = memberZipcode;
	}




	//field
	private int memberNo;
	private String memberMid;
	private String memberPwd;
	private String memberPwd2;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberAddress;
	private String memberZipcode;
	private Timestamp memberEnrollDate;
	private Timestamp memberModifyDate;
	private String status;
	
	//getter / setter
	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public String getMemberMid() {
		return memberMid;
	}



	public void setMemberMid(String memberMid) {
		this.memberMid = memberMid;
	}



	public String getMemberPwd() {
		return memberPwd;
	}



	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	

	public String getMemberPwd2() {
		return memberPwd2;
	}


	public void setMemberPwd2(String memberPwd2) {
		this.memberPwd2 = memberPwd2;
	}
	

	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public String getMemberPhone() {
		return memberPhone;
	}



	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}



	public String getMemberAddress() {
		return memberAddress;
	}



	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}




	public String getMemberZipcode() {
		return memberZipcode;
	}



	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}



	public Timestamp getMemberEnrollDate() {
		return memberEnrollDate;
	}



	public void setMemberEnrollDate(Timestamp memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}



	public Timestamp getMemberModifyDate() {
		return memberModifyDate;
	}



	public void setMemberModifyDate(Timestamp memberModifyDate) {
		this.memberModifyDate = memberModifyDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}


	//toString
		@Override
		public String toString() {
			return "MemberVo [memberNo=" + memberNo + ", memberMid=" + memberMid + ", memberPwd=" + memberPwd
					+ ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone
					+ ", memberZipcode=" + memberZipcode + ", memberAddress=" + memberAddress + ", memberEnrollDate="
					+ memberEnrollDate + ", memberModifyDate=" + memberModifyDate + ", status=" + status + "]";
		}






	
	
}
