package com.kh.insane.company.model.vo;

/**
 * Class : CompanyInfo
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.20
 * @apiNote 회사의 기본 정보를 담고있는 vo(기초 정보, 추가정보, 담당자 정보)
 */
public class CompanyInfo implements java.io.Serializable {
	
	private int companyNo;								//회사번호
	private String hrYear;								//인사년도
	private String corpPers;							//법인/개인 구분
	private String businessLicenseNo;					//사업자 등록번호
	private String corparateRegistNo; 					//법인 등록번호
	private String representName;  						//대표자명
	private String representResidentNo; 				//대표자 주민등록 번호
	private String representLocalForegin;  				//대표자 내외국인 여부
	private String businessAddress; 					//사업장 주소
	private String beobJeongCode; 						//법정동 코드
	private String businessTel; 						//사업장 전화번호
	private String businessFax; 						//사업장 팩스번호
	private String businessTypeCode; 					//업종코드
	private String businessOpenDate; 					//개업년월일
	private String businessEndDate; 					//폐업년월일
	private String companyStatus; 						//회사활성화상태
	private String companyName;							//회사이름
	private String businessBigType;						//업종대분류
	private String businessMediumType;					//업종중분류
	private String businessSmallType;					//업종소분류
	private String businessMicroType;					//업종세분류
										//추가정보
	private String corpType; 							//법인구분
	private String smallBusinessYn; 					//중소기업여부
	private String nonSmallType; 						//비중소기업 구분
	private String companyType; 						//회사종류별구분
	private String operateStartDate; 					//정상사업시작일
	private String operateEndDate; 						//정상사업종료일
	private String headOfficeAddress; 					//본점주소
	private String taxationType; 						//과세유형(개인)
	private String incomeClassification; 				//소득구분(개인)
	private String representType; 						//대표자구분(개인)
	private String jointOfficeYn; 						//공동사업장여부(개인)
	private String mainResidentNo; 						//주된 소득자 주민등록번호
	private String mainResidentType; 					//주된 소득자 구분
										//담당자 정보
	private String adminName; 							//담당자 성명
	private String adminDepartment; 					//담당자 부서
	private String adminPhone; 							//담당자 전화번호
	private String adminEmail; 							//담당자 이메일 
	private String adminAuthorizedEmail; 				//공인 전자 주소
	
	private String startPwd;							//초기 비밀번호
	private String companyLogoImgPath;					//회사 로고사진 경로

	
	public CompanyInfo() {

	}





	public CompanyInfo(int companyNo, String hrYear, String corpPers, String businessLicenseNo,
			String corparateRegistNo, String representName, String representResidentNo, String representLocalForegin,
			String businessAddress, String beobJeongCode, String businessTel, String businessFax,
			String businessTypeCode, String businessOpenDate, String businessEndDate, String companyStatus,
			String companyName, String businessBigType, String businessType, String businessMediumType,
			String businessSmallType, String businessMicroType, String corpType, String smallBusinessYn,
			String nonSmallType, String companyType, String operateStartDate, String operateEndDate,
			String headOfficeAddress, String taxationType, String incomeClassification, String representType,
			String jointOfficeYn, String mainResidentNo, String mainResidentType, String adminName,
			String adminDepartment, String adminPhone, String adminEmail, String adminAuthorizedEmail, String startPwd,
			String companyLogoImgPath) {
			super();
			this.companyNo = companyNo;
			this.hrYear = hrYear;
			this.corpPers = corpPers;
			this.businessLicenseNo = businessLicenseNo;
			this.corparateRegistNo = corparateRegistNo;
			this.representName = representName;
			this.representResidentNo = representResidentNo;
			this.representLocalForegin = representLocalForegin;
			this.businessAddress = businessAddress;
			this.beobJeongCode = beobJeongCode;
			this.businessTel = businessTel;
			this.businessFax = businessFax;
			this.businessTypeCode = businessTypeCode;
			this.businessOpenDate = businessOpenDate;
			this.businessEndDate = businessEndDate;
			this.companyStatus = companyStatus;
			this.companyName = companyName;
			this.businessBigType = businessBigType;
			this.businessMediumType = businessMediumType;
			this.businessSmallType = businessSmallType;
			this.businessMicroType = businessMicroType;
			this.corpType = corpType;
			this.smallBusinessYn = smallBusinessYn;
			this.nonSmallType = nonSmallType;
			this.companyType = companyType;
			this.operateStartDate = operateStartDate;
			this.operateEndDate = operateEndDate;
			this.headOfficeAddress = headOfficeAddress;
			this.taxationType = taxationType;
			this.incomeClassification = incomeClassification;
			this.representType = representType;
			this.jointOfficeYn = jointOfficeYn;
			this.mainResidentNo = mainResidentNo;
			this.mainResidentType = mainResidentType;
			this.adminName = adminName;
			this.adminDepartment = adminDepartment;
			this.adminPhone = adminPhone;
			this.adminEmail = adminEmail;
			this.adminAuthorizedEmail = adminAuthorizedEmail;
			this.startPwd = startPwd;
			this.companyLogoImgPath = companyLogoImgPath;
	}





