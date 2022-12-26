package com.farmer.app.cropsInfo.vo;

public class CropsInfoVO {
	private int cropsNumber;
	private String cropsImage;
	private String cropsName;
	private int cropsDevYear;
	private String cropsInstitution;
	private String cropsDetailName;
	private String cropsExplain;
	private String cropsCategory;
	private String cropsKinds;
	
	public CropsInfoVO() {;}

	public int getCropsNumber() {
		return cropsNumber;
	}

	public void setCropsNumber(int cropsNumber) {
		this.cropsNumber = cropsNumber;
	}

	public String getCropsImage() {
		return cropsImage;
	}

	public void setCropsImage(String cropsImage) {
		this.cropsImage = cropsImage;
	}

	public String getCropsName() {
		return cropsName;
	}

	public void setCropsName(String cropsName) {
		this.cropsName = cropsName;
	}

	public int getCropsDevYear() {
		return cropsDevYear;
	}

	public void setCropsDevYear(int cropsDevYear) {
		this.cropsDevYear = cropsDevYear;
	}

	public String getCropsInstitution() {
		return cropsInstitution;
	}

	public void setCropsInstitution(String cropsInstitution) {
		this.cropsInstitution = cropsInstitution;
	}

	public String getCropsDetailName() {
		return cropsDetailName;
	}

	public void setCropsDetailName(String cropsDetailName) {
		this.cropsDetailName = cropsDetailName;
	}

	public String getCropsExplain() {
		return cropsExplain;
	}

	public void setCropsExplain(String cropsExplain) {
		this.cropsExplain = cropsExplain;
	}

	public String getCropsCategory() {
		return cropsCategory;
	}

	public void setCropsCategory(String cropsCategory) {
		this.cropsCategory = cropsCategory;
	}

	public String getCropsKinds() {
		return cropsKinds;
	}

	public void setCropsKinds(String cropsKinds) {
		this.cropsKinds = cropsKinds;
	}

	@Override
	public String toString() {
		return "CropsInfoVO [cropsNumber=" + cropsNumber + ", cropsImage=" + cropsImage + ", cropsName=" + cropsName
				+ ", cropsDevYear=" + cropsDevYear + ", cropsInstitution=" + cropsInstitution + ", cropsDetailName="
				+ cropsDetailName + ", cropsExplain=" + cropsExplain + ", cropsCategory=" + cropsCategory
				+ ", cropsKinds=" + cropsKinds + "]";
	}
	
}
