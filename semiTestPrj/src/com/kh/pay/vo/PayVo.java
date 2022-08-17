package com.kh.pay.vo;

public class PayVo {
	private int payNo;
	private int payAmount;
	private String enrollDate;
	private String deleteYn;
	private int memberNo;
	private int payMethodNo;
	private int postNo;
	
	
	
	public PayVo() {
		super();
	}


	public PayVo(int payNo, int payAmount, String enrollDate, String deleteYn, int memberNo, int payMethodNo,
			int postNo) {
		super();
		this.payNo = payNo;
		this.payAmount = payAmount;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.memberNo = memberNo;
		this.payMethodNo = payMethodNo;
		this.postNo = postNo;
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public int getPayAmount() {
		return payAmount;
	}


	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getDeleteYn() {
		return deleteYn;
	}


	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getPayMethodNo() {
		return payMethodNo;
	}


	public void setPayMethodNo(int payMethodNo) {
		this.payMethodNo = payMethodNo;
	}


	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	@Override
	public String toString() {
		return "PayVo [payNo=" + payNo + ", payAmount=" + payAmount + ", enrollDate=" + enrollDate + ", deleteYn="
				+ deleteYn + ", memberNo=" + memberNo + ", payMethodNo=" + payMethodNo + ", postNo=" + postNo + "]";
	}
	
	
	
	
	
}
