package com.kh.insane.salary.model.vo;

public class SalaryCode implements java.io.Serializable {
	// SALARY_CODE 테이블
	private int salaryCodeSeq;// SALARY_CODE_SEQ
	private String positionCode;
	private int paymentHour; // 시간당급여
	private int payStopPayment; // 호봉별 추가 급여
	private String payType; // 급여형태 체크
	private int companyNo; // COMPANY_NO
	private String remark; // 비고
	private String usageStatus;
	private String salaryCodeName; // 급여코드명

	public SalaryCode() {
		super();
	}

	public SalaryCode(int salaryCodeSeq, String positionCode, int paymentHour, int payStopPayment, String payType,
			int companyNo, String remark, String usageStatus, String salaryCodeName) {
		super();
		this.salaryCodeSeq = salaryCodeSeq;
		this.positionCode = positionCode;
		this.paymentHour = paymentHour;
		this.payStopPayment = payStopPayment;
		this.payType = payType;
		this.companyNo = companyNo;
		this.remark = remark;
		this.usageStatus = usageStatus;
		this.salaryCodeName = salaryCodeName;
	}

	public int getSalaryCodeSeq() {
		return salaryCodeSeq;
	}

	public void setSalaryCodeSeq(int salaryCodeSeq) {
		this.salaryCodeSeq = salaryCodeSeq;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public int getPaymentHour() {
		return paymentHour;
	}

	public void setPaymentHour(int paymentHour) {
		this.paymentHour = paymentHour;
	}

	public int getPayStopPayment() {
		return payStopPayment;
	}

	public void setPayStopPayment(int payStopPayment) {
		this.payStopPayment = payStopPayment;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}

	public String getSalaryCodeName() {
		return salaryCodeName;
	}

	public void setSalaryCodeName(String salaryCodeName) {
		this.salaryCodeName = salaryCodeName;
	}

	@Override
	public String toString() {
		return "SalaryCode [salaryCodeSeq=" + salaryCodeSeq + ", positionCode=" + positionCode + ", paymentHour="
				+ paymentHour + ", payStopPayment=" + payStopPayment + ", payType=" + payType + ", companyNo="
				+ companyNo + ", remark=" + remark + ", usageStatus=" + usageStatus + ", salaryCodeName="
				+ salaryCodeName + "]";
	}

}
