package com.farmer.app.admin.vo;

public class MainUserVO {
	private String memberName;
	private String memberEmail;
	private String memberPhoneNumber;
	private String memberLocation;
	private String memberJoinDate;
	
	public MainUserVO() {;}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}

	public void setMemberPhoneNumber(String memberPhoneNumber) {
		this.memberPhoneNumber = memberPhoneNumber;
	}

	public String getMemberLocation() {
		return memberLocation;
	}

	public void setMemberLocation(String memberLocation) {
		this.memberLocation = memberLocation;
	}

	public String getMemberJoinDate() {
		return memberJoinDate;
	}

	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}

	@Override
	public String toString() {
		return "MainUserVO [memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberPhoneNumber="
				+ memberPhoneNumber + ", memberLocation=" + memberLocation + ", memberJoinDate=" + memberJoinDate + "]";
	}
}
