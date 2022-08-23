package com.kh.ad.vo;

public class AdVo {
	private String adNo;
	private String memberNo;
	private String tradeNo;
	private String period;
	private String keyword1;
	private String keyword2;
	private String keyword3;
	private String enrollDate;
	private String deleteYn;
	
	//광고목록조회용 추가정보
	private String title;
	private String price;
	private String adStatus;
	
	
	
	public AdVo() {
		super();
	}


	
	public AdVo(String adNo, String memberNo, String tradeNo, String period, String keyword1, String keyword2,
			String keyword3, String enrollDate, String deleteYn) {
		super();
		this.adNo = adNo;
		this.memberNo = memberNo;
		this.tradeNo = tradeNo;
		this.period = period;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
	}


	//광고목록 조회용 
	public AdVo(String adNo, String memberNo, String tradeNo, String period, String keyword1, String keyword2,
			String keyword3, String enrollDate, String deleteYn, String title, String price, String adStatus) {
		super();
		this.adNo = adNo;
		this.memberNo = memberNo;
		this.tradeNo = tradeNo;
		this.period = period;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.title = title;
		this.price = price;
		this.adStatus = adStatus;
	}



	public String getAdNo() {
		return adNo;
	}



	public void setAdNo(String adNo) {
		this.adNo = adNo;
	}



	public String getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}



	public String getTradeNo() {
		return tradeNo;
	}



	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}



	public String getPeriod() {
		return period;
	}



	public void setPeriod(String period) {
		this.period = period;
	}



	public String getKeyword1() {
		return keyword1;
	}



	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}



	public String getKeyword2() {
		return keyword2;
	}



	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}



	public String getKeyword3() {
		return keyword3;
	}



	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
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



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public String getAdStatus() {
		return adStatus;
	}



	public void setAdStatus(String adStatus) {
		this.adStatus = adStatus;
	}
	
	
	
	
	
}