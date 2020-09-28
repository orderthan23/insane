package com.kh.insane.employee.model.vo;

public class Employee implements java.io.Serializable {
	
	private int empNoSeq;
	private String empNo;
	private int companyNo;
	private String empPwd;
	private String empNameKor;
	private String empNameEng;
	private String enrollDate;
	private String empResidentNo;
	private Integer empLocationCode;
	private String locationName;
	private Integer empDeptCode;
	private String deptName;
	private Integer empPositionCode;
	private String positionName;
	private Integer empRspofcCode;
	private String rspofcName;
	private Integer payStepCode;
	private int payStep;
	private String empAddress;
	private String retireDate;
	private String empBirthday;
	private String lunarSor;
	private String gender;
	private String empHomeTel;
	private String empPhone;
	private String empOfficeTel;
	private String empForm;
	private String empOccupation;
	private String empSpot;
	private String empProject;
	private String empStatus;
	
	public Employee() {}

	public Employee(int empNoSeq, String empNo, int companyNo, String empPwd, String empNameKor, String empNameEng,
			String enrollDate, String empResidentNo, Integer empLocationCode, String locationName, Integer empDeptCode,
			String deptName, Integer empPositionCode, String positionName, Integer empRspofcCode, String rspofcName,
			Integer payStepCode, int payStep, String empAddress, String retireDate, String empBirthday, String lunarSor,
			String gender, String empHomeTel, String empPhone, String empOfficeTel, String empForm,
			String empOccupation, String empSpot, String empProject, String empStatus) {
		super();
		this.empNoSeq = empNoSeq;
		this.empNo = empNo;
		this.companyNo = companyNo;
		this.empPwd = empPwd;
		this.empNameKor = empNameKor;
		this.empNameEng = empNameEng;
		this.enrollDate = enrollDate;
		this.empResidentNo = empResidentNo;
		this.empLocationCode = empLocationCode;
		this.locationName = locationName;
		this.empDeptCode = empDeptCode;
		this.deptName = deptName;
		this.empPositionCode = empPositionCode;
		this.positionName = positionName;
		this.empRspofcCode = empRspofcCode;
		this.rspofcName = rspofcName;
		this.payStepCode = payStepCode;
		this.payStep = payStep;
		this.empAddress = empAddress;
		this.retireDate = retireDate;
		this.empBirthday = empBirthday;
		this.lunarSor = lunarSor;
		this.gender = gender;
		this.empHomeTel = empHomeTel;
		this.empPhone = empPhone;
		this.empOfficeTel = empOfficeTel;
		this.empForm = empForm;
		this.empOccupation = empOccupation;
		this.empSpot = empSpot;
		this.empProject = empProject;
		this.empStatus = empStatus;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmpNameKor() {
		return empNameKor;
	}

	public void setEmpNameKor(String empNameKor) {
		this.empNameKor = empNameKor;
	}

	public String getEmpNameEng() {
		return empNameEng;
	}

	public void setEmpNameEng(String empNameEng) {
		this.empNameEng = empNameEng;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getEmpResidentNo() {
		return empResidentNo;
	}

	public void setEmpResidentNo(String empResidentNo) {
		this.empResidentNo = empResidentNo;
	}

	public Integer getEmpLocationCode() {
		return empLocationCode;
	}

	public void setEmpLocationCode(Integer empLocationCode) {
		this.empLocationCode = empLocationCode;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public Integer getEmpDeptCode() {
		return empDeptCode;
	}

	public void setEmpDeptCode(Integer empDeptCode) {
		this.empDeptCode = empDeptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Integer getEmpPositionCode() {
		return empPositionCode;
	}

	public void setEmpPositionCode(Integer empPositionCode) {
		this.empPositionCode = empPositionCode;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public Integer getEmpRspofcCode() {
		return empRspofcCode;
	}

	public void setEmpRspofcCode(Integer empRspofcCode) {
		this.empRspofcCode = empRspofcCode;
	}

	public String getRspofcName() {
		return rspofcName;
	}

	public void setRspofcName(String rspofcName) {
		this.rspofcName = rspofcName;
	}

	public Integer getPayStepCode() {
		return payStepCode;
	}

	public void setPayStepCode(Integer payStepCode) {
		this.payStepCode = payStepCode;
	}

	public int getPayStep() {
		return payStep;
	}

	public void setPayStep(int payStep) {
		this.payStep = payStep;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public String getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}

	public String getEmpBirthday() {
		return empBirthday;
	}

	public void setEmpBirthday(String empBirthday) {
		this.empBirthday = empBirthday;
	}

	public String getLunarSor() {
		return lunarSor;
	}

	public void setLunarSor(String lunarSor) {
		this.lunarSor = lunarSor;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmpHomeTel() {
		return empHomeTel;
	}

	public void setEmpHomeTel(String empHomeTel) {
		this.empHomeTel = empHomeTel;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpOfficeTel() {
		return empOfficeTel;
	}

	public void setEmpOfficeTel(String empOfficeTel) {
		this.empOfficeTel = empOfficeTel;
	}

	public String getEmpForm() {
		return empForm;
	}

	public void setEmpForm(String empForm) {
		this.empForm = empForm;
	}

	public String getEmpOccupation() {
		return empOccupation;
	}

	public void setEmpOccupation(String empOccupation) {
		this.empOccupation = empOccupation;
	}

	public String getEmpSpot() {
		return empSpot;
	}

	public void setEmpSpot(String empSpot) {
		this.empSpot = empSpot;
	}

	public String getEmpProject() {
		return empProject;
	}

	public void setEmpProject(String empProject) {
		this.empProject = empProject;
	}

	public String getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}

	@Override
	public String toString() {
		return "Employee [empNoSeq=" + empNoSeq + ", empNo=" + empNo + ", companyNo=" + companyNo + ", empPwd=" + empPwd
				+ ", empNameKor=" + empNameKor + ", empNameEng=" + empNameEng + ", enrollDate=" + enrollDate
				+ ", empResidentNo=" + empResidentNo + ", empLocationCode=" + empLocationCode + ", locationName="
				+ locationName + ", empDeptCode=" + empDeptCode + ", deptName=" + deptName + ", empPositionCode="
				+ empPositionCode + ", positionName=" + positionName + ", empRspofcCode=" + empRspofcCode
				+ ", rspofcName=" + rspofcName + ", payStepCode=" + payStepCode + ", payStep=" + payStep
				+ ", empAddress=" + empAddress + ", retireDate=" + retireDate + ", empBirthday=" + empBirthday
				+ ", lunarSor=" + lunarSor + ", gender=" + gender + ", empHomeTel=" + empHomeTel + ", empPhone="
				+ empPhone + ", empOfficeTel=" + empOfficeTel + ", empForm=" + empForm + ", empOccupation="
				+ empOccupation + ", empSpot=" + empSpot + ", empProject=" + empProject + ", empStatus=" + empStatus
				+ "]";
	}

}