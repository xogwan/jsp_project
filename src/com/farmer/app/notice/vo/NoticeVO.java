package com.farmer.app.notice.vo;

public class NoticeVO {
	private int noticeNumber;
	private String noticeTitle;
	private String noticeContent;
	private int memberNumber;
	private String noticeDate;
	private int noticeViewCount;
	
	public NoticeVO() {;}

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeViewCount() {
		return noticeViewCount;
	}

	public void setNoticeViewCount(int noticeViewCount) {
		this.noticeViewCount = noticeViewCount;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNumber=" + noticeNumber  + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", memberNumber=" + memberNumber + ", noticeDate="
				+ noticeDate + ", noticeViewCount=" + noticeViewCount + "]";
	}
}
