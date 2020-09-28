package com.kh.insane.employee.model.vo;

public class Appointment implements java.io.Serializable{
	
	private int gvofodHistorySeq;
	private int targetEmpNo;
	private int companyNo;
	private String gvofodDate;
	private int gvofodCode;
	private String codeName;
	private int locationCode;
	private String locationName;
	private int departmentCode;
	private String deptName;
	private Integer repofcCode;
	private String repofcName;
	private int positionCode;
	private String positionName;
	private String remark;
	
	public Appointment() {}

	public Appointment(int gvofodHistorySeq, int targetEmpNo, int companyNo, String gvofodDate, int gvofodCode,
			String codeName, int locationCode, String locationName, int departmentCode, String deptName,
			Integer repofcCode, String repofcName, int positionCode, String positionName, String remark) {
		super();
		this.gvofodHistorySeq = gvofodHistorySeq;
		this.targetEmpNo = targetEmpNo;
		this.companyNo = companyNo;
		this.gvofodDate = gvofodDate;
		this.gvofodCode = gvofodCode;
		this.codeName = codeName;
		this.locationCode = locationCode;
		this.locationName = locationName;
		this.departmentCode = departmentCode;
		this.deptName = deptName;
		this.repofcCode = repofcCode;
		this.repofcName = repofcName;
		this.positionCode = positionCode;
		this.positionName = positionName;
		this.remark = remark;
	}

	public int getGvofodHistorySeq() {
		return gvofodHistorySeq;
	}

	public void setGvofodHistorySeq(int gvofodHistorySeq) {
		this.gvofodHistorySeq = gvofodHistorySeq;
	}

	public int getTargetEmpNo() {
		return targetEmpNo;
	}

	public void setTargetEmpNo(int targetEmpNo) {
		this.targetEmpNo = targetEmpNo;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getGvofodDate() {
		return gvofodDate;
	}

	public void setGvofodDate(String gvofodDate) {
		this.gvofodDate = gvofodDate;
	}

	public int getGvofodCode() {
		return gvofodCode;
	}

	public void setGvofodCode(int gvofodCode) {
		this.gvofodCode = gvofodCode;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public int getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(int locationCode) {
		this.locationCode = locationCode;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public int getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(int departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Integer getRepofcCode() {
		return repofcCode;
	}

	public void setRepofcCode(Integer repofcCode) {
		this.repofcCode = repofcCode;
	}

	public String getRepofcName() {
		return repofcName;
	}

	public void setRepofcName(String repofcName) {
		this.repofcName = repofcName;
	}

	public int getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(int positionCode) {
		this.positionCode = positionCode;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Appointment [gvofodHistorySeq=" + gvofodHistorySeq + ", targetEmpNo=" + targetEmpNo + ", companyNo="
				+ companyNo + ", gvofodDate=" + gvofodDate + ", gvofodCode=" + gvofodCode + ", codeName=" + codeName
				+ ", locationCode=" + locationCode + ", locationName=" + locationName + ", departmentCode="
				+ departmentCode + ", deptName=" + deptName + ", repofcCode=" + repofcCode + ", repofcName="
				+ repofcName + ", positionCode=" + positionCode + ", positionName=" + positionName + ", remark="
				+ remark + "]";
	}
	
}
