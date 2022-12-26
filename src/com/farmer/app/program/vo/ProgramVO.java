package com.farmer.app.program.vo;

public class ProgramVO {
	private int programNumber;
	private String programName;
	private String programLocation;
	private String programStartDate;
	private String programEndDate;
	private String programStartTime;
	private String programEndTime;
	private String programFee;
	private String programApplyStartDate;
	private String programApplyEndDate;
	private String programDate;
	private String programRecruitedCount;
	private String programRecruitedTotalCount;
	private int programViewCount;
	private String programPhoneNumber;
	private String programImage;
	private int memberNumber;
	
	public ProgramVO() {;}

	public int getProgramNumber() {
		return programNumber;
	}

	public void setProgramNumber(int programNumber) {
		this.programNumber = programNumber;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public String getProgramLocation() {
		return programLocation;
	}

	public void setProgramLocation(String programLocation) {
		this.programLocation = programLocation;
	}

	
	public int getProgramViewCount() {
		return programViewCount;
	}

	public void setProgramViewCount(int programViewCount) {
		this.programViewCount = programViewCount;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getProgramStartDate() {
		return programStartDate;
	}

	
	public void setProgramStartDate(String programStartDate) {
		this.programStartDate = programStartDate;
	}

	public String getProgramEndDate() {
		return programEndDate;
	}

	public void setProgramEndDate(String programEndDate) {
		this.programEndDate = programEndDate;
	}

	public String getProgramStartTime() {
		return programStartTime;
	}

	public void setProgramStartTime(String programStartTime) {
		this.programStartTime = programStartTime;
	}

	public String getProgramEndTime() {
		return programEndTime;
	}

	public void setProgramEndTime(String programEndTime) {
		this.programEndTime = programEndTime;
	}

	public String getProgramFee() {
		return programFee;
	}

	public void setProgramFee(String programFee) {
		this.programFee = programFee;
	}

	public String getProgramApplyStartDate() {
		return programApplyStartDate;
	}

	public void setProgramApplyStartDate(String programApplyStartDate) {
		this.programApplyStartDate = programApplyStartDate;
	}

	public String getProgramApplyEndDate() {
		return programApplyEndDate;
	}

	public void setProgramApplyEndDate(String programApplyEndDate) {
		this.programApplyEndDate = programApplyEndDate;
	}

	public String getProgramDate() {
		return programDate;
	}

	public void setProgramDate(String programDate) {
		this.programDate = programDate;
	}

	public String getProgramRecruitedCount() {
		return programRecruitedCount;
	}

	public void setProgramRecruitedCount(String programRecruitedCount) {
		this.programRecruitedCount = programRecruitedCount;
	}

	public String getProgramRecruitedTotalCount() {
		return programRecruitedTotalCount;
	}

	public void setProgramRecruitedTotalCount(String programRecruitedTotalCount) {
		this.programRecruitedTotalCount = programRecruitedTotalCount;
	}

	public String getProgramPhoneNumber() {
		return programPhoneNumber;
	}

	public void setProgramPhoneNumber(String programPhoneNumber) {
		this.programPhoneNumber = programPhoneNumber;
	}

	public String getProgramImage() {
		return programImage;
	}

	public void setProgramImage(String programImage) {
		this.programImage = programImage;
	}

	@Override
	public String toString() {
		return "ProgramVO [programNumber=" + programNumber + ", programName=" + programName + ", programLocation="
				+ programLocation + ", programStartDate=" + programStartDate + ", programEndDate=" + programEndDate
				+ ", programStartTime=" + programStartTime + ", programEndTime=" + programEndTime + ", programFee="
				+ programFee + ", programApplyStartDate=" + programApplyStartDate + ", programApplyEndDate="
				+ programApplyEndDate + ", programDate=" + programDate + ", programRecruitedCount="
				+ programRecruitedCount + ", programRecruitedTotalCount=" + programRecruitedTotalCount
				+ ", programViewCount=" + programViewCount + ", programPhoneNumber=" + programPhoneNumber
				+ ", programImage=" + programImage + ", memberNumber=" + memberNumber + "]";
	}



}
