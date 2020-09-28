package com.kh.insane.employee.model.vo;

public class Position implements java.io.Serializable {
	
	private int positionSeq;
	private String positionName;
	private int companyNo;
	private int addYearlyVacAmount;
	
	public Position() {}

	public Position(int positionSeq, String positionName, int companyNo, int addYearlyVacAmount) {
		super();
		this.positionSeq = positionSeq;
		this.positionName = positionName;
		this.companyNo = companyNo;
		this.addYearlyVacAmount = addYearlyVacAmount;
	}

	public int getPositionSeq() {
		return positionSeq;
	}

	public void setPositionSeq(int positionSeq) {
		this.positionSeq = positionSeq;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getAddYearlyVacAmount() {
		return addYearlyVacAmount;
	}

	public void setAddYearlyVacAmount(int addYearlyVacAmount) {
		this.addYearlyVacAmount = addYearlyVacAmount;
	}

	@Override
	public String toString() {
		return "Position [positionSeq=" + positionSeq + ", positionName=" + positionName + ", companyNo=" + companyNo
				+ ", addYearlyVacAmount=" + addYearlyVacAmount + "]";
	}
	
}
