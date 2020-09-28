package com.kh.insane.salary.model.vo;

public class SalaryHistory implements java.io.Serializable {
	// SALARY_HISTORY 테이블
	private int salaryHistorySeq;// SALARY_HISTORY_SEQ
	private int empNoSeq;// EMP_NO_SEQ
	private int salaryCodeSeq;// SALARY_CODE_SEQ
	private String payDate;// PAY_DATE
	private int companyNo; // COMPANY_NO
	
	public SalaryHistory() {
		super();
	}

	public SalaryHistory(int salaryHistorySeq, int empNoSeq, int salaryCodeSeq, String payDate, int companyNo) {
		super();
		this.salaryHistorySeq = salaryHistorySeq;
		this.empNoSeq = empNoSeq;
		this.salaryCodeSeq = salaryCodeSeq;
		this.payDate = payDate;
		this.companyNo = companyNo;
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

	@Override
	public String toString() {
		return "SalaryHistory [salaryHistorySeq=" + salaryHistorySeq + ", empNoSeq=" + empNoSeq + ", salaryCodeSeq="
				+ salaryCodeSeq + ", payDate=" + payDate + ", companyNo=" + companyNo + "]";
	}

}
