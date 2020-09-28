package com.kh.insane.attendance.model.vo;

import java.sql.Date;

public class EmpAttHistory implements java.io.Serializable {

	private int attHistorySeq;
	private int empNo;
	private String empName;
	private Date attDate;
	private String attDateString;
	private String daysEnds;
	private String attCode;
	private String attTime;
	private String leaveTime;
	private String outTime;
	private String backTime;
	private String remark;
	private int companyNo;
	private String closeStatus;
	private String workTime;
	private Date startDate;
	private Date endDate;
	private double attCount;
	private String totalWorkTime;
	private String normalTime;
	private String extraTime;
	private String nightTime;
	private double vacationDay;
	private int lateCount;
	private int earlyLv;
	
	private String deptName;
	private String positionName;
	
	public EmpAttHistory() {}

	public EmpAttHistory(int attHistorySeq, int empNo, String empName, Date attDate, String attDateString,
			String daysEnds, String attCode, String attTime, String leaveTime, String outTime, String backTime,
			String remark, int companyNo, String closeStatus, String workTime, Date startDate, Date endDate,
			double attCount, String totalWorkTime, String normalTime, String extraTime, String nightTime,
			double vacationDay, int lateCount, int earlyLv, String deptName, String positionName) {
		super();
		this.attHistorySeq = attHistorySeq;
		this.empNo = empNo;
		this.empName = empName;
		this.attDate = attDate;
		this.attDateString = attDateString;
		this.daysEnds = daysEnds;
		this.attCode = attCode;
		this.attTime = attTime;
		this.leaveTime = leaveTime;
		this.outTime = outTime;
		this.backTime = backTime;
		this.remark = remark;
		this.companyNo = companyNo;
		this.closeStatus = closeStatus;
		this.workTime = workTime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.attCount = attCount;
		this.totalWorkTime = totalWorkTime;
		this.normalTime = normalTime;
		this.extraTime = extraTime;
		this.nightTime = nightTime;
		this.vacationDay = vacationDay;
		this.lateCount = lateCount;
		this.earlyLv = earlyLv;
		this.deptName = deptName;
		this.positionName = positionName;
	}

	public int getAttHistorySeq() {
		return attHistorySeq;
	}

	public void setAttHistorySeq(int attHistorySeq) {
		this.attHistorySeq = attHistorySeq;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getAttDate() {
		return attDate;
	}

	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}

	public String getAttDateString() {
		return attDateString;
	}

	public void setAttDateString(String attDateString) {
		this.attDateString = attDateString;
	}

	public String getDaysEnds() {
		return daysEnds;
	}

	public void setDaysEnds(String daysEnds) {
		this.daysEnds = daysEnds;
	}

	public String getAttCode() {
		return attCode;
	}

	public void setAttCode(String attCode) {
		this.attCode = attCode;
	}

	public String getAttTime() {
		return attTime;
	}

	public void setAttTime(String attTime) {
		this.attTime = attTime;
	}

	public String getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(String leaveTime) {
		this.leaveTime = leaveTime;
	}

	public String getOutTime() {
		return outTime;
	}

	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}

	public String getBackTime() {
		return backTime;
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
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

	public String getCloseStatus() {
		return closeStatus;
	}

	public void setCloseStatus(String closeStatus) {
		this.closeStatus = closeStatus;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public double getAttCount() {
		return attCount;
	}

	public void setAttCount(double attCount) {
		this.attCount = attCount;
	}

	public String getTotalWorkTime() {
		return totalWorkTime;
	}

	public void setTotalWorkTime(String totalWorkTime) {
		this.totalWorkTime = totalWorkTime;
	}

	public String getNormalTime() {
		return normalTime;
	}

	public void setNormalTime(String normalTime) {
		this.normalTime = normalTime;
	}

	public String getExtraTime() {
		return extraTime;
	}

	public void setExtraTime(String extraTime) {
		this.extraTime = extraTime;
	}

	public String getNightTime() {
		return nightTime;
	}

	public void setNightTime(String nightTime) {
		this.nightTime = nightTime;
	}

	public double getVacationDay() {
		return vacationDay;
	}

	public void setVacationDay(double vacationDay) {
		this.vacationDay = vacationDay;
	}

	public int getLateCount() {
		return lateCount;
	}

	public void setLateCount(int lateCount) {
		this.lateCount = lateCount;
	}

	public int getEarlyLv() {
		return earlyLv;
	}

	public void setEarlyLv(int earlyLv) {
		this.earlyLv = earlyLv;
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

	@Override
	public String toString() {
		return "EmpAttHistory [attHistorySeq=" + attHistorySeq + ", empNo=" + empNo + ", empName=" + empName
				+ ", attDate=" + attDate + ", attDateString=" + attDateString + ", daysEnds=" + daysEnds + ", attCode="
				+ attCode + ", attTime=" + attTime + ", leaveTime=" + leaveTime + ", outTime=" + outTime + ", backTime="
				+ backTime + ", remark=" + remark + ", companyNo=" + companyNo + ", closeStatus=" + closeStatus
				+ ", workTime=" + workTime + ", startDate=" + startDate + ", endDate=" + endDate + ", attCount="
				+ attCount + ", totalWorkTime=" + totalWorkTime + ", normalTime=" + normalTime + ", extraTime="
				+ extraTime + ", nightTime=" + nightTime + ", vacationDay=" + vacationDay + ", lateCount=" + lateCount
				+ ", earlyLv=" + earlyLv + ", deptName=" + deptName + ", positionName=" + positionName + "]";
	}
}
