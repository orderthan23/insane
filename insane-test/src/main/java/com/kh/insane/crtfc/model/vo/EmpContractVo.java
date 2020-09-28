package com.kh.insane.crtfc.model.vo;

import java.sql.Date;

public class EmpContractVo {
	int crtfcNo;
	String crftType;
	Date enrollDate; //문서 요청일.
	int careerSeq;
	int empNoSeq;
	
	Date empEnrollDate;
	Date retireDate;
	String name; //직원이름

	String deptName; //부서명
	String positionName; //직급명.
	String phone; //전화번호(휴대폰)
	String form; //정규, 계약직 여부
	String empStatus;//퇴직여부.
	
 	Date issueDate; //발급일
 	String issueEmpRspofc; //발급자 직책명
 	String issueDeptName; //발급부서
 	String issuePhone; //발급자 연락처
  	String issueReason; //발급사유
}
