package com.farmer.app.admin.vo;

public class MainCommunityVO {
	private String communityTitle;
	private String communityDate;
	
	public MainCommunityVO() {;}

	public String getCommunityTitle() {
		return communityTitle;
	}

	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}

	public String getCommunityDate() {
		return communityDate;
	}

	public void setCommunityDate(String communityDate) {
		this.communityDate = communityDate;
	}

	@Override
	public String toString() {
		return "MainCommunityVO [communityTitle=" + communityTitle + ", communityDate=" + communityDate + "]";
	}
	
}
