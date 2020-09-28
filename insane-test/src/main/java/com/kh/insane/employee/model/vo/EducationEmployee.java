package com.kh.insane.employee.model.vo;

public class EducationEmployee implements java.io.Serializable {
	
	private int eduScheduleSeq;
	private String eduTitle;
	private String eduStartDate;
	private String eduEndDate;
	private int empNoSeq;
	private String passFail;
	private String remark;
	private int companyNo;
	
	public EducationEmployee() {}

	public EducationEmployee(int eduScheduleSeq, String eduTitle, String eduStartDate, String eduEndDate, int empNoSeq,
			String passFail, String remark, int companyNo) {
		super();
		this.eduScheduleSeq = eduScheduleSeq;
		this.eduTitle = eduTitle;
		this.eduStartDate = eduStartDate;
		this.eduEndDate = eduEndDate;
		this.empNoSeq = empNoSeq;
		this.passFail = passFail;
		this.remark = remark;
		this.companyNo = companyNo;
	}

	public int getEduScheduleSeq() {
		return eduScheduleSeq;
	}

	public void setEduScheduleSeq(int eduScheduleSeq) {
		this.eduScheduleSeq = eduScheduleSeq;
	}

	public String getEduTitle() {
		return eduTitle;
	}

	public void setEduTitle(String eduTitle) {
		this.eduTitle = eduTitle;
	}

	public String getEduStartDate() {
		return eduStartDate;
	}

	public void setEduStartDate(String eduStartDate) {
		this.eduStartDate = eduStartDate;
	}

	public String getEduEndDate() {
		return eduEndDate;
	}

	public void setEduEndDate(String eduEndDate) {
		this.eduEndDate = eduEndDate;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getPassFail() {
		return passFail;
	}

	public void setPassFail(String passFail) {
		this.passFail = passFail;
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

	@Override
	public String toString() {
		return "EducationEmployee [eduScheduleSeq=" + eduScheduleSeq + ", eduTitle=" + eduTitle + ", eduStartDate="
				+ eduStartDate + ", eduEndDate=" + eduEndDate + ", empNoSeq=" + empNoSeq + ", passFail=" + passFail
				+ ", remark=" + remark + ", companyNo=" + companyNo + "]";
	}
	
}
