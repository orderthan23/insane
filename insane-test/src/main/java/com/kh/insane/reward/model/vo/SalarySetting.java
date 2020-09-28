package com.kh.insane.reward.model.vo;

import java.util.ArrayList;

public class SalarySetting implements java.io.Serializable {

	private int salarySeq;
	private int positionSeq;
	private String positionName;
	private String salaryCodeName;
	private int paymentHour;
	private int payStepPayment;
	private String payType;
	private String remark;
	private String usageStatus;
	private int companyNo;
	private ArrayList<SalarySetting> salarySettingList;
	
	public SalarySetting() {}

	public SalarySetting(int salarySeq, int positionSeq, String positionName, String salaryCodeName, int paymentHour,
			int payStepPayment, String payType, String remark, String usageStatus, int companyNo,
			ArrayList<SalarySetting> salarySettingList) {
		super();
		this.salarySeq = salarySeq;
		this.positionSeq = positionSeq;
		this.positionName = positionName;
		this.salaryCodeName = salaryCodeName;
		this.paymentHour = paymentHour;
		this.payStepPayment = payStepPayment;
		this.payType = payType;
		this.remark = remark;
		this.usageStatus = usageStatus;
		this.companyNo = companyNo;
		this.salarySettingList = salarySettingList;
	}

	public int getSalarySeq() {
		return salarySeq;
	}

	public void setSalarySeq(int salarySeq) {
		this.salarySeq = salarySeq;
	}

	public int getPositionSeq() {
		return positionSeq;
	}

	public void setPositionSeq(int positionSeq) {
		this.positionSeq = positionSeq;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getSalaryCodeName() {
		return salaryCodeName;
	}

	public void setSalaryCodeName(String salaryCodeName) {
		this.salaryCodeName = salaryCodeName;
	}

	public int getPaymentHour() {
		return paymentHour;
	}

	public void setPaymentHour(int paymentHour) {
		this.paymentHour = paymentHour;
	}

	public int getPayStepPayment() {
		return payStepPayment;
	}

	public void setPayStepPayment(int payStepPayment) {
		this.payStepPayment = payStepPayment;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public ArrayList<SalarySetting> getSalarySettingList() {
		return salarySettingList;
	}

	public void setSalarySettingList(ArrayList<SalarySetting> salarySettingList) {
		this.salarySettingList = salarySettingList;
	}

	@Override
	public String toString() {
		return "SalarySetting [salarySeq=" + salarySeq + ", positionSeq=" + positionSeq + ", positionName="
				+ positionName + ", salaryCodeName=" + salaryCodeName + ", paymentHour=" + paymentHour
				+ ", payStepPayment=" + payStepPayment + ", payType=" + payType + ", remark=" + remark
				+ ", usageStatus=" + usageStatus + ", companyNo=" + companyNo + ", salarySettingList="
				+ salarySettingList + "]";
	}

}
