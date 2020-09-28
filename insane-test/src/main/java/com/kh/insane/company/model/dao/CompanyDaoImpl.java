package com.kh.insane.company.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.insane.company.model.vo.CommonCode;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.company.model.vo.CompanyInfo;
import com.kh.insane.company.model.vo.Upjong;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.vo.Department;


/**
 * Class : CompanyDaoImpl
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.25
 * @implNote 회사의 계정과 회사의  프로필을 관리하는 dao
 */
@Repository
public class CompanyDaoImpl implements CompanyDao {
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 회사의 갯수
	 * @see 생성된 회사의 갯수를 세는 dao
	 * @since 2020.08.25
	 */
	@Override
	public int countCompany(SqlSessionTemplate sqlSession) {
		int count = sqlSession.selectOne("companyAccount.countCompany");
		return count;
	}
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 마지막 번호
	 * @see 마지막으로 생성된 회사 관리자 계정의 번호를 조회하는 dao
	 * @since 2020.08.25
	 */
	@Override
	public int findLastNumber(SqlSessionTemplate sqlSession) {
		int lastNum = sqlSession.selectOne("companyAccount.findLastNumber");
		return lastNum;
	}

	/**
	 * @author 고종현
	 * @param  ca 삽입할 회사 계정 정보
	 * @return 삽입 성공 결과
	 * @see  생성할 회사 계정 정보를 삽입하는 dao
	 * @since 2020.08.25
	 */
	@Override
	public int insertCompany(SqlSessionTemplate sqlSession, CompanyAccount ca) {

		return sqlSession.insert("companyAccount.insertCompany", ca);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사번호
	 * @return 회사의 생성된 사원 계정 수 
	 * @see  회사의 생성된 사원 계정 수를 구하는 dao
	 * @since 2020.08.26
	 */
	@Override
	public int countAccount(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("companyAccount.countAccount", companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  newAccount 새로 생성될 사원 계정 정보
	 * @return 계정 삽입 성공 여부
	 * @see  새로 생성될 계정을 삽입하는 dao
	 * @since 2020.08.26
	 */
	@Override
	public int insertAccount(SqlSessionTemplate sqlSession, Employee newAccount) {

		return sqlSession.insert("companyAccount.insertAccount", newAccount);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사번호
	 * @return 회사의 생성된 사원 계정 중 마지막 번호
	 * @see  회사의 생성된 사원 계정 중 마지막 번호를 구하는 dao
	 * @since 2020.08.26
	 */
	@Override
	public int findLastAccountNumber(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("companyAccount.findLastAccountNumber", companyNo);
	}

	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사번호
	 * @return 회사에 생성된 모든 사원 계정 목록
	 * @see  회사의 생성된 모든 사원 계정 리스트를 구하는 dao
	 * @since 2020.08.26
	 */
	@Override

	public ArrayList<Employee> showAllAccountForMyCompany(SqlSessionTemplate sqlSession,int companyNo) {
		
		return (ArrayList)sqlSession.selectList("companyAccount.showAllAccountForMyCompany", companyNo);



	}

	/**
	 * @author 고종현
	 * @param  account:계정정보, status:바꿀 상태, companyNo: 바꿀 계정의 회사번호
	 * @return 계정 상태 업데이트 성공 여부 결과
	 * @see  해당 회사의 사원 계정의 활성화 상태를 업데이트 하는 dao
	 * @since 2020.08.26
	 * 2020.09.02 수정 치명적인 ajax오류
	 */
	@Override

	public int updateAccountStatus(SqlSessionTemplate sqlSession, String account, String status, int companyNo) {
		
		HashMap<String,Object> updateAccount = new HashMap<String,Object>();
		updateAccount.put("account",account);
		updateAccount.put("status",status);
		updateAccount.put("companyNo",companyNo);
		int result = sqlSession.update("companyAccount.updateAccountStatus",updateAccount);
		
		return result;

	}
	
	/**
	 * @author 고종현
	 * @param  keyword 사용자가 입력한 검색어
	 * @return 검색된 업종코드 목록
	 * @see  검색어에 맞는 업종코들를 찾는 dao
	 * @since 2020.08.27
	 */
	@Override
	public ArrayList<Upjong> searchUpjongList(SqlSessionTemplate sqlSession, String keyword) {
		ArrayList<Upjong> upjongList = null;
		upjongList = (ArrayList) sqlSession.selectList("companyAccount.searchUpjongList", keyword);
		return upjongList;
	}
	
	/**
	 * @author 고종현
	 * @param  info 사용자가 입력한 회사 기초 정보
	 * @return 회사 기초 정보 삽입 성공 여부 결과 값
	 * @see  사용자가 전송한 회사 기초 정보를 db에 삽입하는 dao
	 * @since 2020.08.27
	 */
	@Override
	public int insertCompanyBasicInfo(SqlSessionTemplate sqlSession, CompanyInfo info) {

		return sqlSession.insert("companyAccount.insertCompanyInfo", info);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사 번호
	 * @return 회사 활성화 상태
	 * @see  회사 활성화 상태를 확인하는 dao
	 * @since 2020.08.27
	 */
	@Override
	public String checkStatus(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("companyAccount.checkStatus", companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인 된 회사 번호
	 * @return 로그인 된 회사 번호의 회사 기초 정보
	 * @see  해당 회사의 회사 기초 정보를 찾는 dao
	 * @since 2020.08.28
	 */
	@Override
	public CompanyInfo loadBasicInfo(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("companyAccount.loadBasicInfo", companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  info 수정할 기초 정보
	 * @return 기초 정보 수정 성공 결과값
	 * @see   사용자가 입력한 기초 정보로 수정하는 dao
	 * @since 2020.08.28
	 */
	@Override
	public int updateBasicInfo(SqlSessionTemplate sqlSession, CompanyInfo info) {

		return sqlSession.update("companyAccount.updateBasicInfo", info);
	}


	public List selectAllList(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("companyAccount.selectAllList");

		return list;
	}

	
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Employee e) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("companyAccount.selectPwd", e);
	}
	
	
	@Override
	public CompanyAccount selectManager(SqlSessionTemplate sqlSession, Employee e) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("companyAccount.selectLoginUser", e);
	}
	

	/**
	 * @author 고종현
	 * @param  column 공통코드를 찾는데 필요한 컬럼 배열
	 * @return 검색된 공통코드 목록
	 * @see  필요한 컬럼에 맞는 공통코드를 검색하는 dao
	 * @since 2020.08.29
	 */
	@Override
	public ArrayList<CommonCode> loadCommonCodes(SqlSessionTemplate sqlSession, String column) {
		ArrayList<CommonCode> list =(ArrayList)sqlSession.selectList("companyAccount.selectCommonCodes",column);
		
		return list;
	}
	
	/**
	 * @author 고종현
	 * @param  updateInfo 업데이틀할 회사 추가 정보
	 * @return 회사 추가 정보 업데이트 성공 결과 값
	 * @see   회사 추가 정보를 업데이트 하는 dao
	 * @since 2020.08.29
	 */
	@Override
	public int updateAdditionalInfo(SqlSessionTemplate sqlSession, CompanyInfo updateInfo) {

		return sqlSession.update("companyAccount.updateAdditionalInfo",updateInfo);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인 된 회사 번호
	 * @return 로그인 된 회사의 추가 정보 
	 * @see  회사의 추가 정보를 탐색하는 dao
	 * @since 2020.08.29
	 */
	@Override
	public CompanyInfo loadAdditionalInfo(SqlSessionTemplate sqlSession, int companyNo) {
		 
		
		
		return sqlSession.selectOne("companyAccount.loadAdditionalInfo",companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사 번호
	 * @return 해당 회사의 부서 목록
	 * @see  해당 회사에 존재하는 모든 부서 목록을 조회하는 dao
	 * @since 2020.08.30
	 */
	@Override
	public ArrayList<Department> loadAllDeptList(SqlSessionTemplate sqlSession, int companyNo) {

		
		return (ArrayList)sqlSession.selectList("companyAccount.loadAllDeptList",companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  updateInfo 업데이트 될 담당자 정보
	 * @return 담당자 정보 업데이트 성공 결과 값
	 * @see  담당자 정보를 업데이트 해주는 dao
	 * @since 2020.08.30
	 */
	@Override
	public int updateManagerInfo(SqlSessionTemplate sqlSession, CompanyInfo updateInfo) {
		// TODO Auto-generated method stub
		return sqlSession.update("companyAccount.updateManagerInfo", updateInfo);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사 번호
	 * @return 회사의 담당자 정보
	 * @see  해당 회사의 담당자 정보를 탐색하는 dao
	 * @since 2020.08.30
	 */
	@Override
	public CompanyInfo loadManagerInfo(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("companyAccount.loadManagerInfo",companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사 정보
	 * @return 초기 비밀번호 설정 필요 여부
	 * @see  회사의 초기 비밀번호가 null인지 확인하는  dao
	 * @since 2020.09.02
	 */
	@Override
	public int needBeginningPwd(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectOne("companyAccount.needBeginningPwd",companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  updateInfo 회사의 번호와 바꾸게 될 초기 비밀번호
	 * @return 회사 초기 비밀번호 업데이트 성공 결과 값
	 * @see  사원 계정 초기비밀번호를 업데이트 하는 dao
	 * @since 2020.09.02
	 */
	@Override
	public int updateStartPassword(SqlSessionTemplate sqlSession, HashMap<String, Object> updateInfo) {

		return sqlSession.update("companyAccount.updateStartPassword",updateInfo);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인 된 회사 번호
	 * @return 해당 회사의 사원 계정 초기 비밀번호
	 * @see    해당 회사의 사원 계정 초기 비밀번호를 조회하는 dao
	 * @since 2020.09.02
	 */
	@Override
	public String loadStartPwd(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("companyAccount.loadStartPwd",companyNo);
	}

	@Override
	public int updateSystemPwd(SqlSessionTemplate sqlSession, CompanyAccount ca) {
		return sqlSession.update("companyAccount.updateSystemPwd",ca);
	}

		
	//로그인 매칭되는 관리자 계정의 나머지 값을 가져오는 메소드
	@Override
	public CompanyAccount selectLoginMangerInfo(SqlSessionTemplate sqlSession, CompanyAccount loginUser) {
		return sqlSession.selectOne("companyAccount.selectLoginMangerInfo", loginUser);

	}

	// companySearchResult.jsp에서 회사 이름을 검색하는 메소드
	@Override
	public List searchNameList(SqlSessionTemplate sqlSession, String compName) {
		// TODO Auto-generated method stub
		System.out.println("dao : " + compName);
		return sqlSession.selectList("companyAccount.searchNameList", compName);
	}

	// 등록된 전체 회사 수 조회
	@Override
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("companyAccount.selectAllListCount");
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<CompanyAccount> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimits();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimits());
		
		return (ArrayList) sqlSession.selectList("companyAccount.selectAllList", pi, rowBounds);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public CompanyInfo loadMyCompanyInfo(SqlSessionTemplate sqlSession, Employee e) {

		return sqlSession.selectOne("companyAccount.loadMyCompanyInfo",e);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<HashMap<String, Object>> loadAllAuth(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("companyAccount.loadAllAuth");
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public String loadUsefulAuth(SqlSessionTemplate sqlSession, String type, int seq) {
		String usefulAuth = "";
		
		switch(type) {
		case "dept" : usefulAuth = sqlSession.selectOne("companyAccount.loadUsefulDeptAuth",seq);  break;
		case "emp" :  usefulAuth = sqlSession.selectOne("companyAccount.loadUsefulEmpAuth",seq); break;
		case "custom" : usefulAuth = sqlSession.selectOne("companyAccount.loadUsefulCustomAuth",seq); break;
		}
		
		return usefulAuth;
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int checkAuth(SqlSessionTemplate sqlSession, int seq, String type) {
		int count = 0;
		
		switch(type) {
		case "dept" : count = sqlSession.selectOne("companyAccount.checkDeptAuth",seq); break;
		case "emp" : count = sqlSession.selectOne("companyAccount.checkEmpAuth",seq); break;
		}
		
		return count;
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int insertAuth(SqlSessionTemplate sqlSession, HashMap<String, Object> auth, String type) {
		int result = 0;
		switch(type) {
		case "dept" : result = sqlSession.insert("companyAccount.insertDeptAuth",auth); break;
		case "emp" : result = sqlSession.insert("companyAccount.insertEmpAuth",auth); break;
		}
		
		return result;
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int updateAuth(SqlSessionTemplate sqlSession, HashMap<String, Object> auth, String type) {
		int result = 0;
		switch(type) {
		case "dept" : result = sqlSession.update("companyAccount.updateDeptAuth",auth); break;
		case "emp" : result = sqlSession.update("companyAccount.updateEmpAuth",auth); break;
		case "custom" : result = sqlSession.update("companyAccount.updateCustomAuth",auth); break;
		}
		return result;
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public String loadMyDeptAuth(SqlSessionTemplate sqlSession, Integer empDeptCode) {
		
		
		return sqlSession.selectOne("companyAccount.loadMyDeptAuth",empDeptCode);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public String loadMyEmpAuth(SqlSessionTemplate sqlSession, int empNoSeq) {
		
		return sqlSession.selectOne("companyAccount.loadMyEmpAuth",empNoSeq);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<HashMap<String, Object>> showAllCustomAuthName(SqlSessionTemplate sqlSession, int companyNo) {

		
		return (ArrayList)sqlSession.selectList("companyAccount.showAllCustomAuthName",companyNo);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int duplicateCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> customMap) {

		return sqlSession.selectOne("companyAccount.duplicateCheck",customMap);
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int insertCustomAuth(SqlSessionTemplate sqlSession, HashMap<String, Object> customMap) {

		
		return sqlSession.insert("companyAccount.insertCustomAuth",customMap);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int deleteCustomCode(SqlSessionTemplate sqlSession, int customNumber) {

		return sqlSession.delete("companyAccount.deleteCustomCode", customNumber);
	}



	

	


}
