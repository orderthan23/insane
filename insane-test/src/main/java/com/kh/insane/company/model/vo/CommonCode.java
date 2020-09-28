package com.kh.insane.company.model.vo;

/**
 * Class : CommonCode
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.30
 * @apiNote 공통 코드 정보를 담고있는 VO 객체
 */
public class CommonCode implements java.io.Serializable {
	
	private int commonCodeSeq;  	//공통코드관리번호
	private String relatedColumn;	//참조 컬럼명
	private String commonCode;		//공통코드
	private String codeName;		//공통코드명
	private String usageStatus;		//사용여부
	
	public CommonCode() {

	}

	public CommonCode(int commonCodeSeq, String relatedColumn, String commonCode, String codeName, String usageStatus) {
		super();
		this.commonCodeSeq = commonCodeSeq;
		this.relatedColumn = relatedColumn;
		this.commonCode = commonCode;
		this.codeName = codeName;
		this.usageStatus = usageStatus;
	}

	@Override
	public String toString() {
		return "CommonCode [commonCodeSeq=" + commonCodeSeq + ", relatedColumn=" + relatedColumn + ", commonCode="
				+ commonCode + ", codeName=" + codeName + ", usageStatus=" + usageStatus + "]";
	}

	public int getCommonCodeSeq() {
		return commonCodeSeq;
	}

	public void setCommonCodeSeq(int commonCodeSeq) {
		this.commonCodeSeq = commonCodeSeq;
	}

	public String getRelatedColumn() {
		return relatedColumn;
	}

	public void setRelatedColumn(String relatedColumn) {
		this.relatedColumn = relatedColumn;
	}

	public String getCommonCode() {
		return commonCode;
	}

	public void setCommonCode(String commonCode) {
		this.commonCode = commonCode;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getUsageStatus() {
		return usageStatus;
	}

	public void setUsageStatus(String usageStatus) {
		this.usageStatus = usageStatus;
	}
	
	
}