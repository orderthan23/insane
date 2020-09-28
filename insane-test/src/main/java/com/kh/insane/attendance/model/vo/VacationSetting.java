package com.kh.insane.attendance.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class VacationSetting implements java.io.Serializable {

	private int vacationSeq;
	private String vacationName;
	private String paidUnpaid;
	private int vacationAmount;
	private Integer vacationOccurUnit;
	private String criteriaType;
	private String vacStatus;
	private int companyNo;
	private ArrayList<VacationSetting> vacationSettingList;
	private int totalAmount;
	private int empNoSeq;
	private String ampm;
	private double decreaseDays;
	private Date check;
	
	private int vacHisSeq;
	private Date reqDate;
	private Date vacStartDate;
	private Date vacEndDate;
	private String reqDateString;
	private String vacStartDateString;
	private String vacEndDateString;
	private String vacReason;
	private String processStatus;
	
	private String empNameKor;
	private String deptName;
	private String positionName;
	
	public VacationSetting() {}

	public VacationSetting(int vacationSeq, String vacationName, String paidUnpaid, int vacationAmount,
			Integer vacationOccurUnit, String criteriaType, String vacStatus, int companyNo,
			ArrayList<VacationSetting> vacationSettingList, int totalAmount, int empNoSeq, String ampm,
			double decreaseDays, Date check, int vacHisSeq, Date reqDate, Date vacStartDate, Date vacEndDate,
			String reqDateString, String vacStartDateString, String vacEndDateString, String vacReason,
			String processStatus, String empNameKor, String deptName, String positionName) {
		super();
		this.vacationSeq = vacationSeq;
		this.vacationName = vacationName;
		this.paidUnpaid = paidUnpaid;
		this.vacationAmount = vacationAmount;
		this.vacationOccurUnit = vacationOccurUnit;
		this.criteriaType = criteriaType;
		this.vacStatus = vacStatus;
		this.companyNo = companyNo;
		this.vacationSettingList = vacationSettingList;
		this.totalAmount = totalAmount;
		this.empNoSeq = empNoSeq;
		this.ampm = ampm;
		this.decreaseDays = decreaseDays;
		this.check = check;
		this.vacHisSeq = vacHisSeq;
		this.reqDate = reqDate;
		this.vacStartDate = vacStartDate;
		this.vacEndDate = vacEndDate;
		this.reqDateString = reqDateString;
		this.vacStartDateString = vacStartDateString;
		this.vacEndDateString = vacEndDateString;
		this.vacReason = vacReason;
		this.processStatus = processStatus;
		this.empNameKor = empNameKor;
		this.deptName = deptName;
		this.positionName = positionName;
	}

	public int getVacationSeq() {
		return vacationSeq;
	}

	public void setVacationSeq(int vacationSeq) {
		this.vacationSeq = vacationSeq;
	}

	public String getVacationName() {
		return vacationName;
	}

	public void setVacationName(String vacationName) {
		this.vacationName = vacationName;
	}

	public String getPaidUnpaid() {
		return paidUnpaid;
	}

	public void setPaidUnpaid(String paidUnpaid) {
		this.paidUnpaid = paidUnpaid;
	}

	public int getVacationAmount() {
		return vacationAmount;
	}

	public void setVacationAmount(int vacationAmount) {
		this.vacationAmount = vacationAmount;
	}

	public Integer getVacationOccurUnit() {
		return vacationOccurUnit;
	}

	public void setVacationOccurUnit(Integer vacationOccurUnit) {
		this.vacationOccurUnit = vacationOccurUnit;
	}

	public String getCriteriaType() {
		return criteriaType;
	}

	public void setCriteriaType(String criteriaType) {
		this.criteriaType = criteriaType;
	}

	public String getVacStatus() {
		return vacStatus;
	}

	public void setVacStatus(String vacStatus) {
		this.vacStatus = vacStatus;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public ArrayList<VacationSetting> getVacationSettingList() {
		return vacationSettingList;
	}

	public void setVacationSettingList(ArrayList<VacationSetting> vacationSettingList) {
		this.vacationSettingList = vacationSettingList;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getAmpm() {
		return ampm;
	}

	public void setAmpm(String ampm) {
		this.ampm = ampm;
	}

	public double getDecreaseDays() {
		return decreaseDays;
	}

	public void setDecreaseDays(double decreaseDays) {
		this.decreaseDays = decreaseDays;
	}

	public Date getCheck() {
		return check;
	}

	public void setCheck(Date check) {
		this.check = check;
	}

	public int getVacHisSeq() {
		return vacHisSeq;
	}

	public void setVacHisSeq(int vacHisSeq) {
		this.vacHisSeq = vacHisSeq;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public Date getVacStartDate() {
		return vacStartDate;
	}

	public void setVacStartDate(Date vacStartDate) {
		this.vacStartDate = vacStartDate;
	}

	public Date getVacEndDate() {
		return vacEndDate;
	}

	public void setVacEndDate(Date vacEndDate) {
		this.vacEndDate = vacEndDate;
	}

	public String getReqDateString() {
		return reqDateString;
	}

	public void setReqDateString(String reqDateString) {
		this.reqDateString = reqDateString;
	}

	public String getVacStartDateString() {
		return vacStartDateString;
	}

	public void setVacStartDateString(String vacStartDateString) {
		this.vacStartDateString = vacStartDateString;
	}

	public String getVacEndDateString() {
		return vacEndDateString;
	}

	public void setVacEndDateString(String vacEndDateString) {
		this.vacEndDateString = vacEndDateString;
	}

	public String getVacReason() {
		return vacReason;
	}

	public void setVacReason(String vacReason) {
		this.vacReason = vacReason;
	}

	public String getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(String processStatus) {
		this.processStatus = processStatus;
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

	@Override
	public String toString() {
		return "VacationSetting [vacationSeq=" + vacationSeq + ", vacationName=" + vacationName + ", paidUnpaid="
				+ paidUnpaid + ", vacationAmount=" + vacationAmount + ", vacationOccurUnit=" + vacationOccurUnit
				+ ", criteriaType=" + criteriaType + ", vacStatus=" + vacStatus + ", companyNo=" + companyNo
				+ ", vacationSettingList=" + vacationSettingList + ", totalAmount=" + totalAmount + ", empNoSeq="
				+ empNoSeq + ", ampm=" + ampm + ", decreaseDays=" + decreaseDays + ", check=" + check + ", vacHisSeq="
				+ vacHisSeq + ", reqDate=" + reqDate + ", vacStartDate=" + vacStartDate + ", vacEndDate=" + vacEndDate
				+ ", reqDateString=" + reqDateString + ", vacStartDateString=" + vacStartDateString
				+ ", vacEndDateString=" + vacEndDateString + ", vacReason=" + vacReason + ", processStatus="
				+ processStatus + ", empNameKor=" + empNameKor + ", deptName=" + deptName + ", positionName="
				+ positionName + "]";
	}
}
