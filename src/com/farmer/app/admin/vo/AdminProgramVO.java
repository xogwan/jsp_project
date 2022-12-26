package com.farmer.app.admin.vo;

public class AdminProgramVO {
	private int programNumber;
	private String programName;
	private String ApplyDate;
	private String memberId;
	
	public AdminProgramVO() {;}

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


	public String getApplyDate() {
		return ApplyDate;
	}

	public void setApplyDate(String applyDate) {
		ApplyDate = applyDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "AdminProgramVO [programNumber=" + programNumber + ", programName=" + programName + ", ApplyDate="
				+ ApplyDate + ", memberId=" + memberId + "]";
	}
}
