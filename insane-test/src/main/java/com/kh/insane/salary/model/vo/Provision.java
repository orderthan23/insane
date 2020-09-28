package com.kh.insane.salary.model.vo;

public class Provision {
	// PROVISION 테이블
	private int provisionSeq; // PROVISION_SEQ 지급수당코드
	private String provisionName;// PROVISION_NAME 지급항목명
	private String taxYn;// TAX_YN 과세비과세구분
	private String provisionType;// PROVISION_TYPE 지급항목유형
	private int provisionLimit;// PROVISION_LIMIT 지급금액한도
	private String npnYn;// NPN_YN 국민연금여부
	private String hlthinsYn;// HLTHINS_YN 건강보험여부
	private String empInsuranceYn;// EMP_INSURANCE_YN 고용보험여부
	private String incomeTaxYn;// INCOME_TAX_YN 소득세여부
	private String usageStatus;
	private int companyNo;// COMPANY_NO 회사번호
	// PROVISION_HISTORY 테이블, PROVISION_SEQ를 기준으로 LEFT JOIN
	private int provisionHistorySeq;
	private int empNoSeq;
	private int amount;
	private String payDate;
	
	public Provision() {
		super();
	}

	public Provision(int provisionSeq, String provisionName, String taxYn, String provisionType, int provisionLimit,
			String npnYn, String hlthinsYn, String empInsuranceYn, String incomeTaxYn, String usageStatus,
			int companyNo, int provisionHistorySeq, int empNoSeq, int amount, String payDate) {
		super();
		this.provisionSeq = provisionSeq;
		this.provisionName = provisionName;
		this.taxYn = taxYn;
		this.provisionType = provisionType;
		this.provisionLimit = provisionLimit;
		this.npnYn = npnYn;
		this.hlthinsYn = hlthinsYn;
		this.empInsuranceYn = empInsuranceYn;
		this.incomeTaxYn = incomeTaxYn;
		this.usageStatus = usageStatus;
		this.companyNo = companyNo;
		this.provisionHistorySeq = provisionHistorySeq;
		this.empNoSeq = empNoSeq;
		this.amount = amount;
		this.payDate = payDate;
	}

	public int getProvisionSeq() {
		return provisionSeq;
	}

	public void setProvisionSeq(int provisionSeq) {
		this.provisionSeq = provisionSeq;
	}

	public String getProvisionName() {
		return provisionName;
	}

	public void setProvisionName(String provisionName) {
		this.provisionName = provisionName;
	}

	public String getTaxYn() {
		return taxYn;
	}

	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}

	public String getProvisionType() {
		return provisionType;
	}

	public void setProvisionType(String provisionType) {
		this.provisionType = provisionType;
	}

	public int getProvisionLimit() {
		return provisionLimit;
	}

	public void setProvisionLimit(int provisionLimit) {
		this.provisionLimit = provisionLimit;
	}

	public String getNpnYn() {
		return npnYn;
	}

	public void setNpnYn(String npnYn) {
		this.npnYn = npnYn;
	}

	public String getHlthinsYn() {
		return hlthinsYn;
	}

	public void setHlthinsYn(String hlthinsYn) {
		this.hlthinsYn = hlthinsYn;
	}

	public String getEmpInsuranceYn() {
		return empInsuranceYn;
	}

	public void setEmpInsuranceYn(String empInsuranceYn) {
		this.empInsuranceYn = empInsuranceYn;
	}

	public String getIncomeTaxYn() {
		return incomeTaxYn;
	}

	public void setIncomeTaxYn(String incomeTaxYn) {
		this.incomeTaxYn = incomeTaxYn;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getProvisionHistorySeq() {
		return provisionHistorySeq;
	}

	public void setProvisionHistorySeq(int provisionHistorySeq) {
		this.provisionHistorySeq = provisionHistorySeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "Provision [provisionSeq=" + provisionSeq + ", provisionName=" + provisionName + ", taxYn=" + taxYn
				+ ", provisionType=" + provisionType + ", provisionLimit=" + provisionLimit + ", npnYn=" + npnYn
				+ ", hlthinsYn=" + hlthinsYn + ", empInsuranceYn=" + empInsuranceYn + ", incomeTaxYn=" + incomeTaxYn
				+ ", usageStatus=" + usageStatus + ", companyNo=" + companyNo + ", provisionHistorySeq="
				+ provisionHistorySeq + ", empNoSeq=" + empNoSeq + ", amount=" + amount + ", payDate=" + payDate + "]";
	}
	
}
