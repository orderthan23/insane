package com.kh.insane.attendance.model.vo;

import java.sql.Date;

public class HolidaySetting implements java.io.Serializable {

	private int holidaySeq;
	private String holidayName;
	private String holidayType;
	private Date holidayDate;
	private String remark;
	private int CompanyNo;
	
	public HolidaySetting() {}

	public HolidaySetting(int holidaySeq, String holidayName, String holidayType, Date holidayDate, String remark,
			int companyNo) {
		super();
		this.holidaySeq = holidaySeq;
		this.holidayName = holidayName;
		this.holidayType = holidayType;
		this.holidayDate = holidayDate;
		this.remark = remark;
		CompanyNo = companyNo;
	}

	public int getHolidaySeq() {
		return holidaySeq;
	}

	public void setHolidaySeq(int holidaySeq) {
		this.holidaySeq = holidaySeq;
	}

	public String getHolidayName() {
		return holidayName;
	}

	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}

	public String getHolidayType() {
		return holidayType;
	}

	public void setHolidayType(String holidayType) {
		this.holidayType = holidayType;
	}

	public Date getHolidayDate() {
		return holidayDate;
	}

	public void setHolidayDate(Date holidayDate) {
		this.holidayDate = holidayDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getCompanyNo() {
		return CompanyNo;
	}

	public void setCompanyNo(int companyNo) {
		CompanyNo = companyNo;
	}

	@Override
	public String toString() {
		return "HolidaySetting [holidaySeq=" + holidaySeq + ", holidayName=" + holidayName + ", holidayType="
				+ holidayType + ", holidayDate=" + holidayDate + ", remark=" + remark + ", CompanyNo=" + CompanyNo
				+ "]";
	}
	
}
