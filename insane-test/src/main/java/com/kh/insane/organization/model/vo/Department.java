package com.kh.insane.organization.model.vo;

public class Department implements java.io.Serializable {
	
	private Integer deptCodeSeq;
	private String deptName;
	private int companyNo;
	private int deptStep;
	private Integer upperDeptCode;
	private String upperDeptName;
	private String deptTel;
	private String usageStatus;
	private String genDate;
	private String delDate;
	private int deptLimit;
	private Integer deptPresent;
	private String cngDate;
	
	public Department() {}

	public Department(Integer deptCodeSeq, String deptName, int companyNo, int deptStep, Integer upperDeptCode,
			String upperDeptName, String deptTel, String usageStatus, String genDate, String delDate, int deptLimit,
			Integer deptPresent, String cngDate) {
		super();
		this.deptCodeSeq = deptCodeSeq;
		this.deptName = deptName;
		this.companyNo = companyNo;
		this.deptStep = deptStep;
		this.upperDeptCode = upperDeptCode;
		this.upperDeptName = upperDeptName;
		this.deptTel = deptTel;
		this.usageStatus = usageStatus;
		this.genDate = genDate;
		this.delDate = delDate;
		this.deptLimit = deptLimit;
		this.deptPresent = deptPresent;
		this.cngDate = cngDate;
	}

	public Integer getDeptCodeSeq() {
		return deptCodeSeq;
	}

	public void setDeptCodeSeq(Integer deptCodeSeq) {
		this.deptCodeSeq = deptCodeSeq;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getDeptStep() {
		return deptStep;
	}

	public void setDeptStep(int deptStep) {
		this.deptStep = deptStep;
	}

	public Integer getUpperDeptCode() {
		return upperDeptCode;
	}

	public void setUpperDeptCode(Integer upperDeptCode) {
		this.upperDeptCode = upperDeptCode;
	}

	public String getUpperDeptName() {
		return upperDeptName;
	}

	public void setUpperDeptName(String upperDeptName) {
		this.upperDeptName = upperDeptName;
	}

	public String getDeptTel() {
		return deptTel;
	}

	public void setDeptTel(String deptTel) {
		this.deptTel = deptTel;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}

	public String getGenDate() {
		return genDate;
	}

	public void setGenDate(String genDate) {
		this.genDate = genDate;
	}

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public int getDeptLimit() {
		return deptLimit;
	}

	public void setDeptLimit(int deptLimit) {
		this.deptLimit = deptLimit;
	}

	public Integer getDeptPresent() {
		return deptPresent;
	}

	public void setDeptPresent(Integer deptPresent) {
		this.deptPresent = deptPresent;
	}

	public String getCngDate() {
		return cngDate;
	}

	public void setCngDate(String cngDate) {
		this.cngDate = cngDate;
	}

	@Override
	public String toString() {
		return "Department [deptCodeSeq=" + deptCodeSeq + ", deptName=" + deptName + ", companyNo=" + companyNo
				+ ", deptStep=" + deptStep + ", upperDeptCode=" + upperDeptCode + ", upperDeptName=" + upperDeptName
				+ ", deptTel=" + deptTel + ", usageStatus=" + usageStatus + ", genDate=" + genDate + ", delDate="
				+ delDate + ", deptLimit=" + deptLimit + ", deptPresent=" + deptPresent + ", cngDate=" + cngDate + "]";
	}
	
}
