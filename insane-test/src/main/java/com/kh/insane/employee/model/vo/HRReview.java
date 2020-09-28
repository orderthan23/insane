package com.kh.insane.employee.model.vo;

public class HRReview implements java.io.Serializable {
	
	private int prsnlExmHistorySeq;
	private int targetEmpNo;
	private String exmType;
	private String exmResult;
	private int companyNo;
	private String exmOpnion;
	
	public HRReview() {}

	public HRReview(int prsnlExmHistorySeq, int targetEmpNo, String exmType, String exmResult, int companyNo,
			String exmOpnion) {
		super();
		this.prsnlExmHistorySeq = prsnlExmHistorySeq;
		this.targetEmpNo = targetEmpNo;
		this.exmType = exmType;
		this.exmResult = exmResult;
		this.companyNo = companyNo;
		this.exmOpnion = exmOpnion;
	}

	public int getPrsnlExmHistorySeq() {
		return prsnlExmHistorySeq;
	}

	public void setPrsnlExmHistorySeq(int prsnlExmHistorySeq) {
		this.prsnlExmHistorySeq = prsnlExmHistorySeq;
	}

	public int getTargetEmpNo() {
		return targetEmpNo;
	}

	public void setTargetEmpNo(int targetEmpNo) {
		this.targetEmpNo = targetEmpNo;
	}

	public String getExmType() {
		return exmType;
	}

	public void setExmType(String exmType) {
		this.exmType = exmType;
	}

	public String getExmResult() {
		return exmResult;
	}

	public void setExmResult(String exmResult) {
		this.exmResult = exmResult;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getExmOpnion() {
		return exmOpnion;
	}

	public void setExmOpnion(String exmOpnion) {
		this.exmOpnion = exmOpnion;
	}

	@Override
	public String toString() {
		return "HRReview [prsnlExmHistorySeq=" + prsnlExmHistorySeq + ", targetEmpNo=" + targetEmpNo + ", exmType="
				+ exmType + ", exmResult=" + exmResult + ", companyNo=" + companyNo + ", exmOpnion=" + exmOpnion + "]";
	}
	
}
