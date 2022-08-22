package com.kh.trade.vo;

public class TradeVo {
	
	private String tradeNo;
	private String writer;
	private String title;
	private String refCategoryNo; //1-패션, 2-럭셔리, 3-신발, 4-도서/음반, 5-캠핑, 6-기타 (REF_CATEGORY_NO)
	private String location;
	private String condition;
	private String exchange;
	private String ship;
	private String price;
	private String explain;
	private String count;
	private String cnt;
	private String enrollDate;
	private String status;
	
	public TradeVo () {
		
	}

	public TradeVo(String tradeNo, String writer, String title, String refCategoryNo, String location, String condition,
			String exchange, String ship, String price, String explain, String count, String cnt, String enrollDate,
			String status) {
		super();
		this.tradeNo = tradeNo;
		this.writer = writer;
		this.title = title;
		this.refCategoryNo = refCategoryNo;
		this.location = location;
		this.condition = condition;
		this.exchange = exchange;
		this.ship = ship;
		this.price = price;
		this.explain = explain;
		this.count = count;
		this.cnt = cnt;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	public String getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRefCategoryNo() {
		return refCategoryNo;
	}

	public void setRefCategoryNo(String refCategoryNo) {
		this.refCategoryNo = refCategoryNo;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getExchange() {
		return exchange;
	}

	public void setExchange(String exchange) {
		this.exchange = exchange;
	}

	public String getShip() {
		return ship;
	}

	public void setShip(String ship) {
		this.ship = ship;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
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
		return "TradeVo [tradeNo=" + tradeNo + ", writer=" + writer + ", title=" + title + ", refCategoryNo=" + refCategoryNo
				+ ", location=" + location + ", condition=" + condition + ", exchange=" + exchange + ", ship=" + ship
				+ ", price=" + price + ", explain=" + explain + ", count=" + count + ", cnt=" + cnt + ", enrollDate="
				+ enrollDate + ", status=" + status + "]";
	}
	
	

	
	

}
