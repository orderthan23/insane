package com.kh.insane.organization.model.vo;

/**
 * <pre>
 * Class : OrganizationChart
 * Comment : 조직도 정보 담는 클래스
 * History
 * 2020/09/03 (이재형) 처음 작성
 * </pre>
 * @author 이재형
 *
 */
public class OrganizationChart implements java.io.Serializable {
	
	private String levelName;
	private String levelSpace;
	private String deptName;
	private int deptCodeSeq;
	private int upperDeptCode;
	private String upperDeptName;
	private int deptPresent;
	private int level;
	private int sumPresent;
	
	public OrganizationChart() {}

	public OrganizationChart(String levelName, String levelSpace, String deptName, int deptCodeSeq, int upperDeptCode,
			String upperDeptName, int deptPresent, int level, int sumPresent) {
		super();
		this.levelName = levelName;
		this.levelSpace = levelSpace;
		this.deptName = deptName;
		this.deptCodeSeq = deptCodeSeq;
		this.upperDeptCode = upperDeptCode;
		this.upperDeptName = upperDeptName;
		this.deptPresent = deptPresent;
		this.level = level;
		this.sumPresent = sumPresent;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public String getLevelSpace() {
		return levelSpace;
	}

	public void setLevelSpace(String levelSpace) {
		this.levelSpace = levelSpace;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getDeptCodeSeq() {
		return deptCodeSeq;
	}

	public void setDeptCodeSeq(int deptCodeSeq) {
		this.deptCodeSeq = deptCodeSeq;
	}

	public int getUpperDeptCode() {
		return upperDeptCode;
	}

	public void setUpperDeptCode(int upperDeptCode) {
		this.upperDeptCode = upperDeptCode;
	}

	public String getUpperDeptName() {
		return upperDeptName;
	}

	public void setUpperDeptName(String upperDeptName) {
		this.upperDeptName = upperDeptName;
	}

	public int getDeptPresent() {
		return deptPresent;
	}

	public void setDeptPresent(int deptPresent) {
		this.deptPresent = deptPresent;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getSumPresent() {
		return sumPresent;
	}

	public void setSumPresent(int sumPresent) {
		this.sumPresent = sumPresent;
	}

	@Override
	public String toString() {
		return "OrganizationChart [levelName=" + levelName + ", levelSpace=" + levelSpace + ", deptName=" + deptName
				+ ", deptCodeSeq=" + deptCodeSeq + ", upperDeptCode=" + upperDeptCode + ", upperDeptName="
				+ upperDeptName + ", deptPresent=" + deptPresent + ", level=" + level + ", sumPresent=" + sumPresent
				+ "]";
	}

}
