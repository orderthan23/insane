package com.kh.insane.employee.model.vo;

public class PayStep implements java.io.Serializable {
	
	private int payStepSeq;
	private int payStep;
	private int companyNo;
	
	public PayStep() {}

	public PayStep(int payStepSeq, int payStep, int companyNo) {
		super();
		this.payStepSeq = payStepSeq;
		this.payStep = payStep;
		this.companyNo = companyNo;
	}

	public int getPayStepSeq() {
		return payStepSeq;
	}

	public void setPayStepSeq(int payStepSeq) {
		this.payStepSeq = payStepSeq;
	}

	public int getPayStep() {
		return payStep;
	}

	public void setPayStep(int payStep) {
		this.payStep = payStep;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "PayStep [payStepSeq=" + payStepSeq + ", payStep=" + payStep + ", companyNo=" + companyNo + "]";
	}
	
}
