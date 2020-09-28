package com.kh.insane.common.connector.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.ProfileAttachment;

/**
 * Class : MainPageService
 * @author 고종현
 * @version 1.0.0
 * @since 2020.09.05
 * @apiNote 메인페이지와 타페이지의 연결을 담당하는 서비스
 */
public interface MainPageService {

	ProfileAttachment loadMyProfile(Employee emp);

	HashMap<String, ArrayList<HashMap<String,Object>>> loadNews(Employee emp);

	boolean checkNeedChange(Employee emp);

	void updatePwd(Employee updateEmp, String oldPwd, String newPwd) throws FailedUpdateCodeException;

	void insertExtraWork(HashMap<String, Object> workData) throws FailedUpdateCodeException;

}
