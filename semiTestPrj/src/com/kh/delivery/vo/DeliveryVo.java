package com.kh.delivery.vo;

public class DeliveryVo {
	private String deliveryNo;
	private String deliveryAddr;
	private String requestContent;
	private String payNo;
	private String enrollDate;
	private String deleteYn;
	
	
	public DeliveryVo() {
		super();
	}


	public DeliveryVo(String deliveryNo, String deliveryAddr, String requestContent, String payNo, String enrollDate,
			String deleteYn) {
		super();
		this.deliveryNo = deliveryNo;
		this.deliveryAddr = deliveryAddr;
		this.requestContent = requestContent;
		this.payNo = payNo;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
	}


	public String getDeliveryNo() {
		return deliveryNo;
	}


	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}


	public String getDeliveryAddr() {
		return deliveryAddr;
	}


	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}


	public String getRequestContent() {
		return requestContent;
	}


	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}


	public String getPayNo() {
		return payNo;
	}


	public void setPayNo(String payNo) {
		this.payNo = payNo;
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


	@Override
	public String toString() {
		return "DeliveryVo [deliveryNo=" + deliveryNo + ", deliveryAddr=" + deliveryAddr + ", requestContent="
				+ requestContent + ", payNo=" + payNo + ", enrollDate=" + enrollDate + ", deleteYn=" + deleteYn + "]";
	}

}
		