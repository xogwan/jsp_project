package com.farmer.app.admin.vo;

public class AdminReplyVO {
	private int replyNumber;
	private String replyContent;
	private String memberId;
	private String replyDate;
	private int communityNumber;
	
	public AdminReplyVO() {;}

	public int getReplyNumber() {
		return replyNumber;
	}

	public void setReplyNumber(int replyNumber) {
		this.replyNumber = replyNumber;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public int getCommunityNumber() {
		return communityNumber;
	}

	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}

	@Override
	public String toString() {
		return "AdminReplyVO [replyNumber=" + replyNumber + ", replyContent=" + replyContent + ", memberId=" + memberId
				+ ", replyDate=" + replyDate + ", communityNumber=" + communityNumber + "]";
	}
}
