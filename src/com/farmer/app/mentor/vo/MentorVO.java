package com.farmer.app.mentor.vo;

public class MentorVO {
	private int mentorNumebr;
	private String mentorTitle;
	private String mentorLocation;
	private String mentorCrops;
	private String mentorName;
	private String mentorEmail;
	private String mentorPhoneNumber;
	private String mentorDate;
	private String mentorImage;
	private int memberNumber;
	
	public MentorVO() {;}

	public int getMentorNumebr() {
		return mentorNumebr;
	}

	public void setMentorNumebr(int mentorNumebr) {
		this.mentorNumebr = mentorNumebr;
	}

	public String getMentorTitle() {
		return mentorTitle;
	}

	public void setMentorTitle(String mentorTitle) {
		this.mentorTitle = mentorTitle;
	}

	public String getMentorLocation() {
		return mentorLocation;
	}

	public void setMentorLocation(String mentorLocation) {
		this.mentorLocation = mentorLocation;
	}

	public String getMentorCrops() {
		return mentorCrops;
	}

	public void setMentorCrops(String mentorCrops) {
		this.mentorCrops = mentorCrops;
	}

	public String getMentorName() {
		return mentorName;
	}

	public void setMentorName(String mentorName) {
		this.mentorName = mentorName;
	}

	public String getMentorEmail() {
		return mentorEmail;
	}

	public void setMentorEmail(String mentorEmail) {
		this.mentorEmail = mentorEmail;
	}

	public String getMentorPhoneNumber() {
		return mentorPhoneNumber;
	}

	public void setMentorPhoneNumber(String mentorPhoneNumber) {
		this.mentorPhoneNumber = mentorPhoneNumber;
	}

	public String getMentorDate() {
		return mentorDate;
	}

	public void setMentorDate(String mentorDate) {
		this.mentorDate = mentorDate;
	}

	public String getMentorImage() {
		return mentorImage;
	}

	public void setMentorImage(String mentorImage) {
		this.mentorImage = mentorImage;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	@Override
	public String toString() {
		return "MentorVO [mentorNumebr=" + mentorNumebr + ", mentorTitle=" + mentorTitle + ", mentorLocation="
				+ mentorLocation + ", mentorCrops=" + mentorCrops + ", mentorName=" + mentorName + ", mentorEmail="
				+ mentorEmail + ", mentorPhoneNumber=" + mentorPhoneNumber + ", mentorDate=" + mentorDate
				+ ", mentorImage=" + mentorImage + ", memberNumber=" + memberNumber + "]";
	}


}
