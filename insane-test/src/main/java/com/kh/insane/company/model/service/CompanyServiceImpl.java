package com.kh.insane.company.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.company.model.dao.CompanyDao;
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
 * Class : CompanyServiceImpl
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.25
 * @implNote 회사의 계정과 회사의  프로필을 관리하는 서비스 
 */
@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CompanyDao cd;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
	
	/**
	 * @author 고종현
	 * @param  ca 전송 받은  회사 계정 정보
	 * @return 인서트 성공 여부
	 * @see 계약된 회사의 아이디를 생성하는 서비스
	 * @since 2020.08.25
	 */
	@Override
	public int insertCompany(CompanyAccount ca) {
		int count = cd.countCompany(sqlSession);
		int companyNum = 0;
		if (count > 0) {
			int lastNumber = cd.findLastNumber(sqlSession);
			companyNum = lastNumber + 1;
		} else {
			companyNum = 1001;
		}
		ca.setCompanyNo(companyNum);

		return cd.insertCompany(sqlSession, ca);
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo 사원 계정을 생성할 회사 번호
	 * @throw FailedCreateAccount : 사원 계정 성공값이 1보다 작을 시 발생하는 예외
	 * @see 회사의 사원 계정을 생성하는 서비스
	 * @since 2020.08.25
	 */

	@Override
	public void createAccount(int companyNo) throws FailedCreateAccount {

		Employee newAccount = new Employee();

		newAccount.setCompanyNo(companyNo);

		
		int count = cd.countAccount(sqlSession,companyNo);
		
		if(count>0) {
			int lastNumber = cd.findLastAccountNumber(sqlSession,companyNo);
			newAccount.setEmpNo((lastNumber+1)+"");
		}else {
			newAccount.setEmpNo("100001");
		}
		
		//초기 비밀번호를 찾아오는 메소드
		String startPwd = cd.loadStartPwd(sqlSession,companyNo);
		
		
		newAccount.setEmpPwd(passwordEncoder.encode(startPwd));

		int result = cd.insertAccount(sqlSession, newAccount);

		if (result < 1) {
			throw new FailedCreateAccount("사원 계정 생성에 실패하였습니다.");
		}

		

	}

	
	
	

	//관리자 계정에 로그인 하기 위한 메소드

	@Override
	public CompanyAccount loginCompanyManager(Employee e) throws LoginFailedException {
		CompanyAccount loginUser = null;
		
		String encPassword = cd.selectEncPassword(sqlSession, e);
		
		System.out.println("CompanyServiceImpl : " + e);
		System.out.println("비밀번호되냐:"+e.getEmpPwd() + " / " + encPassword);
		
		if (!passwordEncoder.matches(e.getEmpPwd(), encPassword)) {
			throw new LoginFailedException("로그인 실패");
		} else {
			loginUser = cd.selectManager(sqlSession, e);
			String tempPwd = e.getEmpPwd();
			loginUser.setCadminPwd(encPassword);
			loginUser = cd.selectLoginMangerInfo(sqlSession, loginUser);
			loginUser.setCadminPwd(tempPwd);
		}

		return loginUser;
		
	}

	/* 로그인 메뉴에서 회사를 선택하기 위한 리스트를 불러오는 메소드 */
	@Override
	public List selectAllList() {
		return cd.selectAllList(sqlSession);
	}
	

	
	
	
	/**
	 * @author 고종현
	 * @param  companyNo 사원 계정을 조회할 회사 번호
	 * @return 회사의 모든  사원의 계정 정보
	 * @see 회사의 모든 사원 계정의 상태와 계정명을 조회하는 서비스
	 * @since 2020.08.26
	 */
	@Override
	public ArrayList<Employee> showAllAccountForMyCompany(int companyNo)  {
		
		return cd.showAllAccountForMyCompany(sqlSession, companyNo);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo 사원 계정을 조회할 회사 번호
	 * @throw FailedUpdateAccountStatusException : 사원 계정  활성화 상태 업데이트 성공값이 1보다 작을 시 발생하는 예외
	 * @see 사원 계정의 활성화 상태를 업데이트 하는 서비스
	 * @since 2020.08.27
	 * 2020.09.03 수정됨 (에이 잭스 충돌로 인한 알수 없는 에러)
	 */
	@Override
	public void updateAccountStatus(String account, String status, int companyNo) throws FailedUpdateAccountStatusException {
		
		
		int result = cd.updateAccountStatus(sqlSession, account,status,companyNo);
	
		if (result < 1) {
			throw new FailedUpdateAccountStatusException("계정 상태 변경에 실패 했습니다.");
		}
	}
	
	/**
	 * @author 고종현
	 * @param  keyword : 클라이언트가 입력한 검색어
	 * @return 업종코드 목록
	 * @throw FailedSearchUpjongCodeException : 클라이언트가 입력한 입력값의 해당하는 결과가 없을 때 발생하는 예외
	 * @see 업종 코드를 검색하는 서비스
	 * @since 2020.08.28
	 */
	@Override
	public ArrayList<Upjong> searchUpjongList(String keyword) throws FailedSearchUpjongCodeException {

		ArrayList<Upjong> upjongList = null;
		upjongList = cd.searchUpjongList(sqlSession, keyword);

		int count = 0;
		for (int i = 0; i < upjongList.size(); i++) {
			if (upjongList.get(i) != null) {
				count++;
			}
		}
		if (count != upjongList.size() || upjongList == null || upjongList.size() == 0) {
			throw new FailedSearchUpjongCodeException("검색결과를 찾지 못했습니다.");
		}

		return upjongList;
	}
	
	
	/**
	 * @author 고종현
	 * @param  info : 클라이언트가 입력한 회사 정보
	 * @throw FailedInsertCompanyBasicInfoException 회사 기본 정보 삽입 결과가 1보다 작을 때 발생하는 예외
	 * @see 회사의 기초 정보를 삽입하는 서비스
	 * @since 2020.08.28
	 */
	@Override
	public void insertCompanyBasicInfo(CompanyInfo info) throws FailedInsertCompanyBasicInfoException {

		int result = cd.insertCompanyBasicInfo(sqlSession, info);

		if (result <= 0) {
			throw new FailedInsertCompanyBasicInfoException("회사 정보를 삽입하는데 실패하였습니다.");
		}

	}

	
	/**
	 * @author 고종현
	 * @param  companyNo : 로그인 된 회사 번호
	 * @return 회사 번호에 맞는 회사 기초 정보
	 * @see 회사의 기초 정보가 이미 있다면 불러오는 서비스
	 * @since 2020.08.28
	 */
	@Override
	public CompanyInfo loadBasicInfo(int companyNo) {
		CompanyInfo info = null;
		info = cd.loadBasicInfo(sqlSession,companyNo);
		if(info == null) {
			info = new CompanyInfo();
			info.setCompanyStatus("N");
		}
		return info;
	}
	
	/**
	 * @author 고종현
	 * @param  info : 클라이언트가 입력한 회사 정보
	 * @throw FailedUpdateBasicInfoException 회사 기본 정보 업데이트 결과가 1보다 작을 때 발생하는 예외
	 * @see 회사의 기초 정보를 수정하는 서비스
	 * @since 2020.08.28
	 */
	@Override
	public void updateBasicInfo(CompanyInfo info) throws FailedUpdateBasicInfoException {

		int result = cd.updateBasicInfo(sqlSession, info);
		
		if(result <=0) {
			throw new FailedUpdateBasicInfoException("기초 회사 정보 수정에 실패하였습니다");
		}
	}
	
	/**
	 * @author 고종현
	 * @param  columns : 공통 코드중 찾길 원하는 컬럼 배열
	 * @return 여러 컬럼에 해당하는 공통코드 리스트를 담고있는 해쉬맵 객체
	 * @see 셀렉트 박스에 필요한 공통 코드들을 찾아 오는 서비스
	 * @since 2020.08.29
	 */
	@Override
	public HashMap<String, ArrayList<CommonCode>> loadCommonCodes(String[] columns) {
		HashMap<String,ArrayList<CommonCode>> codeMap = new HashMap<>();
		
		for(int i=0; i<columns.length; i++) {
			
			ArrayList<CommonCode> list = cd.loadCommonCodes(sqlSession,columns[i]);
			codeMap.put(columns[i].toLowerCase(),list);
		}
		
		
		return codeMap;
	}
	
	/**
	 * @author 고종현
	 * @param  info : 클라이언트가 입력한 회사 정보
	 * @throw FailedUpdateBasicInfoException 회사 기본 정보 업데이트 결과가 1보다 작을 때 발생하는 예외
	 * @see 회사의 기초 정보를 수정하는 서비스
	 * @since 2020.08.28
	 */
	@Override
	public void updateAdditionalInfo(CompanyInfo updateInfo) throws FailedUploadAdditionalInfoException {

		int result = cd.updateAdditionalInfo(sqlSession, updateInfo);
		
		if(result <1) {
			
			throw new FailedUploadAdditionalInfoException("추가정보 입력에 실패하였습니다.");
		}
		
	}
	/**
	 * @author 고종현
	 * @param  companyNo : 로그인 된 회사 번호
	 * @return 해당 회사에 맞는 회사 추가 정보
	 * @see 이미 입력된 회사 추가 정보가 있다면 가져오는  서비스
	 * @since 2020.08.29
	 */
	@Override
	public CompanyInfo loadAdditionalInfo(int companyNo) {

		
		return cd.loadAdditionalInfo(sqlSession, companyNo);
	}

	/**
	 * @author 고종현
	 * @param  companyNo : 로그인 된 회사 번호
	 * @return 해당 회사의 부서 목록
	 * @see 해당 회사의 활성화 된 모든 부서를 조회하는 서비스
	 * @since 2020.08.29
	 */
	@Override
	public ArrayList<Department> loadAllDeptList(int companyNo) {
		
		
		
		return cd.loadAllDeptList(sqlSession,companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  updateInfo : 업데이트 될 담당자 정보
	 * @throw FailedUpdateManagerInfoException 담당자 정보 업데이트 성공 결과가 1 보다 작을시 발생하는 예외 
	 * @see 해당 회사의 활성화 된 모든 부서를 조회하는 서비스
	 * @since 2020.08.30
	 */
	@Override
	public void updateManagerInfo(CompanyInfo updateInfo) throws FailedUpdateManagerInfoException {

		int result = cd.updateManagerInfo(sqlSession, updateInfo);
		if(result<1) {
			throw new FailedUpdateManagerInfoException("담당자 정보 입력에 실패하였습니다.");
		}
	}

	/**
	 * @author 고종현
	 * @param  companyNo : 로그인 된 회사 번호
	 * @return 해당 회사의 담당자 정보
	 * @see 해당 회사의 담당자 정보가 있다면  가져오는 서비스
	 * @since 2020.08.29
	 */
	@Override
	public CompanyInfo loadManagerInfo(int companyNo) {

		return cd.loadManagerInfo(sqlSession,companyNo);
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo : 로그인 된 회사 번호
	 * @return 초기 비밀번호 설정이 필요한지 여부
	 * @see 해당 회사 계정이 사원 계정 생성 시 초기비밀번호 설정이 필요한지 확인하는 서비스
	 * @since 2020.09.02
	 */
	@Override
	public boolean needBeginningPwd(int companyNo) {
		
		int count =  cd.needBeginningPwd(sqlSession, companyNo);
				
		if(count == 0) {
			return true;
		}else {
			return false;
		}
		
		
	}
	/**
	 * @author 고종현
	 * @param  updateInfo : 회사번호와 바꿀 비밀번호 
	 * @throw FailedUpdateStartPasswordException 초기 비밀번호 변경 성공 값이 1보다 작을 시 발생하는 예외
	 * @see 바꿀려고 하는 초기 비밀번호를 저장하는 서비스
	 * @since 2020.09.02
	 */
	@Override
	public void updateStartPassword(HashMap<String, Object> updateInfo) throws FailedUpdateStartPasswordException {
		
		int result = cd.updateStartPassword(sqlSession,updateInfo);
		if(result< 1) {
			throw new FailedUpdateStartPasswordException("초기 비밀번호 설정 실패!");
		}
		
	}


	@Override
	public void updateSystemPwd(CompanyAccount ca) throws FailedUpdateCodeException {
		ca.setCadminPwd(passwordEncoder.encode(ca.getCadminPwd()));
		int result = cd.updateSystemPwd(sqlSession,ca);
		
		if(result <1) {
			throw new FailedUpdateCodeException("코드 업데이트 실패!",4);
		}
	}

	//companySearchResult.jsp에서 회사 이름을 검색하는 메소드
	@Override
	public List searchNameList(String compName) {
		// TODO Auto-generated method stub
		return cd.searchNameList(sqlSession, compName);
	}

	//등록된 전체 회사 수 조회
	@Override
	public int selectAllListCount() {
		// TODO Auto-generated method stub
		return cd.selectAllListCount(sqlSession);
	}

	//전체 리스트 중 현재 페이지의 회사 출력
	@Override
	public ArrayList<CompanyAccount> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return cd.selectList(sqlSession,pi);
	}


	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public CompanyInfo loadMyCompanyInfo(Employee e) {

		return cd.loadMyCompanyInfo(sqlSession, e);
	}


	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<HashMap<String, Object>> loadAllAuth() {

		return cd.loadAllAuth(sqlSession);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public String loadUsefulAuth(String type, int seq) {

		
		return cd.loadUsefulAuth(sqlSession,type,seq);
	}

	
	
	/**
	 * @author 고종현
	 * @param  auth :업데이트될 권한이 담긴 정보, type 권한의 주체(부서,계정)
	 * @return 에러발생 사유 및 에러코드
	 * @see  사용자가 설정한 권한정보를 데이터베이스로 전송하는 서비스
	 * @since 2020.09.14
	 */
	@Override
	public void updateAuth(HashMap<String, Object> auth, String type) throws FailedUpdateCodeException {
		int result = 0;

		int seq = (int) auth.get("seq");
		if (type.equals("custom")) {
			result = cd.updateAuth(sqlSession, auth, type);
			if (result < 0) {
				throw new FailedUpdateCodeException("권한 update 실패!", 3);
			}

		} else {

			int count = cd.checkAuth(sqlSession, seq, type);

			if (count == 0) {
				result = cd.insertAuth(sqlSession, auth, type);
				if (result < 0) {
					throw new FailedUpdateCodeException("권한 insert 실패!", 2);
				}
			} else {

				result = cd.updateAuth(sqlSession, auth, type);
				if (result < 0) {
					throw new FailedUpdateCodeException("권한 update 실패!", 3);
				}
			}
		}
	}

	
	
	/**
	 * @author 고종현
	 * @param  loginUser :로그인 된 계정의 정보
	 * @return 권한 묶음
	 * @see  부서별 권한 , 계정별 권한을 가져와 하나의 권한으로 만들어주는 서비스
	 * @since 2020.09.14
	 */
	@Override
	public HashSet<String> loadMyAuth(Employee loginUser) {
		String deptAuth = cd.loadMyDeptAuth(sqlSession, loginUser.getEmpDeptCode());
		String empAuth = cd.loadMyEmpAuth(sqlSession, loginUser.getEmpNoSeq());
		String[] authArray = (deptAuth + "," + empAuth).split(",");
		HashSet<String> auth =  new HashSet<>();
		for(String a : authArray) {
			if(!a.equals("null")) {
				auth.add(a);
			}
		}
		return auth;
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<HashMap<String, Object>> showAllCustomAuthName(int companyNo) {
		
		
		return cd.showAllCustomAuthName(sqlSession,companyNo);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public void insertCustomAuth(HashMap<String, Object> customMap) throws FailedUpdateCodeException {
	
		
		int count = cd.duplicateCheck(sqlSession,customMap);
		
		if(count>0) {
			throw new FailedUpdateCodeException("중복된 커스텀 권한 이름",2);
		}else {
			
			int result = cd.insertCustomAuth(sqlSession,customMap);
			
			if(result<1) {
				throw new FailedUpdateCodeException("커스텀 권한 삽입 실패!", 3);
			}
		}
		
		
		
		
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public void deleteCustomCode(int customNumber) throws FailedDeleteCodeException {

		int result = cd.deleteCustomCode(sqlSession, customNumber);
		
		if(result<1) {
			throw new FailedDeleteCodeException("커스텀 권한 삭제 실패!",2);
		}
	}

}
