package com.kh.insane.employee.model.vo;

public class Military implements java.io.Serializable {

	private int militaryServiceSeq;
	private int empNoSeq;
	private String endsType;
	private String exmpReason;
	private String milPosition;
	private String milSpecies;
	private String lastClass;
	private String servStartDate;
	private String servEndDate;
	private int companyNo;
	
	public Military() {}

	public Military(int militaryServiceSeq, int empNoSeq, String endsType, String exmpReason, String milPosition,
			String milSpecies, String lastClass, String servStartDate, String servEndDate, int companyNo) {
		super();
		this.militaryServiceSeq = militaryServiceSeq;
		this.empNoSeq = empNoSeq;
		this.endsType = endsType;
		this.exmpReason = exmpReason;
		this.milPosition = milPosition;
		this.milSpecies = milSpecies;
		this.lastClass = lastClass;
		this.servStartDate = servStartDate;
		this.servEndDate = servEndDate;
		this.companyNo = companyNo;
	}

	public int getMilitaryServiceSeq() {
		return militaryServiceSeq;
	}

	public void setMilitaryServiceSeq(int militaryServiceSeq) {
		this.militaryServiceSeq = militaryServiceSeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getEndsType() {
		return endsType;
	}

	public void setEndsType(String endsType) {
		this.endsType = endsType;
	}

	public String getExmpReason() {
		return exmpReason;
	}

	public void setExmpReason(String exmpReason) {
		this.exmpReason = exmpReason;
	}

	public String getMilPosition() {
		return milPosition;
	}

	public void setMilPosition(String milPosition) {
		this.milPosition = milPosition;
	}

	public String getMilSpecies() {
		return milSpecies;
	}

	public void setMilSpecies(String milSpecies) {
		this.milSpecies = milSpecies;
	}

	public String getLastClass() {
		return lastClass;
	}

	public void setLastClass(String lastClass) {
		this.lastClass = lastClass;
	}

	public String getServStartDate() {
		return servStartDate;
	}

	public void setServStartDate(String servStartDate) {
		this.servStartDate = servStartDate;
	}

	public String getServEndDate() {
		return servEndDate;
	}

	public void setServEndDate(String servEndDate) {
		this.servEndDate = servEndDate;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "Military [militaryServiceSeq=" + militaryServiceSeq + ", empNoSeq=" + empNoSeq + ", endsType="
				+ endsType + ", exmpReason=" + exmpReason + ", milPosition=" + milPosition + ", milSpecies="
				+ milSpecies + ", lastClass=" + lastClass + ", servStartDate=" + servStartDate + ", servEndDate="
				+ servEndDate + ", companyNo=" + companyNo + "]";
	}
	
}
