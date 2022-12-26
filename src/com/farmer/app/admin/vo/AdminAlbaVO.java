package com.farmer.app.admin.vo;

public class AdminAlbaVO {
	private int albaNumber;
	private String albaName;
	private String ApplyDate;
	private String memberId;
	
	public AdminAlbaVO() {;}

	public int getAlbaNumber() {
		return albaNumber;
	}

	public void setAlbaNumber(int albaNumber) {
		this.albaNumber = albaNumber;
	}

	public String getAlbaName() {
		return albaName;
	}

	public void setAlbaName(String albaName) {
		this.albaName = albaName;
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
		return "AdminAlbaVO [albaNumber=" + albaNumber + ", albaName=" + albaName + ", ApplyDate=" + ApplyDate
				+ ", memberId=" + memberId + "]";
	}
	
}
