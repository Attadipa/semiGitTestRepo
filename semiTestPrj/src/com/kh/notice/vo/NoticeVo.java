package com.kh.notice.vo;

public class NoticeVo {

	private String no;
	private String title;
	private String content;
	private String writer;
	private String cnt;
	private String enrollDate;
	private String status;
	
	public NoticeVo() {
		
	}

	public NoticeVo(String no, String title, String content, String writer, String cnt, String enrollDate,
			String status) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.cnt = cnt;
		this.enrollDate = enrollDate;
		this.status = status;
	}

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

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
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
		return "NoticeVo [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", cnt="
				+ cnt + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
}
