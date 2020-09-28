package com.kh.insane.crtfc.model.vo;

import java.sql.Date;

public class EmploymenetVo {
	int crtfcNo;
	String crftType;
	Date enrollDate; //문서 요청일.
	int careerSeq;
	int empNoSeq;
	String lastCompanyName;
	Date empEnrollDate;
	Date currentDate;
	int recogMonths;
	String job; //담당업무
	String lastPosition;//현재직급.
	String name; //직원이름
	String residentNo;//주민번호
	String locationName; //발령지역.
	String deptName;
	String positionName; //직급명.
	String address; //주소
	String phone; //전화번호(휴대폰)
	String form; //정규, 계약직 여부
	String spot; //현장직, 사무직 여부
	String empStatus;//퇴직여부.
	
	String companyName; //회사명
	String businessAddress; //소재지
	
	String ceoName;
	String ceoPhone;
	
 	Date issueDate;
 	String issueEmpName;
 	String issueEmpRspofc; //발급자 직책명
 	String issueDeptName; //발급부서
 	String issuePhone;
 	String issueReason;
}
