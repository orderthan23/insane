package com.kh.insane.company.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.company.model.exception.AccountSelectListException;
import com.kh.insane.company.model.exception.FailedCreateAccount;
import com.kh.insane.company.model.exception.FailedDeleteCodeException;
import com.kh.insane.company.model.exception.FailedInsertCompanyBasicInfoException;
import com.kh.insane.company.model.exception.FailedSearchUpjongCodeException;
import com.kh.insane.company.model.exception.FailedUpdateAccountStatusException;
import com.kh.insane.company.model.exception.FailedUpdateBasicInfoException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.company.model.exception.FailedUpdateManagerInfoException;
import com.kh.insane.company.model.exception.FailedUpdateStartPasswordException;
import com.kh.insane.company.model.exception.FailedUploadAdditionalInfoException;
import com.kh.insane.company.model.vo.CommonCode;
import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.company.model.vo.CompanyInfo;
import com.kh.insane.company.model.vo.Upjong;
import com.kh.insane.employee.model.exception.LoginFailedException;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.vo.Department;

/**
 * Interface : CompanyService
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.25
 * @apiNote 회사의 계정과 회사의  프로필을 관리하는 서비스 인터페이스
 */
public interface CompanyService {

	int insertCompany(CompanyAccount ca);

	void createAccount(int companyNo) throws FailedCreateAccount;

	ArrayList<Employee> showAllAccountForMyCompany(int companyNo);

	void updateAccountStatus(String account, String status, int companyNo) throws FailedUpdateAccountStatusException;

	CompanyInfo loadBasicInfo(int companyNo);

	ArrayList<Upjong> searchUpjongList(String keyword) throws FailedSearchUpjongCodeException;

	void insertCompanyBasicInfo(CompanyInfo info) throws FailedInsertCompanyBasicInfoException;

	void updateBasicInfo(CompanyInfo info) throws FailedUpdateBasicInfoException;

	CompanyAccount loginCompanyManager(Employee e) throws LoginFailedException;

	List selectAllList();


	HashMap<String, ArrayList<CommonCode>> loadCommonCodes(String[] columns);

	void updateAdditionalInfo(CompanyInfo updateInfo) throws FailedUploadAdditionalInfoException ;

	CompanyInfo loadAdditionalInfo(int companyNo);

	ArrayList<Department> loadAllDeptList(int companyNo);

	void updateManagerInfo(CompanyInfo updateInfo) throws FailedUpdateManagerInfoException;

	CompanyInfo loadManagerInfo(int companyNo);

	boolean needBeginningPwd(int companyNo);

	void updateStartPassword(HashMap<String, Object> updateInfo) throws FailedUpdateStartPasswordException;

	void updateSystemPwd(CompanyAccount ca) throws FailedUpdateCodeException;
	

	List searchNameList(String compName);

	int selectAllListCount();

	ArrayList<CompanyAccount> selectList(PageInfo pi);

	CompanyInfo loadMyCompanyInfo(Employee e);

	ArrayList<HashMap<String, Object>> loadAllAuth();

	String loadUsefulAuth(String type, int seq);

	void updateAuth(HashMap<String, Object> auth, String type) throws FailedUpdateCodeException;

	HashSet<String> loadMyAuth(Employee loginUser);

	ArrayList<HashMap<String, Object>> showAllCustomAuthName(int companyNo);

	void insertCustomAuth(HashMap<String, Object> customMap) throws FailedUpdateCodeException;

	void deleteCustomCode(int customNumber) throws FailedDeleteCodeException ;

	

	

	

	
	



}
