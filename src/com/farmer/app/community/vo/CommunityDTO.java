package com.farmer.app.community.vo;

public class CommunityDTO {
	private int communityNumber;
	private String communityTitle;
	private String communityFileName;
	private String communityContent;
	private int memberNumber;
	private String communityDate;
	private int communityViewCount;
	private String memberId;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public CommunityDTO() {;}

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
	
	public String getCommunityFileName() {
		return communityFileName;
	}

	public void setCommunityFileName(String communityFileName) {
		this.communityFileName = communityFileName;
	}

	public String getCommunityContent() {
		return communityContent;
	}

	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
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
		return "CommunityDTO [communityNumber=" + communityNumber + ", communityTitle=" + communityTitle
				+ ", communityFileName=" + communityFileName + ", communityContent=" + communityContent
				+ ", memberNumber=" + memberNumber + ", communityDate=" + communityDate + ", communityViewCount="
				+ communityViewCount + ", memberId=" + memberId + "]";
	}
}