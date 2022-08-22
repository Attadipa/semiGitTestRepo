package com.kh.community.vo;

public class AttachmentComVo {
	
	private String no;
	private String refCno;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private String fileLevel;
	private String status;
	
	//기본생성자
	public AttachmentComVo() {
		
	}

	public AttachmentComVo(String no, String refCno, String originName, String changeName, String filePath,
			String uploadDate, String fileLevel, String status) {
		super();
		this.no = no;
		this.refCno = refCno;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getRefCno() {
		return refCno;
	}

	public void setRefCno(String refCno) {
		this.refCno = refCno;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AttachmentComVo [no=" + no + ", refCno=" + refCno + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", status=" + status + "]";
	}
	
	

}
