package com.farmer.app.noticeFile.vo;

public class NoticeFileVO {
	private String noticeFileName;
	private String noticeFileRealname;
	private int noticeNumber;
	
	public NoticeFileVO() {;}

	public String getNoticeFileName() {
		return noticeFileName;
	}

	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}

	public String getNoticeFileRealname() {
		return noticeFileRealname;
	}

	public void setNoticeFileRealname(String noticeFileRealname) {
		this.noticeFileRealname = noticeFileRealname;
	}

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}

	@Override
	public String toString() {
		return "NoticeFileVO [noticeFileName=" + noticeFileName + ", noticeFileRealname=" + noticeFileRealname
				+ ", noticeNumber=" + noticeNumber + "]";
	}
	
}
