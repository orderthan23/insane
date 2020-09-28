package com.kh.insane.company.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.insane.company.model.vo.CommonCode;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.company.model.vo.CompanyInfo;
import com.kh.insane.company.model.vo.Upjong;
import com.kh.insane.employee.model.exception.LoginFailedException;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.vo.Department;

/**
 * Class : CompanyDao
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.25
 * @apiNote 회사의 계정과 회사의  프로필을 관리하는 dao
 */
public interface CompanyDao {

	int countCompany(SqlSessionTemplate sqlSession);
	
	int insertCompany(SqlSessionTemplate sqlSession, CompanyAccount ca);

	int findLastNumber(SqlSessionTemplate sqlSession);

	int countAccount(SqlSessionTemplate sqlSession, int companyNo);

	int insertAccount(SqlSessionTemplate sqlSession, Employee newAccount);

	int findLastAccountNumber(SqlSessionTemplate sqlSession, int companyNo);


	ArrayList<Employee> showAllAccountForMyCompany(SqlSessionTemplate sqlSession, int companyNo);

	int updateAccountStatus(SqlSessionTemplate sqlSession, String account, String status, int companyNo);


	ArrayList<Upjong> searchUpjongList(SqlSessionTemplate sqlSession, String keyword);

	int insertCompanyBasicInfo(SqlSessionTemplate sqlSession, CompanyInfo info);

	String checkStatus(SqlSessionTemplate sqlSession, int companyNo);

	CompanyInfo loadBasicInfo(SqlSessionTemplate sqlSession, int companyNo);

	int updateBasicInfo(SqlSessionTemplate sqlSession, CompanyInfo info);

	List selectAllList(SqlSessionTemplate sqlSession);

	//CompanyAccount loginCompanyManager(SqlSessionTemplate sqlSession, Employee e) throws LoginFailedException;

	String selectEncPassword(SqlSessionTemplate sqlSession, Employee e);

	CompanyAccount selectManager(SqlSessionTemplate sqlSession, Employee e);

	List searchNameList(SqlSessionTemplate sqlSession, String compName);

	int selectAllListCount(SqlSessionTemplate sqlSession);

	ArrayList<CompanyAccount> selectList(SqlSessionTemplate sqlSession, PageInfo pi);


	ArrayList<CommonCode> loadCommonCodes(SqlSessionTemplate sqlSession, String column);

	int updateAdditionalInfo(SqlSessionTemplate sqlSession, CompanyInfo updateInfo);

	CompanyInfo loadAdditionalInfo(SqlSessionTemplate sqlSession, int companyNo);

	ArrayList<Department> loadAllDeptList(SqlSessionTemplate sqlSession, int companyNo);

	int updateManagerInfo(SqlSessionTemplate sqlSession, CompanyInfo updateInfo);

	CompanyInfo loadManagerInfo(SqlSessionTemplate sqlSession, int companyNo);

	int needBeginningPwd(SqlSessionTemplate sqlSession, int companyNo);

	int updateStartPassword(SqlSessionTemplate sqlSession, HashMap<String, Object> updateInfo);

	String loadStartPwd(SqlSessionTemplate sqlSession, int companyNo);

	int updateSystemPwd(SqlSessionTemplate sqlSession, CompanyAccount ca);

	CompanyAccount selectLoginMangerInfo(SqlSessionTemplate sqlSession, CompanyAccount loginUser);

	CompanyInfo loadMyCompanyInfo(SqlSessionTemplate sqlSession, Employee e);

	ArrayList<HashMap<String, Object>> loadAllAuth(SqlSessionTemplate sqlSession);

	String loadUsefulAuth(SqlSessionTemplate sqlSession, String type, int seq);

	int checkAuth(SqlSessionTemplate sqlSession, int seq, String type);

	int insertAuth(SqlSessionTemplate sqlSession, HashMap<String, Object> auth, String type);

	int updateAuth(SqlSessionTemplate sqlSession, HashMap<String, Object> auth, String type);

	String loadMyDeptAuth(SqlSessionTemplate sqlSession, Integer empDeptCode);

	String loadMyEmpAuth(SqlSessionTemplate sqlSession, int empNoSeq);

	ArrayList<HashMap<String, Object>> showAllCustomAuthName(SqlSessionTemplate sqlSession, int companyNo);

	int duplicateCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> customMap);

	int insertCustomAuth(SqlSessionTemplate sqlSession, HashMap<String, Object> customMap);

	int deleteCustomCode(SqlSessionTemplate sqlSession, int customNumber);











	





}