	public CompanyInfo(int companyNo, String hrYear, String corpPers, String businessLicenseNo,
			String corparateRegistNo, String representName, String representResidentNo, String representLocalForegin,
			String businessAddress, String beobJeongCode, String businessTel, String businessFax,
			String businessTypeCode, String businessOpenDate, String businessEndDate, String companyStatus) {
		super();
		this.companyNo = companyNo;
		this.hrYear = hrYear;
		this.corpPers = corpPers;
		this.businessLicenseNo = businessLicenseNo;
		this.corparateRegistNo = corparateRegistNo;
		this.representName = representName;
		this.representResidentNo = representResidentNo;
		this.representLocalForegin = representLocalForegin;
		this.businessAddress = businessAddress;
		this.beobJeongCode = beobJeongCode;
		this.businessTel = businessTel;
		this.businessFax = businessFax;
		this.businessTypeCode = businessTypeCode;
		this.businessOpenDate = businessOpenDate;
		this.businessEndDate = businessEndDate;
		this.companyStatus = companyStatus;
	}





	@Override
	public String toString() {
		return "CompanyInfo [companyNo=" + companyNo + ", hrYear=" + hrYear + ", corpPers=" + corpPers
				+ ", businessLicenseNo=" + businessLicenseNo + ", corparateRegistNo=" + corparateRegistNo
				+ ", representName=" + representName + ", representResidentNo=" + representResidentNo
				+ ", representLocalForegin=" + representLocalForegin + ", businessAddress=" + businessAddress
				+ ", beobJeongCode=" + beobJeongCode + ", businessTel=" + businessTel + ", businessFax=" + businessFax
				+ ", businessTypeCode=" + businessTypeCode + ", businessOpenDate=" + businessOpenDate
				+ ", businessEndDate=" + businessEndDate + ", companyStatus=" + companyStatus + ", companyName="
				+ companyName + ", businessBigType=" + businessBigType + ", businessMediumType=" + businessMediumType
				+ ", businessSmallType=" + businessSmallType + ", businessMicroType=" + businessMicroType
				+ ", corpType=" + corpType + ", smallBusinessYn=" + smallBusinessYn + ", nonSmallType=" + nonSmallType
				+ ", companyType=" + companyType + ", operateStartDate=" + operateStartDate + ", operateEndDate="
				+ operateEndDate + ", headOfficeAddress=" + headOfficeAddress + ", taxationType=" + taxationType
				+ ", incomeClassification=" + incomeClassification + ", representType=" + representType
				+ ", jointOfficeYn=" + jointOfficeYn + ", mainResidentNo=" + mainResidentNo + ", mainResidentType="
				+ mainResidentType + ", adminName=" + adminName + ", adminDepartment=" + adminDepartment
				+ ", adminPhone=" + adminPhone + ", adminEmail=" + adminEmail + ", adminAuthorizedEmail="
				+ adminAuthorizedEmail + ", startPwd=" + startPwd + ", companyLogoImgPath=" + companyLogoImgPath + "]";
	}





