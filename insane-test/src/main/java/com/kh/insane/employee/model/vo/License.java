package com.kh.insane.employee.model.vo;

public class License implements java.io.Serializable {
	
	private int licenseSeq;
	private int empNoSeq;
	private String licenseAcqDate;
	private int licenseCode;
	private String licenseName;
	private String licenseNo;
	private String licenseIssued;
	private int companyNo;
	
	public License() {}

	public License(int licenseSeq, int empNoSeq, String licenseAcqDate, int licenseCode, String licenseName,
			String licenseNo, String licenseIssued, int companyNo) {
		super();
		this.licenseSeq = licenseSeq;
		this.empNoSeq = empNoSeq;
		this.licenseAcqDate = licenseAcqDate;
		this.licenseCode = licenseCode;
		this.licenseName = licenseName;
		this.licenseNo = licenseNo;
		this.licenseIssued = licenseIssued;
		this.companyNo = companyNo;
	}

	public int getLicenseSeq() {
		return licenseSeq;
	}

	public void setLicenseSeq(int licenseSeq) {
		this.licenseSeq = licenseSeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getLicenseAcqDate() {
		return licenseAcqDate;
	}

	public void setLicenseAcqDate(String licenseAcqDate) {
		this.licenseAcqDate = licenseAcqDate;
	}

	public int getLicenseCode() {
		return licenseCode;
	}

	public void setLicenseCode(int licenseCode) {
		this.licenseCode = licenseCode;
	}

	public String getLicenseName() {
		return licenseName;
	}

	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public String getLicenseIssued() {
		return licenseIssued;
	}

	public void setLicenseIssued(String licenseIssued) {
		this.licenseIssued = licenseIssued;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "License [licenseSeq=" + licenseSeq + ", empNoSeq=" + empNoSeq + ", licenseAcqDate=" + licenseAcqDate
				+ ", licenseCode=" + licenseCode + ", licenseName=" + licenseName + ", licenseNo=" + licenseNo
				+ ", licenseIssued=" + licenseIssued + ", companyNo=" + companyNo + "]";
	}
	
}
