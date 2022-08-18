package com.kh.trade.vo;

public class TradeVo {
	
	private String image;
	private String title;
	private String refCategoryNo; //1-패션, 2-럭셔리, 3-신발, 4-도서/음반, 5-캠핑, 6-기타 (REF_CATEGORY_NO)
	private String location;
	private String condition;
	private String exchange;
	private String price;
	private String explain;
	private String count;
	
	public TradeVo () {
		
	}

	public TradeVo(String image, String title, String refCategoryNo, String location, String condition, String exchange,
			String price, String explain, String count) {
		super();
		this.image = image;
		this.title = title;
		this.refCategoryNo = refCategoryNo;
		this.location = location;
		this.condition = condition;
		this.exchange = exchange;
		this.price = price;
		this.explain = explain;
		this.count = count;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	@Override
	public String toString() {
		return "TradeVo [image=" + image + ", title=" + title + ", refCategoryNo=" + refCategoryNo + ", location="
				+ location + ", condition=" + condition + ", exchange=" + exchange + ", price=" + price + ", explain="
				+ explain + ", count=" + count + "]";
	}

	
	

}
