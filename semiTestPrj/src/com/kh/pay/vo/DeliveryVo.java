package com.kh.pay.vo;

public class DeliveryVo {
	private String deliveryNo;
	private String deliveryAddr;
	private String requestContent;
	private String payNo;
	
	
	public DeliveryVo() {
		super();
	}


	public DeliveryVo(String deliveryNo, String deliveryAddr, String requestContent, String payNo) {
		super();
		this.deliveryNo = deliveryNo;
		this.deliveryAddr = deliveryAddr;
		this.requestContent = requestContent;
		this.payNo = payNo;
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


	@Override
	public String toString() {
		return "DeliveryVo [deliveryNo=" + deliveryNo + ", deliveryAddr=" + deliveryAddr + ", requestContent="
				+ requestContent + ", payNo=" + payNo + "]";
	}
	
	
	
	
	
	
	
}
