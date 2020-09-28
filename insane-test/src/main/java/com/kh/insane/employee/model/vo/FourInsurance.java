package com.kh.insane.employee.model.vo;

public class FourInsurance implements java.io.Serializable {
	
	private int fourInsSeq;
	private int empNoSeq;
	private int companyNo;
	private String ntnEnrollDate;
	private String hltEnrollDate;
	private String empEnrollDate;
	private String accEnrollDate;
	private String ntnLossDate;
	private String hltLossDate;
	private String empLossDate;
	private String accLossDate;
	private String enrollDate;
	private String hltLimitDate;
	private String etcLimitDate;
	
	public FourInsurance() {}

	public FourInsurance(int fourInsSeq, int empNoSeq, int companyNo, String ntnEnrollDate, String hltEnrollDate,
			String empEnrollDate, String accEnrollDate, String ntnLossDate, String hltLossDate, String empLossDate,
			String accLossDate, String enrollDate, String hltLimitDate, String etcLimitDate) {
		super();
		this.fourInsSeq = fourInsSeq;
		this.empNoSeq = empNoSeq;
		this.companyNo = companyNo;
		this.ntnEnrollDate = ntnEnrollDate;
		this.hltEnrollDate = hltEnrollDate;
		this.empEnrollDate = empEnrollDate;
		this.accEnrollDate = accEnrollDate;
		this.ntnLossDate = ntnLossDate;
		this.hltLossDate = hltLossDate;
		this.empLossDate = empLossDate;
		this.accLossDate = accLossDate;
		this.enrollDate = enrollDate;
		this.hltLimitDate = hltLimitDate;
		this.etcLimitDate = etcLimitDate;
	}

	public int getFourInsSeq() {
		return fourInsSeq;
	}

	public void setFourInsSeq(int fourInsSeq) {
		this.fourInsSeq = fourInsSeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getNtnEnrollDate() {
		return ntnEnrollDate;
	}

	public void setNtnEnrollDate(String ntnEnrollDate) {
		this.ntnEnrollDate = ntnEnrollDate;
	}

	public String getHltEnrollDate() {
		return hltEnrollDate;
	}

	public void setHltEnrollDate(String hltEnrollDate) {
		this.hltEnrollDate = hltEnrollDate;
	}

	public String getEmpEnrollDate() {
		return empEnrollDate;
	}

	public void setEmpEnrollDate(String empEnrollDate) {
		this.empEnrollDate = empEnrollDate;
	}

	public String getAccEnrollDate() {
		return accEnrollDate;
	}

	public void setAccEnrollDate(String accEnrollDate) {
		this.accEnrollDate = accEnrollDate;
	}

	public String getNtnLossDate() {
		return ntnLossDate;
	}

	public void setNtnLossDate(String ntnLossDate) {
		this.ntnLossDate = ntnLossDate;
	}

	public String getHltLossDate() {
		return hltLossDate;
	}

	public void setHltLossDate(String hltLossDate) {
		this.hltLossDate = hltLossDate;
	}

	public String getEmpLossDate() {
		return empLossDate;
	}

	public void setEmpLossDate(String empLossDate) {
		this.empLossDate = empLossDate;
	}

	public String getAccLossDate() {
		return accLossDate;
	}

	public void setAccLossDate(String accLossDate) {
		this.accLossDate = accLossDate;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getHltLimitDate() {
		return hltLimitDate;
	}

	public void setHltLimitDate(String hltLimitDate) {
		this.hltLimitDate = hltLimitDate;
	}

	public String getEtcLimitDate() {
		return etcLimitDate;
	}

	public void setEtcLimitDate(String etcLimitDate) {
		this.etcLimitDate = etcLimitDate;
	}

	@Override
	public String toString() {
		return "FourInsurance [fourInsSeq=" + fourInsSeq + ", empNoSeq=" + empNoSeq + ", companyNo=" + companyNo
				+ ", ntnEnrollDate=" + ntnEnrollDate + ", hltEnrollDate=" + hltEnrollDate + ", empEnrollDate="
				+ empEnrollDate + ", accEnrollDate=" + accEnrollDate + ", ntnLossDate=" + ntnLossDate + ", hltLossDate="
				+ hltLossDate + ", empLossDate=" + empLossDate + ", accLossDate=" + accLossDate + ", enrollDate="
				+ enrollDate + ", hltLimitDate=" + hltLimitDate + ", etcLimitDate=" + etcLimitDate + "]";
	}
	
}
