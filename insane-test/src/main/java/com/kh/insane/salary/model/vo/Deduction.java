package com.kh.insane.salary.model.vo;

public class Deduction {
	//DEDUCTION 테이블
	private int deductionSeq;//DEDUCTION_SEQ 공제사항코드
	private String deductionName;//DEDUCTION_NAME 공제항목명
	private String deductionType;//DEDUCTION_TYPE 공제소득유형
	private int divSalary;//DIV_SALARY 구분월급여액
	private double deductionPt;//DEDUCTION_PT 공제항목별 요율
	private char autoRegist;//AUTO_REGIST 자동등록여부
	private String usageStatus;//USAGE_STATUS 사용여부
	private String remark;//REMARK 비고
	private int companyNo;//COMPANY_NO 회사번호
	
	// DEDUCTION_SEQ를 기준으로 DEDUCTION_HISTORY 테이블 LEFT JOIN
	
	private int deductionHistorySeq;//DEDUCTION_HISTORY_SEQ 공제사항내역번호
	private String payDate; //PAY_DATE 지급일자
	private int amount;//AMOUNT 금액
	private int empNoSeq;//EMP_NO_SEQ 사원번호
	
	public Deduction() {
		super();
	}

	public Deduction(int deductionSeq, String deductionName, String deductionType, int divSalary, double deductionPt,
			char autoRegist, String usageStatus, String remark, int companyNo, int deductionHistorySeq, String payDate,
			int amount, int empNoSeq) {
		super();
		this.deductionSeq = deductionSeq;
		this.deductionName = deductionName;
		this.deductionType = deductionType;
		this.divSalary = divSalary;
		this.deductionPt = deductionPt;
		this.autoRegist = autoRegist;
		this.usageStatus = usageStatus;
		this.remark = remark;
		this.companyNo = companyNo;
		this.deductionHistorySeq = deductionHistorySeq;
		this.payDate = payDate;
		this.amount = amount;
		this.empNoSeq = empNoSeq;
	}

	public int getDeductionSeq() {
		return deductionSeq;
	}

	public void setDeductionSeq(int deductionSeq) {
		this.deductionSeq = deductionSeq;
	}

	public String getDeductionName() {
		return deductionName;
	}

	public void setDeductionName(String deductionName) {
		this.deductionName = deductionName;
	}

	public String getDeductionType() {
		return deductionType;
	}

	public void setDeductionType(String deductionType) {
		this.deductionType = deductionType;
	}

	public int getDivSalary() {
		return divSalary;
	}

	public void setDivSalary(int divSalary) {
		this.divSalary = divSalary;
	}

	public double getDeductionPt() {
		return deductionPt;
	}

	public void setDeductionPt(double deductionPt) {
		this.deductionPt = deductionPt;
	}

	public char getAutoRegist() {
		return autoRegist;
	}

	public void setAutoRegist(char autoRegist) {
		this.autoRegist = autoRegist;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getDeductionHistorySeq() {
		return deductionHistorySeq;
	}

	public void setDeductionHistorySeq(int deductionHistorySeq) {
		this.deductionHistorySeq = deductionHistorySeq;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	@Override
	public String toString() {
		return "Deduction [deductionSeq=" + deductionSeq + ", deductionName=" + deductionName + ", deductionType="
				+ deductionType + ", divSalary=" + divSalary + ", deductionPt=" + deductionPt + ", autoRegist="
				+ autoRegist + ", usageStatus=" + usageStatus + ", remark=" + remark + ", companyNo=" + companyNo
				+ ", deductionHistorySeq=" + deductionHistorySeq + ", payDate=" + payDate + ", amount=" + amount
				+ ", empNoSeq=" + empNoSeq + "]";
	}
	
	
}



