package com.kh.insane.employee.model.vo;

public class Rspofc implements java.io.Serializable {
	
	private int rspofcSeq;
	private String rspofcName;
	private int companyNo;
	
	public Rspofc() {}

	public Rspofc(int rspofcSeq, String rspofcName, int companyNo) {
		super();
		this.rspofcSeq = rspofcSeq;
		this.rspofcName = rspofcName;
		this.companyNo = companyNo;
	}

	public int getRspofcSeq() {
		return rspofcSeq;
	}

	public void setRspofcSeq(int rspofcSeq) {
		this.rspofcSeq = rspofcSeq;
	}

	public String getRspofcName() {
		return rspofcName;
	}

	public void setRspofcName(String rspofcName) {
		this.rspofcName = rspofcName;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "Rspofc [rspofcSeq=" + rspofcSeq + ", rspofcName=" + rspofcName + ", companyNo=" + companyNo + "]";
	}
	
}
