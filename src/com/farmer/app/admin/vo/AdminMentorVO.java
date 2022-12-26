package com.farmer.app.admin.vo;

public class AdminMentorVO {
	private int mentorNumber;
	private String mentorTitle;
	private String mentorCrops;
	private String mentorLocation;
	private String memberId;
	private String mentorEmail;
	private String mentorPhoneNumber;
	private String mentorImage;
	private String mentorDate;
	
	public AdminMentorVO() {;}

	public int getMentorNumber() {
		return mentorNumber;
	}

	public void setMentorNumber(int mentorNumber) {
		this.mentorNumber = mentorNumber;
	}

	public String getMentorTitle() {
		return mentorTitle;
	}

	public void setMentorTitle(String mentorTitle) {
		this.mentorTitle = mentorTitle;
	}

	public String getMentorCrops() {
		return mentorCrops;
	}

	public void setMentorCrops(String mentorCrops) {
		this.mentorCrops = mentorCrops;
	}

	public String getMentorLocation() {
		return mentorLocation;
	}

	public void setMentorLocation(String mentorLocation) {
		this.mentorLocation = mentorLocation;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getMentorImage() {
		return mentorImage;
	}

	public void setMentorImage(String mentorImage) {
		this.mentorImage = mentorImage;
	}

	public String getMentorDate() {
		return mentorDate;
	}

	public void setMentorDate(String mentorDate) {
		this.mentorDate = mentorDate;
	}

	@Override
	public String toString() {
		return "MentorVO [mentorNumber=" + mentorNumber + ", mentorTitle=" + mentorTitle + ", mentorCrops="
				+ mentorCrops + ", mentorLocation=" + mentorLocation + ", memberId=" + memberId + ", mentorEmail="
				+ mentorEmail + ", mentorPhoneNumber=" + mentorPhoneNumber + ", mentorImage=" + mentorImage
				+ ", mentorDate=" + mentorDate + "]";
	}
}
