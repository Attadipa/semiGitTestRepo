package com.kh.wishlist.vo;

public class WishVo {

	public WishVo() {
		
	}
	
	public WishVo(String wishNo, String memberNo, String postNo, String enrollDate, String title) {
		super();
		this.wishNo = wishNo;
		this.memberNo = memberNo;
		this.postNo = postNo;
		this.enrollDate = enrollDate;
		this.title = title;
	}

	private String wishNo;
	private String memberNo;
	private String title;
	private String postNo;
	private String enrollDate;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWishNo() {
		return wishNo;
	}

	public void setWishNo(String wishNo) {
		this.wishNo = wishNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "WishVo [wishNo=" + wishNo + ", memberNo=" + memberNo + ", postNo=" + postNo + ", enrollDate="
				+ enrollDate + "]";
	}
	
}
