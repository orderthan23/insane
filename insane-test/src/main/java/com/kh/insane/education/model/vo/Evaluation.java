package com.kh.insane.education.model.vo;

public class Evaluation implements java.io.Serializable{
	
	private int eduScheduleSeq;
	private int empNoSeq;
	private String empNo;
	private String passFail;
	private String remark;
	private int company;
	private String empNameKor;
	private String deptName;
	private String positionName;
	
	public Evaluation() {

	}

	public Evaluation(int eduScheduleSeq, int empNoSeq, String empNo, String passFail, String remark, int company,
			String empNameKor, String deptName, String positionName) {
		super();
		this.eduScheduleSeq = eduScheduleSeq;
		this.empNoSeq = empNoSeq;
		this.empNo = empNo;
		this.passFail = passFail;
		this.remark = remark;
		this.company = company;
		this.empNameKor = empNameKor;
		this.deptName = deptName;
		this.positionName = positionName;
	}

	@Override
	public String toString() {
		return "Evaluation [eduScheduleSeq=" + eduScheduleSeq + ", empNoSeq=" + empNoSeq + ", empNo=" + empNo
				+ ", passFail=" + passFail + ", remark=" + remark + ", company=" + company + ", empNameKor="
				+ empNameKor + ", deptName=" + deptName + ", positionName=" + positionName + "]";
	}

	public int getEduScheduleSeq() {
		return eduScheduleSeq;
	}

	public void setEduScheduleSeq(int eduScheduleSeq) {
		this.eduScheduleSeq = eduScheduleSeq;
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

	public int getCompany() {
		return company;
	}

	public void setCompany(int company) {
		this.company = company;
	}

	public String getEmpNameKor() {
		return empNameKor;
	}

	public void setEmpNameKor(String empNameKor) {
		this.empNameKor = empNameKor;
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

	
	
	

}
