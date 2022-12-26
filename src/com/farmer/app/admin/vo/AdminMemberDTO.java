package com.farmer.app.admin.vo;

public class AdminMemberDTO {
	private String type;
	private String keyword;
	
	public AdminMemberDTO() {;}
	
	public AdminMemberDTO(String type, String keyword) {
		super();
		this.type = type;
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String[] getTypes() {
		return type != null ? this.type.split("") : new String[] {};
	}
}
