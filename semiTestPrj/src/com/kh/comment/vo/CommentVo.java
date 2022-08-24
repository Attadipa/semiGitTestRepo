package com.kh.comment.vo;

public class CommentVo {
	
	private String no;
	private String postNo;
	private String memberNo;
	private String content;
	private String enrollDate;
	
	public CommentVo () {
		
	}

	public CommentVo(String no, String postNo, String memberNo, String content, String enrollDate) {
		super();
		this.no = no;
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.content = content;
		this.enrollDate = enrollDate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "CommentVo [no=" + no + ", postNo=" + postNo + ", memberNo=" + memberNo + ", content=" + content
				+ ", enrollDate=" + enrollDate + "]";
	}

	
	

}
