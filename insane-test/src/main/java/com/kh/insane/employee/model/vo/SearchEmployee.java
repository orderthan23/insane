package com.kh.insane.employee.model.vo;

public class SearchEmployee implements java.io.Serializable {
	
	private String empNo;
	private String empNameKor;
	private String empForm;
	private String locationName;
	private String deptName;
	private String positionName;
	private String rspofcName;
	private String empOfficeTel;
	private String empPhone;
	private String enrollDate;
	private int companyNo;
	
	public SearchEmployee() {}

	public SearchEmployee(String empNo, String empNameKor, String empForm, String locationName, String deptName,
			String positionName, String rspofcName, String empOfficeTel, String empPhone, String enrollDate,
			int companyNo) {
		super();
		this.empNo = empNo;
		this.empNameKor = empNameKor;
		this.empForm = empForm;
		this.locationName = locationName;
		this.deptName = deptName;
		this.positionName = positionName;
		this.rspofcName = rspofcName;
		this.empOfficeTel = empOfficeTel;
		this.empPhone = empPhone;
		this.enrollDate = enrollDate;
		this.companyNo = companyNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpNameKor() {
		return empNameKor;
	}

	public void setEmpNameKor(String empNameKor) {
		this.empNameKor = empNameKor;
	}

	public String getEmpForm() {
		return empForm;
	}

	public void setEmpForm(String empForm) {
		this.empForm = empForm;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getRspofcName() {
		return rspofcName;
	}

	public void setRspofcName(String rspofcName) {
		this.rspofcName = rspofcName;
	}

	public String getEmpOfficeTel() {
		return empOfficeTel;
	}

	public void setEmpOfficeTel(String empOfficeTel) {
		this.empOfficeTel = empOfficeTel;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "SearchEmployee [empNo=" + empNo + ", empNameKor=" + empNameKor + ", empForm=" + empForm
				+ ", locationName=" + locationName + ", deptName=" + deptName + ", positionName=" + positionName
				+ ", rspofcName=" + rspofcName + ", empOfficeTel=" + empOfficeTel + ", empPhone=" + empPhone
				+ ", enrollDate=" + enrollDate + ", companyNo=" + companyNo + "]";
	}
	
}
