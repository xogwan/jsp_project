package com.farmer.app.memberAlba.vo;

public class MemberAlbaVO {
	private int albaApplyNumber;
	private String memberName;
	private String memberGender;
	private String memberBirth;
	private String memberPhoneNumber;
	private String memberAddress;
	private String memberEmail;
	private String memberReason;
	private String ApplyDate;
	private int albaNumber;
	private int memberNumber;
	
	public MemberAlbaVO() {;}

	public int getAlbaApplyNumber() {
		return albaApplyNumber;
	}

	public void setAlbaApplyNumber(int albaApplyNumber) {
		this.albaApplyNumber = albaApplyNumber;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberPhoneNumber() {
		return memberPhoneNumber;
	}

	public void setMemberPhoneNumber(String memberPhoneNumber) {
		this.memberPhoneNumber = memberPhoneNumber;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberReason() {
		return memberReason;
	}

	public void setMemberReason(String memberReason) {
		this.memberReason = memberReason;
	}

	public String getApplyDate() {
		return ApplyDate;
	}

	public void setApplyDate(String applyDate) {
		ApplyDate = applyDate;
	}

	public int getAlbaNumber() {
		return albaNumber;
	}

	public void setAlbaNumber(int albaNumber) {
		this.albaNumber = albaNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	@Override
	public String toString() {
		return "MemberAlbaVO [albaApplyNumber=" + albaApplyNumber + ", memberName=" + memberName + ", memberGender="
				+ memberGender + ", memberBirth=" + memberBirth + ", memberPhoneNumber=" + memberPhoneNumber
				+ ", memberAddress=" + memberAddress + ", memberEmail=" + memberEmail + ", memberReason=" + memberReason
				+ ", ApplyDate=" + ApplyDate + ", albaNumber=" + albaNumber + ", memberNumber=" + memberNumber + "]";
	}

}


