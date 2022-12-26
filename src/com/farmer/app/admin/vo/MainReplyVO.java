package com.farmer.app.admin.vo;

public class MainReplyVO {
	private String memberName;
	private String replyContent;
	private String replyDate;
	
	public MainReplyVO() {;}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	@Override
	public String toString() {
		return "MainMentorVO [memberName=" + memberName + ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ "]";
	}
}
