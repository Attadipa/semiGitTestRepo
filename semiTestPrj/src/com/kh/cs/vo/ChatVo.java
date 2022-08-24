package com.kh.cs.vo;

public class ChatVo {
	
	public ChatVo() {
		
	}
	
	public ChatVo(String no, String memberNo, String grade, String content, String chatDate) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.grade = grade;
		this.content = content;
		this.chatDate = chatDate;
	}
	
	
	private String no;
	private String memberNo;
	private String memberName;
	private String grade;
	private String content;
	private String chatDate;
	
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getChatDate() {
		return chatDate;
	}

	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}

	
	@Override
	public String toString() {
		return "ChatVo [no=" + no + ", memberNo=" + memberNo + ", grade=" + grade + ", content=" + content
				+ ", chatDate=" + chatDate + "]";
	}


}
