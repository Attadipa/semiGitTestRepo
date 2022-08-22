package com.kh.community.vo;

public class TypeVo {
	
	private String typeNo;
	private String typeName;
	
	private TypeVo() {
		
	}

	public TypeVo(String typeNo, String typeName) {
		super();
		this.typeNo = typeNo;
		this.typeName = typeName;
	}

	public String getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(String typeNo) {
		this.typeNo = typeNo;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "TypeVo [typeNo=" + typeNo + ", typeName=" + typeName + "]";
	}
	
	

}
