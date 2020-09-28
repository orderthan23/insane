package com.kh.insane.common.connector.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.insane.common.connector.model.dao.MainPageDao;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.company.model.vo.Validator;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.ProfileAttachment;
/**
 * Class : MainPageService
 * @author 고종현
 * @version 1.0.0
 * @since 2020.09.05
 * @implNote 메인페이지와 타페이지의 연결을 담당하는 서비스
 */
@Service
public class MainPageServiceImpl implements MainPageService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MainPageDao md;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	/**
	 * @author 고종현
	 * @param  emp 로그인된 사원 계정
	 * @return 로그인 된 사원의 프로필 정보
	 * @see 로그인이 확인 된 사원 계정의 프로필 정보를 찾아 컨트롤러로 전송하는 서비스
	 * @since 2020.09.05
	 */
	@Override
	public ProfileAttachment loadMyProfile(Employee emp) {
		return md.loadMyProfile(sqlSession,emp);
	}
	
	/**
	 * @author 고종현
	 * @param  emp 로그인된 사원 계정
	 * @return 공지사항,사내소식,교육안내를 모두 묶은 뉴스 리스트
	 * @see 공지사항,사내소식,교육안내 ArrayList를 각각에 걸쳐 조회하여 하나의 값으로 뭉치는 서비스
	 * @since 2020.09.06
	 */
	@Override
	public HashMap<String, ArrayList<HashMap<String,Object>>> loadNews(Employee emp) {

		HashMap<String,ArrayList<HashMap<String,Object>>> companyNews = new HashMap<>();
		companyNews.put("notice",md.loadNews(sqlSession, emp, 1));
		companyNews.put("issue",  md.loadNews(sqlSession, emp,2)); 
		companyNews.put("eduPlan", md.loadNews(sqlSession, emp,3));
		
		return companyNews;
	}

	
	/**
	 * @author 고종현
	 * @param  emp 로그인 된 계정 정보
	 * @return 비밀번호 변경 필요 여부
	 * @see 로그인된 회사의 초기비밀번호를 조회하여 나의 비밀번호와 동일하다면 true를 반환 그렇지않다면 false를 반환
	 * @since 2020.09.06
	 */
	@Override
	public boolean checkNeedChange(Employee emp) {
		String firstPwd = md.loadFirstPwd(sqlSession,emp.getCompanyNo());
		
		if(passwordEncoder.matches(firstPwd, emp.getEmpPwd())){
			return true;
		}else {
			
			return false;
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
	public void updatePwd(Employee updateEmp, String oldPwd, String newPwd) throws FailedUpdateCodeException {
		if(!passwordEncoder.matches(oldPwd, updateEmp.getEmpPwd())) {
			throw new FailedUpdateCodeException("기존 비밀번호가 일치 하지 않습니다.", 2);
		}
		
		if(!new Validator().isPassword(newPwd)) {
			throw new FailedUpdateCodeException("정규 표현식 위배 ", 3);
		}else {
			updateEmp.setEmpPwd(passwordEncoder.encode(newPwd));
			int result = md.updatePwd(sqlSession, updateEmp);
			
			if(result <1) {
				throw new FailedUpdateCodeException("이유를 알수 없는 원인으로 인한 업데이트 실패", 4);
			}
		}
		
		 
	
		
	}

	@Override
	public void insertExtraWork(HashMap<String, Object> workData) throws FailedUpdateCodeException {
			
		
		int checkDup = md.checkDuplicateData(sqlSession, workData);
		
		if(checkDup != 0) {
			throw new FailedUpdateCodeException("이미 신청된 내역", 2);
		}else {
			
			int result = md.insertExtraWork(sqlSession, workData);
			
			if(result <1) {
				throw new FailedUpdateCodeException("추가 근무 요청 삽입 실패",3);
			}
		}
		
	}

}
