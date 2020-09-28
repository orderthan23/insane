package com.kh.insane.employee.model.vo;

public class Location implements java.io.Serializable{
	
	private int locationSeq;
	private String locationName;
	private String officeAddress;
	private int companyNo;
	
	public Location() {}

	public Location(int locationSeq, String locationName, String officeAddress, int companyNo) {
		super();
		this.locationSeq = locationSeq;
		this.locationName = locationName;
		this.officeAddress = officeAddress;
		this.companyNo = companyNo;
	}

	public int getLocationSeq() {
		return locationSeq;
	}

	public void setLocationSeq(int locationSeq) {
		this.locationSeq = locationSeq;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getOfficeAddress() {
		return officeAddress;
	}

	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "Location [locationSeq=" + locationSeq + ", locationName=" + locationName + ", officeAddress="
				+ officeAddress + ", companyNo=" + companyNo + "]";
	}
	
}
