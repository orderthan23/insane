package com.kh.insane.salary.model.vo;

public class Salary implements java.io.Serializable {
	// SALARY_HISTORY 테이블
	private int salaryHistorySeq;// SALARY_HISTORY_SEQ
	private int empNoSeq;// EMP_NO_SEQ
	private int salaryCodeSeq;// SALARY_CODE_SEQ
	private String payDate;// PAY_DATE
	private int companyNo; // COMPANY_NO
	// SALARY_CODE_SEQ를 기준으로 SALARY_CODE 테이블 JOIN
	// companyNo 겹침
	private String positionCode;
	private int paymentHour; // 시간당급여
	private int payStopPayment; // 호봉별 추가 급여
	private String payType; // 급여형태 체크
	private String remark; // 비고
	private String usageStatus;
	private String salaryCodeName; // 급여코드명

	public Salary() {
		super();
	}

	public Salary(int salaryHistorySeq, int empNoSeq, int salaryCodeSeq, String payDate, int companyNo,
			String positionCode, int paymentHour, int payStopPayment, String payType, String remark, String usageStatus,
			String salaryCodeName) {
		super();
		this.salaryHistorySeq = salaryHistorySeq;
		this.empNoSeq = empNoSeq;
		this.salaryCodeSeq = salaryCodeSeq;
		this.payDate = payDate;
		this.companyNo = companyNo;
		this.positionCode = positionCode;
		this.paymentHour = paymentHour;
		this.payStopPayment = payStopPayment;
		this.payType = payType;
		this.remark = remark;
		this.usageStatus = usageStatus;
		this.salaryCodeName = salaryCodeName;
	}

	public int getSalaryHistorySeq() {
		return salaryHistorySeq;
	}

	public void setSalaryHistorySeq(int salaryHistorySeq) {
		this.salaryHistorySeq = salaryHistorySeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public int getSalaryCodeSeq() {
		return salaryCodeSeq;
	}

	public void setSalaryCodeSeq(int salaryCodeSeq) {
		this.salaryCodeSeq = salaryCodeSeq;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
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
		return "Salary [salaryHistorySeq=" + salaryHistorySeq + ", empNoSeq=" + empNoSeq + ", salaryCodeSeq="
				+ salaryCodeSeq + ", payDate=" + payDate + ", companyNo=" + companyNo + ", positionCode=" + positionCode
				+ ", paymentHour=" + paymentHour + ", payStopPayment=" + payStopPayment + ", payType=" + payType
				+ ", remark=" + remark + ", usageStatus=" + usageStatus + ", salaryCodeName=" + salaryCodeName + "]";
	}

}
