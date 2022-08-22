package com.kh.pay.vo;

public class PayVo {
	private String payNo;
	private String payAmount;
	private String enrollDate;
	private String deleteYn;
	private String memberNo;
	private String payMethodNo;
	private String tradeNo;
	
	
	
	public PayVo() {
		super();
	}



	public PayVo(String payNo, String payAmount, String enrollDate, String deleteYn, String memberNo,
			String payMethodNo, String tradeNo) {
		super();
		this.payNo = payNo;
		this.payAmount = payAmount;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.memberNo = memberNo;
		this.payMethodNo = payMethodNo;
		this.tradeNo = tradeNo;
	}



	public String getPayNo() {
		return payNo;
	}



	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}



	public String getPayAmount() {
		return payAmount;
	}



	public void setPayAmount(String payAmount) {
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



	public String getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}



	public String getPayMethodNo() {
		return payMethodNo;
	}



	public void setPayMethodNo(String payMethodNo) {
		this.payMethodNo = payMethodNo;
	}



	public String getTradeNo() {
		return tradeNo;
	}



	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}



	@Override
	public String toString() {
		return "PayVo [payNo=" + payNo + ", payAmount=" + payAmount + ", enrollDate=" + enrollDate + ", deleteYn="
				+ deleteYn + ", memberNo=" + memberNo + ", payMethodNo=" + payMethodNo + ", tradeNo=" + tradeNo + "]";
	}




	
	
	
	
	
	
	
	
	
	
}
