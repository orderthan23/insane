package com.kh.insane.reward.model.vo;

import java.util.ArrayList;

public class ProvisionSetting implements java.io.Serializable {

	private int provisionSeq;
	private String provisionName;
	private String taxYn;
	private String provisionType;
	private int provisionLimit;
	private String npnYn;
	private String hlthinsYn;
	private String empInsuranceYn;
	private String incomeTaxYn;
	private String usageStatus;
	private int companyNo;
	private ArrayList<ProvisionSetting> provisionSettingList;
	
	public ProvisionSetting() {}

	public ProvisionSetting(int provisionSeq, String provisionName, String taxYn, String provisionType,
			int provisionLimit, String npnYn, String hlthinsYn, String empInsuranceYn, String incomeTaxYn,
			String usageStatus, int companyNo, ArrayList<ProvisionSetting> provisionSettingList) {
		super();
		this.provisionSeq = provisionSeq;
		this.provisionName = provisionName;
		this.taxYn = taxYn;
		this.provisionType = provisionType;
		this.provisionLimit = provisionLimit;
		this.npnYn = npnYn;
		this.hlthinsYn = hlthinsYn;
		this.empInsuranceYn = empInsuranceYn;
		this.incomeTaxYn = incomeTaxYn;
		this.usageStatus = usageStatus;
		this.companyNo = companyNo;
		this.provisionSettingList = provisionSettingList;
	}

	public int getProvisionSeq() {
		return provisionSeq;
	}

	public void setProvisionSeq(int provisionSeq) {
		this.provisionSeq = provisionSeq;
	}

	public String getProvisionName() {
		return provisionName;
	}

	public void setProvisionName(String provisionName) {
		this.provisionName = provisionName;
	}

	public String getTaxYn() {
		return taxYn;
	}

	public void setTaxYn(String taxYn) {
		this.taxYn = taxYn;
	}

	public String getProvisionType() {
		return provisionType;
	}

	public void setProvisionType(String provisionType) {
		this.provisionType = provisionType;
	}

	public int getProvisionLimit() {
		return provisionLimit;
	}

	public void setProvisionLimit(int provisionLimit) {
		this.provisionLimit = provisionLimit;
	}

	public String getNpnYn() {
		return npnYn;
	}

	public void setNpnYn(String npnYn) {
		this.npnYn = npnYn;
	}

	public String getHlthinsYn() {
		return hlthinsYn;
	}

	public void setHlthinsYn(String hlthinsYn) {
		this.hlthinsYn = hlthinsYn;
	}

	public String getEmpInsuranceYn() {
		return empInsuranceYn;
	}

	public void setEmpInsuranceYn(String empInsuranceYn) {
		this.empInsuranceYn = empInsuranceYn;
	}

	public String getIncomeTaxYn() {
		return incomeTaxYn;
	}

	public void setIncomeTaxYn(String incomeTaxYn) {
		this.incomeTaxYn = incomeTaxYn;
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

	public ArrayList<ProvisionSetting> getProvisionSettingList() {
		return provisionSettingList;
	}

	public void setProvisionSettingList(ArrayList<ProvisionSetting> provisionSettingList) {
		this.provisionSettingList = provisionSettingList;
	}

	@Override
	public String toString() {
		return "ProvisionSetting [provisionSeq=" + provisionSeq + ", provisionName=" + provisionName + ", taxYn="
				+ taxYn + ", provisionType=" + provisionType + ", provisionLimit=" + provisionLimit + ", npnYn=" + npnYn
				+ ", hlthinsYn=" + hlthinsYn + ", empInsuranceYn=" + empInsuranceYn + ", incomeTaxYn=" + incomeTaxYn
				+ ", usageStatus=" + usageStatus + ", companyNo=" + companyNo + ", provisionSettingList="
				+ provisionSettingList + "]";
	}
}
