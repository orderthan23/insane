package com.kh.insane.reward.model.vo;

import java.util.ArrayList;

public class DeductionSetting implements java.io.Serializable {

	private int deductionSeq;
	private String deductionName;
	private String deductionType;
	private int divSalary;
	private double deductionPt;
	private String autoRegist;
	private String usageStatus;
	private String remark;
	private int companyNo;
	private ArrayList<DeductionSetting> deductionSettingList;
	
	public DeductionSetting() {}

	public DeductionSetting(int deductionSeq, String deductionName, String deductionType, int divSalary,
			double deductionPt, String autoRegist, String usageStatus, String remark, int companyNo,
			ArrayList<DeductionSetting> deductionSettingList) {
		super();
		this.deductionSeq = deductionSeq;
		this.deductionName = deductionName;
		this.deductionType = deductionType;
		this.divSalary = divSalary;
		this.deductionPt = deductionPt;
		this.autoRegist = autoRegist;
		this.usageStatus = usageStatus;
		this.remark = remark;
		this.companyNo = companyNo;
		this.deductionSettingList = deductionSettingList;
	}

	public int getDeductionSeq() {
		return deductionSeq;
	}

	public void setDeductionSeq(int deductionSeq) {
		this.deductionSeq = deductionSeq;
	}

	public String getDeductionName() {
		return deductionName;
	}

	public void setDeductionName(String deductionName) {
		this.deductionName = deductionName;
	}

	public String getDeductionType() {
		return deductionType;
	}

	public void setDeductionType(String deductionType) {
		this.deductionType = deductionType;
	}

	public int getDivSalary() {
		return divSalary;
	}

	public void setDivSalary(int divSalary) {
		this.divSalary = divSalary;
	}

	public double getDeductionPt() {
		return deductionPt;
	}

	public void setDeductionPt(double deductionPt) {
		this.deductionPt = deductionPt;
	}

	public String getAutoRegist() {
		return autoRegist;
	}

	public void setAutoRegist(String autoRegist) {
		this.autoRegist = autoRegist;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
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

	public ArrayList<DeductionSetting> getDeductionSettingList() {
		return deductionSettingList;
	}

	public void setDeductionSettingList(ArrayList<DeductionSetting> deductionSettingList) {
		this.deductionSettingList = deductionSettingList;
	}

	@Override
	public String toString() {
		return "DeductionSetting [deductionSeq=" + deductionSeq + ", deductionName=" + deductionName
				+ ", deductionType=" + deductionType + ", divSalary=" + divSalary + ", deductionPt=" + deductionPt
				+ ", autoRegist=" + autoRegist + ", usageStatus=" + usageStatus + ", remark=" + remark + ", companyNo="
				+ companyNo + ", deductionSettingList=" + deductionSettingList + "]";
	}
	
}
