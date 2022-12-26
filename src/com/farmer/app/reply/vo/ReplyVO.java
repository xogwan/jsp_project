package com.farmer.app.reply.vo;

public class ReplyVO {
	private int replyNumber;
	private int communityNumber;
	private String replyContent;
	private String replyDate;
	private int memberNumber;
	
	public ReplyVO() {;}

	public int getReplyNumber() {
		return replyNumber;
	}

	public void setReplyNumber(int replyNumber) {
		this.replyNumber = replyNumber;
	}

	public int getCommunityNumber() {
		return communityNumber;
	}

	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNumber=" + replyNumber + ", communityNumber=" + communityNumber + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + ", memberNumber=" + memberNumber + "]";
	}
}