	public int getCompanyNo() {
		return companyNo;
	}





	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}





	public String getHrYear() {
		return hrYear;
	}





	public void setHrYear(String hrYear) {
		this.hrYear = hrYear;
	}





	public String getCorpPers() {
		return corpPers;
	}





	public void setCorpPers(String corpPers) {
		this.corpPers = corpPers;
	}





	public String getBusinessLicenseNo() {
		return businessLicenseNo;
	}





	public void setBusinessLicenseNo(String businessLicenseNo) {
		this.businessLicenseNo = businessLicenseNo;
	}





	public String getCorparateRegistNo() {
		return corparateRegistNo;
	}





	public void setCorparateRegistNo(String corparateRegistNo) {
		this.corparateRegistNo = corparateRegistNo;
	}





	public String getRepresentName() {
		return representName;
	}





	public void setRepresentName(String representName) {
		this.representName = representName;
	}





	public String getRepresentResidentNo() {
		return representResidentNo;
	}





	public void setRepresentResidentNo(String representResidentNo) {
		this.representResidentNo = representResidentNo;
	}





	public String getRepresentLocalForegin() {
		return representLocalForegin;
	}





	public void setRepresentLocalForegin(String representLocalForegin) {
		this.representLocalForegin = representLocalForegin;
	}





	public String getBusinessAddress() {
		return businessAddress;
	}





	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
	}





	public String getBeobJeongCode() {
		return beobJeongCode;
	}





	public void setBeobJeongCode(String beobJeongCode) {
		this.beobJeongCode = beobJeongCode;
	}





	public String getBusinessTel() {
		return businessTel;
	}





	public void setBusinessTel(String businessTel) {
		this.businessTel = businessTel;
	}





	public String getBusinessFax() {
		return businessFax;
	}





	public void setBusinessFax(String businessFax) {
		this.businessFax = businessFax;
	}





	public String getBusinessTypeCode() {
		return businessTypeCode;
	}





	public void setBusinessTypeCode(String businessTypeCode) {
		this.businessTypeCode = businessTypeCode;
	}





	public String getBusinessOpenDate() {
		return businessOpenDate;
	}





	public void setBusinessOpenDate(String businessOpenDate) {
		this.businessOpenDate = businessOpenDate;
	}





	public String getBusinessEndDate() {
		return businessEndDate;
	}





	public void setBusinessEndDate(String businessEndDate) {
		this.businessEndDate = businessEndDate;
	}





	public String getCompanyStatus() {
		return companyStatus;
	}





	public void setCompanyStatus(String companyStatus) {
		this.companyStatus = companyStatus;
	}





	public String getCompanyName() {
		return companyName;
	}





	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}





	public String getBusinessBigType() {
		return businessBigType;
	}





	public void setBusinessBigType(String businessBigType) {
		this.businessBigType = businessBigType;
	}





	public String getBusinessMediumType() {
		return businessMediumType;
	}





	public void setBusinessMediumType(String businessMediumType) {
		this.businessMediumType = businessMediumType;
	}





	public String getBusinessSmallType() {
		return businessSmallType;
	}





	public void setBusinessSmallType(String businessSmallType) {
		this.businessSmallType = businessSmallType;
	}





	public String getBusinessMicroType() {
		return businessMicroType;
	}





	public void setBusinessMicroType(String businessMicroType) {
		this.businessMicroType = businessMicroType;
	}





	public String getCorpType() {
		return corpType;
	}





	public void setCorpType(String corpType) {
		this.corpType = corpType;
	}





	public String getSmallBusinessYn() {
		return smallBusinessYn;
	}





	public void setSmallBusinessYn(String smallBusinessYn) {
		this.smallBusinessYn = smallBusinessYn;
	}





	public String getNonSmallType() {
		return nonSmallType;
	}





	public void setNonSmallType(String nonSmallType) {
		this.nonSmallType = nonSmallType;
	}





	public String getCompanyType() {
		return companyType;
	}





	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}





	public String getOperateStartDate() {
		return operateStartDate;
	}





	public void setOperateStartDate(String operateStartDate) {
		this.operateStartDate = operateStartDate;
	}





	public String getOperateEndDate() {
		return operateEndDate;
	}





	public void setOperateEndDate(String operateEndDate) {
		this.operateEndDate = operateEndDate;
	}





	public String getHeadOfficeAddress() {
		return headOfficeAddress;
	}





	public void setHeadOfficeAddress(String headOfficeAddress) {
		this.headOfficeAddress = headOfficeAddress;
	}





	public String getTaxationType() {
		return taxationType;
	}





	public void setTaxationType(String taxationType) {
		this.taxationType = taxationType;
	}





	public String getIncomeClassification() {
		return incomeClassification;
	}





	public void setIncomeClassification(String incomeClassification) {
		this.incomeClassification = incomeClassification;
	}





	public String getRepresentType() {
		return representType;
	}





	public void setRepresentType(String representType) {
		this.representType = representType;
	}





	public String getJointOfficeYn() {
		return jointOfficeYn;
	}





	public void setJointOfficeYn(String jointOfficeYn) {
		this.jointOfficeYn = jointOfficeYn;
	}





	public String getMainResidentNo() {
		return mainResidentNo;
	}





	public void setMainResidentNo(String mainResidentNo) {
		this.mainResidentNo = mainResidentNo;
	}





	public String getMainResidentType() {
		return mainResidentType;
	}





	public void setMainResidentType(String mainResidentType) {
		this.mainResidentType = mainResidentType;
	}





	public String getAdminName() {
		return adminName;
	}





	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}





	public String getAdminDepartment() {
		return adminDepartment;
	}





	public void setAdminDepartment(String adminDepartment) {
		this.adminDepartment = adminDepartment;
	}





	public String getAdminPhone() {
		return adminPhone;
	}





	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}





	public String getAdminEmail() {
		return adminEmail;
	}





	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}





	public String getAdminAuthorizedEmail() {
		return adminAuthorizedEmail;
	}





	public void setAdminAuthorizedEmail(String adminAuthorizedEmail) {
		this.adminAuthorizedEmail = adminAuthorizedEmail;
	}





	public String getStartPwd() {
		return startPwd;
	}





	public void setStartPwd(String startPwd) {
		this.startPwd = startPwd;
	}





	public String getCompanyLogoImgPath() {
		return companyLogoImgPath;
	}





	public void setCompanyLogoImgPath(String companyLogoImgPath) {
		this.companyLogoImgPath = companyLogoImgPath;
	}



	

	




	

	
	
	
	
	
	
	
}