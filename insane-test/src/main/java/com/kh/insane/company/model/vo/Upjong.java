package com.kh.insane.company.model.vo;

/**
 * Class : Upjong
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.28
 * @apiNote 업종 코드 정보를 가지고 있는 VO 객체
 */
public class Upjong implements java.io.Serializable {

	private String years; 		//귀속년도
	private String upjongCode;	//업종코드
	private String bigSep;		//대분류
	private String mediumSep;	//중분류		
	private String smallSep;	//소분류
	private String microSep;	//세분류
	
	public Upjong() {
	}

	public Upjong(String years, String upjongCode, String bigSep, String mediumSep, String smallSep, String microSep) {
		super();
		this.years = years;
		this.upjongCode = upjongCode;
		this.bigSep = bigSep;
		this.mediumSep = mediumSep;
		this.smallSep = smallSep;
		this.microSep = microSep;
	}

	@Override
	public String toString() {
		return "Upjong [years=" + years + ", upjongCode=" + upjongCode + ", bigSep=" + bigSep + ", mediumSep="
				+ mediumSep + ", smallSep=" + smallSep + ", microSep=" + microSep + "]";
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getUpjongCode() {
		return upjongCode;
	}

	public void setUpjongCode(String upjongCode) {
		this.upjongCode = upjongCode;
	}

	public String getBigSep() {
		return bigSep;
	}

	public void setBigSep(String bigSep) {
		this.bigSep = bigSep;
	}

	public String getMediumSep() {
		return mediumSep;
	}

	public void setMediumSep(String mediumSep) {
		this.mediumSep = mediumSep;
	}

	public String getSmallSep() {
		return smallSep;
	}

	public void setSmallSep(String smallSep) {
		this.smallSep = smallSep;
	}

	public String getMicroSep() {
		return microSep;
	}

	public void setMicroSep(String microSep) {
		this.microSep = microSep;
	}
	
	
}
