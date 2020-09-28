package com.kh.insane.employee.model.vo;

public class PayStepHistory implements java.io.Serializable{

	private int payStepHistorySeq;
	private int targetEmpNo;
	private int companyNo;
	private int positionCode;
	private String positionName;
	private int changePayStep;
	private int payStep;
	private String reason;
	
	public PayStepHistory() {}

	public PayStepHistory(int payStepHistorySeq, int targetEmpNo, int companyNo, int positionCode, String positionName,
			int changePayStep, int payStep, String reason) {
		super();
		this.payStepHistorySeq = payStepHistorySeq;
		this.targetEmpNo = targetEmpNo;
		this.companyNo = companyNo;
		this.positionCode = positionCode;
		this.positionName = positionName;
		this.changePayStep = changePayStep;
		this.payStep = payStep;
		this.reason = reason;
	}

	public int getPayStepHistorySeq() {
		return payStepHistorySeq;
	}

	public void setPayStepHistorySeq(int payStepHistorySeq) {
		this.payStepHistorySeq = payStepHistorySeq;
	}

	public int getTargetEmpNo() {
		return targetEmpNo;
	}

	public void setTargetEmpNo(int targetEmpNo) {
		this.targetEmpNo = targetEmpNo;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(int positionCode) {
		this.positionCode = positionCode;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public int getChangePayStep() {
		return changePayStep;
	}

	public void setChangePayStep(int changePayStep) {
		this.changePayStep = changePayStep;
	}

	public int getPayStep() {
		return payStep;
	}

	public void setPayStep(int payStep) {
		this.payStep = payStep;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Override
	public String toString() {
		return "PayStepHistory [payStepHistorySeq=" + payStepHistorySeq + ", targetEmpNo=" + targetEmpNo
				+ ", companyNo=" + companyNo + ", positionCode=" + positionCode + ", positionName=" + positionName
				+ ", changePayStep=" + changePayStep + ", payStep=" + payStep + ", reason=" + reason + "]";
	}
	
}
