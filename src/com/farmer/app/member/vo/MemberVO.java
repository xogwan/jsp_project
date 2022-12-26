package com.farmer.app.member.vo;

public class MemberVO {
	private int memberNumber;
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberPhoneNumber;
	private String memberName;
	private String memberLocation;
	private String memberJoinDate;
	private int memberGrade;
	
	
    public MemberVO() {;}


	public int getMemberNumber() {
		return memberNumber;
	}


	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPassword() {
		return memberPassword;
	}


	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
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


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
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


	public int getMemberGrade() {
		return memberGrade;
	}


	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}


	@Override
	public String toString() {
		return "MemberVO [memberNumber=" + memberNumber + ", memberId=" + memberId + ", memberPassword="
				+ memberPassword + ", memberEmail=" + memberEmail + ", memeberPhoneNumber=" + memberPhoneNumber
				+ memberPassword + ", memberEmail=" + memberEmail + ", memberPhoneNumber=" + memberPhoneNumber
				+ ", memberName=" + memberName + ", memberLocation=" + memberLocation + ", memberJoinDate="
				+ memberJoinDate + ", memberGrade=" + memberGrade + "]";
	}
}
