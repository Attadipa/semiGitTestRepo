package com.kh.admin.vo;

public class EventVo {
	
	public EventVo() {}
	
	public EventVo(String no, String title, String content, String writer, String uploadDate, String status) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.uploadDate = uploadDate;
		this.status = status;
	}
	
	
	private String no;
	private String title;
	private String content;
	private String writer;
	private String uploadDate;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "EventVo [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}

}
