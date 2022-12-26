package com.farmer.app.localSpeciality.vo;

public class LocalSpecialityVO {
	private int spNumber;
	private String spImage;
	private String spName;
	private String spLocation;
	private String spDate;
	
	public LocalSpecialityVO() {;}

	public int getSpNumber() {
		return spNumber;
	}

	public void setSpNumber(int spNumber) {
		this.spNumber = spNumber;
	}

	public String getSpImage() {
		return spImage;
	}

	public void setSpImage(String spImage) {
		this.spImage = spImage;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getSpLocation() {
		return spLocation;
	}

	public void setSpLocation(String spLocation) {
		this.spLocation = spLocation;
	}

	public String getSpDate() {
		return spDate;
	}

	public void setSpDate(String spDate) {
		this.spDate = spDate;
	}

	@Override
	public String toString() {
		return "LocalSpecialityProductInfoVO [spNumber=" + spNumber + ", spImage=" + spImage + ", spName=" + spName
				+ ", spLocation=" + spLocation + ", spDate=" + spDate + "]";
	}
}
