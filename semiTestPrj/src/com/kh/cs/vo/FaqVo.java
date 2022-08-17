package com.kh.cs.vo;

public class FaqVo {
	
	public FaqVo() {}
	
	public FaqVo(String no, String title, String content, String enrollDate, String status) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	
	
	
	private String no;
	private String title;
	private String content;
	private String enrollDate;
	private String status;
	
	
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
	
	@Override
	public String toString() {
		return "FaqVo [no=" + no + ", title=" + title + ", content=" + content + ", enrollDate=" + enrollDate
				+ ", status=" + status + "]";
	}
	

}
