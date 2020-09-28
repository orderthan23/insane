package com.kh.insane.attendance.model.vo;

public class AttendancePolicy implements java.io.Serializable {
	
	private int companyNo;
	private String workStart;
	private String workEnd;
	private String lunchStart;
	private String lunchEnd;
	private String allowedWorkStart;
	private String allowedWorkEnd;
	private String commuteWay;
	private String holidayYn;
	private String holidayFirst;
	private String holidaySecond;
	
	public AttendancePolicy() {}

	public AttendancePolicy(int companyNo, String workStart, String workEnd, String lunchStart, String lunchEnd,
			String allowedWorkStart, String allowedWorkEnd, String commuteWay, String holidayYn, String holidayFirst,
			String holidaySecond) {
		super();
		this.companyNo = companyNo;
		this.workStart = workStart;
		this.workEnd = workEnd;
		this.lunchStart = lunchStart;
		this.lunchEnd = lunchEnd;
		this.allowedWorkStart = allowedWorkStart;
		this.allowedWorkEnd = allowedWorkEnd;
		this.commuteWay = commuteWay;
		this.holidayYn = holidayYn;
		this.holidayFirst = holidayFirst;
		this.holidaySecond = holidaySecond;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getWorkStart() {
		return workStart;
	}

	public void setWorkStart(String workStart) {
		this.workStart = workStart;
	}

	public String getWorkEnd() {
		return workEnd;
	}

	public void setWorkEnd(String workEnd) {
		this.workEnd = workEnd;
	}

	public String getLunchStart() {
		return lunchStart;
	}

	public void setLunchStart(String lunchStart) {
		this.lunchStart = lunchStart;
	}

	public String getLunchEnd() {
		return lunchEnd;
	}

	public void setLunchEnd(String lunchEnd) {
		this.lunchEnd = lunchEnd;
	}

	public String getAllowedWorkStart() {
		return allowedWorkStart;
	}

	public void setAllowedWorkStart(String allowedWorkStart) {
		this.allowedWorkStart = allowedWorkStart;
	}

	public String getAllowedWorkEnd() {
		return allowedWorkEnd;
	}

	public void setAllowedWorkEnd(String allowedWorkEnd) {
		this.allowedWorkEnd = allowedWorkEnd;
	}

	public String getCommuteWay() {
		return commuteWay;
	}

	public void setCommuteWay(String commuteWay) {
		this.commuteWay = commuteWay;
	}

	public String getHolidayYn() {
		return holidayYn;
	}

	public void setHolidayYn(String holidayYn) {
		this.holidayYn = holidayYn;
	}

	public String getHolidayFirst() {
		return holidayFirst;
	}

	public void setHolidayFirst(String holidayFirst) {
		this.holidayFirst = holidayFirst;
	}

	public String getHolidaySecond() {
		return holidaySecond;
	}

	public void setHolidaySecond(String holidaySecond) {
		this.holidaySecond = holidaySecond;
	}

	@Override
	public String toString() {
		return "AttendancePolicy [companyNo=" + companyNo + ", workStart=" + workStart + ", workEnd=" + workEnd
				+ ", lunchStart=" + lunchStart + ", lunchEnd=" + lunchEnd + ", allowedWorkStart=" + allowedWorkStart
				+ ", allowedWorkEnd=" + allowedWorkEnd + ", commuteWay=" + commuteWay + ", holidayYn=" + holidayYn
				+ ", holidayFirst=" + holidayFirst + ", holidaySecond=" + holidaySecond + "]";
	}
	
}