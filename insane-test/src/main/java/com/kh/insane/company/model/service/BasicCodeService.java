package com.kh.insane.company.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.insane.company.model.exception.FailedInsertCodeException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;

/**
 * Class : BasicCodeService
 * @author 고종현
 * @version 1.0.1
 * @since 2020.09.01
 * @apiNote 회사의 기초 코드들을 관리하는  서비스
 */
public interface BasicCodeService {
	ArrayList<HashMap<String, String>> loadCodeList(int companyNo, String codeType);
	
	void insertCode(String codeType, HashMap<String, Object> insertInfo) throws FailedInsertCodeException;
	
	void updateCode(String codeType, HashMap<String, Object> statusMap) throws FailedUpdateCodeException;

	int findMaxPayStep(int companyNo);
	
	void updatePayStepStatus( String maxiType, HashMap<String, Object> statusMap) throws FailedUpdateCodeException;

	int findRealMax(int companyNo);

	

	

}
