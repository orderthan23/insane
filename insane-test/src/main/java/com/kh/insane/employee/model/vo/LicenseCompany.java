package com.kh.insane.employee.model.vo;

public class LicenseCompany implements java.io.Serializable {
	
	private int licenseCompanySeq;
	private String licenseName;
	private String usageStatus;
	private int provisionAmount;
	private int companyNo;
	
	public LicenseCompany() {}

	public LicenseCompany(int licenseCompanySeq, String licenseName, String usageStatus, int provisionAmount,
			int companyNo) {
		super();
		this.licenseCompanySeq = licenseCompanySeq;
		this.licenseName = licenseName;
		this.usageStatus = usageStatus;
		this.provisionAmount = provisionAmount;
		this.companyNo = companyNo;
	}

	public int getLicenseCompanySeq() {
		return licenseCompanySeq;
	}

	public void setLicenseCompanySeq(int licenseCompanySeq) {
		this.licenseCompanySeq = licenseCompanySeq;
	}

	public String getLicenseName() {
		return licenseName;
	}

	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}

	public int getProvisionAmount() {
		return provisionAmount;
	}

	public void setProvisionAmount(int provisionAmount) {
		this.provisionAmount = provisionAmount;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "LicenseCompany [licenseCompanySeq=" + licenseCompanySeq + ", licenseName=" + licenseName
				+ ", usageStatus=" + usageStatus + ", provisionAmount=" + provisionAmount + ", companyNo=" + companyNo
				+ "]";
	}
	
}
