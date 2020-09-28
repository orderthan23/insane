package com.kh.insane.employee.model.vo;

public class Health implements java.io.Serializable {

	private int healthSeq;
	private int empNoSeq;
	private String healthCheckDate;
	private String institutionName;
	private int height;
	private int weight;
	private String bloodType;
	private String leftSight;
	private String rightSight;
	private String colorBlindYN;
	private String leftHear;
	private String rightHear;
	private String bloodPresureType;
	private String recheckYN;
	private String disorderStep;
	private int companyNo;
	
	public Health() {}

	public Health(int healthSeq, int empNoSeq, String healthCheckDate, String institutionName, int height, int weight,
			String bloodType, String leftSight, String rightSight, String colorBlindYN, String leftHear,
			String rightHear, String bloodPresureType, String recheckYN, String disorderStep, int companyNo) {
		super();
		this.healthSeq = healthSeq;
		this.empNoSeq = empNoSeq;
		this.healthCheckDate = healthCheckDate;
		this.institutionName = institutionName;
		this.height = height;
		this.weight = weight;
		this.bloodType = bloodType;
		this.leftSight = leftSight;
		this.rightSight = rightSight;
		this.colorBlindYN = colorBlindYN;
		this.leftHear = leftHear;
		this.rightHear = rightHear;
		this.bloodPresureType = bloodPresureType;
		this.recheckYN = recheckYN;
		this.disorderStep = disorderStep;
		this.companyNo = companyNo;
	}

	public int getHealthSeq() {
		return healthSeq;
	}

	public void setHealthSeq(int healthSeq) {
		this.healthSeq = healthSeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getHealthCheckDate() {
		return healthCheckDate;
	}

	public void setHealthCheckDate(String healthCheckDate) {
		this.healthCheckDate = healthCheckDate;
	}

	public String getInstitutionName() {
		return institutionName;
	}

	public void setInstitutionName(String institutionName) {
		this.institutionName = institutionName;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getLeftSight() {
		return leftSight;
	}

	public void setLeftSight(String leftSight) {
		this.leftSight = leftSight;
	}

	public String getRightSight() {
		return rightSight;
	}

	public void setRightSight(String rightSight) {
		this.rightSight = rightSight;
	}

	public String getColorBlindYN() {
		return colorBlindYN;
	}

	public void setColorBlindYN(String colorBlindYN) {
		this.colorBlindYN = colorBlindYN;
	}

	public String getLeftHear() {
		return leftHear;
	}

	public void setLeftHear(String leftHear) {
		this.leftHear = leftHear;
	}

	public String getRightHear() {
		return rightHear;
	}

	public void setRightHear(String rightHear) {
		this.rightHear = rightHear;
	}

	public String getBloodPresureType() {
		return bloodPresureType;
	}

	public void setBloodPresureType(String bloodPresureType) {
		this.bloodPresureType = bloodPresureType;
	}

	public String getRecheckYN() {
		return recheckYN;
	}

	public void setRecheckYN(String recheckYN) {
		this.recheckYN = recheckYN;
	}

	public String getDisorderStep() {
		return disorderStep;
	}

	public void setDisorderStep(String disorderStep) {
		this.disorderStep = disorderStep;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "Health [healthSeq=" + healthSeq + ", empNoSeq=" + empNoSeq + ", healthCheckDate=" + healthCheckDate
				+ ", institutionName=" + institutionName + ", height=" + height + ", weight=" + weight + ", bloodType="
				+ bloodType + ", leftSight=" + leftSight + ", rightSight=" + rightSight + ", colorBlindYN="
				+ colorBlindYN + ", leftHear=" + leftHear + ", rightHear=" + rightHear + ", bloodPresureType="
				+ bloodPresureType + ", recheckYN=" + recheckYN + ", disorderStep=" + disorderStep + ", companyNo="
				+ companyNo + "]";
	}
	
}
