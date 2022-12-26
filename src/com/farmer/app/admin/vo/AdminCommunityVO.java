package com.farmer.app.admin.vo;

public class AdminCommunityVO {
	private int communityNumber;
	private String communityTitle;
	private String communityContent;
	private String memberId;
	private String communityDate;
	private int communityViewCount;
	
	public AdminCommunityVO() {;}

	public int getCommunityNumber() {
		return communityNumber;
	}

	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}

	public String getCommunityTitle() {
		return communityTitle;
	}

	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}

	public String getCommunityContent() {
		return communityContent;
	}

	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCommunityDate() {
		return communityDate;
	}

	public void setCommunityDate(String communityDate) {
		this.communityDate = communityDate;
	}

	public int getCommunityViewCount() {
		return communityViewCount;
	}

	public void setCommunityViewCount(int communityViewCount) {
		this.communityViewCount = communityViewCount;
	}

	@Override
	public String toString() {
		return "AdminCommunityVO [communityNumber=" + communityNumber + ", communityTitle=" + communityTitle
				+ ", communityContent=" + communityContent + ", memberId=" + memberId + ", communityDate="
				+ communityDate + ", communityViewCount=" + communityViewCount + "]";
	}
}
