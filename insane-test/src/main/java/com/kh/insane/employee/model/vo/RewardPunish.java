package com.kh.insane.employee.model.vo;

public class RewardPunish implements java.io.Serializable {
	
	private int rwrdPnshHistorySeq;
	private int targetEmpNo;
	private int companyNo;
	private String rwrdPnshType;
	private String pnshStartDate;
	private String pnsgEndDate;
	private String rpReason;
	private String rpContent;
	
	public RewardPunish() {}

	public RewardPunish(int rwrdPnshHistorySeq, int targetEmpNo, int companyNo, String rwrdPnshType,
			String pnshStartDate, String pnsgEndDate, String rpReason, String rpContent) {
		super();
		this.rwrdPnshHistorySeq = rwrdPnshHistorySeq;
		this.targetEmpNo = targetEmpNo;
		this.companyNo = companyNo;
		this.rwrdPnshType = rwrdPnshType;
		this.pnshStartDate = pnshStartDate;
		this.pnsgEndDate = pnsgEndDate;
		this.rpReason = rpReason;
		this.rpContent = rpContent;
	}

	public int getRwrdPnshHistorySeq() {
		return rwrdPnshHistorySeq;
	}

	public void setRwrdPnshHistorySeq(int rwrdPnshHistorySeq) {
		this.rwrdPnshHistorySeq = rwrdPnshHistorySeq;
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

	public String getRwrdPnshType() {
		return rwrdPnshType;
	}

	public void setRwrdPnshType(String rwrdPnshType) {
		this.rwrdPnshType = rwrdPnshType;
	}

	public String getPnshStartDate() {
		return pnshStartDate;
	}

	public void setPnshStartDate(String pnshStartDate) {
		this.pnshStartDate = pnshStartDate;
	}

	public String getPnsgEndDate() {
		return pnsgEndDate;
	}

	public void setPnsgEndDate(String pnsgEndDate) {
		this.pnsgEndDate = pnsgEndDate;
	}

	public String getRpReason() {
		return rpReason;
	}

	public void setRpReason(String rpReason) {
		this.rpReason = rpReason;
	}

	public String getRpContent() {
		return rpContent;
	}

	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}

	@Override
	public String toString() {
		return "RewardPunish [rwrdPnshHistorySeq=" + rwrdPnshHistorySeq + ", targetEmpNo=" + targetEmpNo
				+ ", companyNo=" + companyNo + ", rwrdPnshType=" + rwrdPnshType + ", pnshStartDate=" + pnshStartDate
				+ ", pnsgEndDate=" + pnsgEndDate + ", rpReason=" + rpReason + ", rpContent=" + rpContent + "]";
	}
	
}
