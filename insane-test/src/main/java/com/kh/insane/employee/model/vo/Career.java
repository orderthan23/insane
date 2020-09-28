package com.kh.insane.employee.model.vo;

public class Career implements java.io.Serializable {
	
	private int careerSeq;
	private int empNoSeq;
	private String lastCompanyName;
	private String enrollDate;
	private String retireDate;
	private String recogMonths;
	private String job;
	private String lastPosition;
	private String retireReason;
	private int companyNo;
	
	public Career() {}

	public Career(int careerSeq, int empNoSeq, String lastCompanyName, String enrollDate, String retireDate,
			String recogMonths, String job, String lastPosition, String retireReason, int companyNo) {
		super();
		this.careerSeq = careerSeq;
		this.empNoSeq = empNoSeq;
		this.lastCompanyName = lastCompanyName;
		this.enrollDate = enrollDate;
		this.retireDate = retireDate;
		this.recogMonths = recogMonths;
		this.job = job;
		this.lastPosition = lastPosition;
		this.retireReason = retireReason;
		this.companyNo = companyNo;
	}

	public int getCareerSeq() {
		return careerSeq;
	}

	public void setCareerSeq(int careerSeq) {
		this.careerSeq = careerSeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getLastCompanyName() {
		return lastCompanyName;
	}

	public void setLastCompanyName(String lastCompanyName) {
		this.lastCompanyName = lastCompanyName;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}

	public String getRecogMonths() {
		return recogMonths;
	}

	public void setRecogMonths(String recogMonths) {
		this.recogMonths = recogMonths;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getLastPosition() {
		return lastPosition;
	}

	public void setLastPosition(String lastPosition) {
		this.lastPosition = lastPosition;
	}

	public String getRetireReason() {
		return retireReason;
	}

	public void setRetireReason(String retireReason) {
		this.retireReason = retireReason;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "Career [careerSeq=" + careerSeq + ", empNoSeq=" + empNoSeq + ", lastCompanyName=" + lastCompanyName
				+ ", enrollDate=" + enrollDate + ", retireDate=" + retireDate + ", recogMonths=" + recogMonths
				+ ", job=" + job + ", lastPosition=" + lastPosition + ", retireReason=" + retireReason + ", companyNo="
				+ companyNo + "]";
	}
	
}
