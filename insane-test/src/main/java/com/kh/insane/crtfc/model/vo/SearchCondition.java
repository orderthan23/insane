package com.kh.insane.crtfc.model.vo;

public class SearchCondition {
//
	int crtfcNo;
	int companyNo;
	int empNoSeq;
	String crtfcType;
	
	public SearchCondition() {
	}

	public SearchCondition(int crtfcNo, int companyNo, int empNoSeq, String crtfcType) {
		super();
		this.crtfcNo = crtfcNo;
		this.companyNo = companyNo;
		this.empNoSeq = empNoSeq;
		this.crtfcType = crtfcType;
	}

	public int getCrtfcNo() {
		return crtfcNo;
	}

	public void setCrtfcNo(int crtfcNo) {
		this.crtfcNo = crtfcNo;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getCrtfcType() {
		return crtfcType;
	}

	public void setCrtfcType(String crtfcType) {
		this.crtfcType = crtfcType;
	}

	@Override
	public String toString() {
		return "SearchCondition [crtfcNo=" + crtfcNo + ", companyNo=" + companyNo + ", empNoSeq=" + empNoSeq
				+ ", crtfcType=" + crtfcType + "]";
	}
}
