package com.farmer.app.communityFile.vo;

public class CommunityFileVO {
	private String communityFileName;
	private String communityFileRealname;
	private int communityNumber;
	
	public CommunityFileVO() {;}

	public String getCommunityFileName() {
		return communityFileName;
	}

	public void setCommunityFileName(String communityFileName) {
		this.communityFileName = communityFileName;
	}

	public String getCommunityFileRealname() {
		return communityFileRealname;
	}

	public void setCommunityFileRealname(String communityFileRealname) {
		this.communityFileRealname = communityFileRealname;
	}

	public int getCommunityNumber() {
		return communityNumber;
	}

	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}

	@Override
	public String toString() {
		return "CommunityFileVO [communityFileName=" + communityFileName + ", communityFileRealname="
				+ communityFileRealname + ", communityNumber=" + communityNumber + "]";
	}
}
