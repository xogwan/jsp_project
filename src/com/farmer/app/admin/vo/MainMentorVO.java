package com.farmer.app.admin.vo;

public class MainMentorVO {
	private String mentorLocation;
	private String mentorCrops;
	private String mentorName;
	private String mentorDate;
	
	public MainMentorVO() {;}

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

	public String getMentorDate() {
		return mentorDate;
	}

	public void setMentorDate(String mentorDate) {
		this.mentorDate = mentorDate;
	}

	@Override
	public String toString() {
		return "MainMentorVO [mentorLocation=" + mentorLocation + ", mentorCrops=" + mentorCrops + ", mentorName="
				+ mentorName + ", mentorDate=" + mentorDate + "]";
	}
}
