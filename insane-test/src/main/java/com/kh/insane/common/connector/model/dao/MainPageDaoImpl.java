package com.kh.insane.common.connector.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.ProfileAttachment;


/**
 * Class : MainPageService
 * @author 고종현
 * @version 1.0.0
 * @since 2020.09.05
 * @apiNote 메인페이지와 타페이지의 연결을 담당하는 dao
 */
@Repository
public class MainPageDaoImpl implements MainPageDao {
	
	/**
	 * @author 고종현
	 * @param  emp : 로그인 된 계정의 정보
	 * @return 로그인 된 계정의 메인페이지 프로필에 쓰일 프로필 정보 
	 * @see 로그인 된 계정의 메인페이지 프로필에 쓰일 프로필 정보를 회사번호와 사원번호로 조회한다.
	 * @since 2020.09.05
	 */
	@Override
	public ProfileAttachment loadMyProfile(SqlSessionTemplate sqlSession, Employee emp) {
		
		
		return sqlSession.selectOne("connector.loadMyProfile",emp);
	}

	/**
	 * @author 고종현
	 * @param  emp 로그인된 유저의 정보   index 조회할 키워드
	 * @return (공지사항,사내소식,교육안내)일정 중 상위 8개 리스트 출력
	 * @see  서비스에서 넘어온 키워드를 통해 emp에 쓰이지 않고 있는 필드 status에 값을 넣어 boardtype을 조회
	 * @since 2020.09.06
	 */
	@Override
	public ArrayList<HashMap<String, Object>> loadNews(SqlSessionTemplate sqlSession, Employee emp, int index) {
		ArrayList<HashMap<String,Object>> newsList = new ArrayList<>();
		
		switch(index) {
		case 1: emp.setEmpStatus("공지"); break;
		case 2: emp.setEmpStatus("소식"); break;
		case 3: emp.setEmpStatus("교육"); break;
		}
		
		return(ArrayList)sqlSession.selectList("connector.loadNews",emp);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 사원 계정의 회사번호
	 * @return 이동할 뷰페이지 주소
	 * @see 로그인시 회사의 초기번호를 조회
	 * @since 2020.09.06
	 */
	@Override
	public String loadFirstPwd(SqlSessionTemplate sqlSession,int companyNo) {
		
		return sqlSession.selectOne("connector.loadFirstPwd",companyNo);
	}
	
	
	/**
	 * @author 고종현
	 * @param  updateEmp 업데이트할 계정 정보
	 * @return 업데이트 성공 결과
	 * @see 업데이트 할 계정의 정보를 찾아 업데이트 하는 dao
	 * @since 2020.09.06
	 */
	@Override
	public int updatePwd(SqlSessionTemplate sqlSession, Employee updateEmp) {

		return sqlSession.update("connector.updatePwd",updateEmp);
	}

	@Override
	public int checkDuplicateData(SqlSessionTemplate sqlSession, HashMap<String, Object> workData) {
		
		return sqlSession.selectOne("connector.checkDuplicateData",workData);
	}

	@Override
	public int insertExtraWork(SqlSessionTemplate sqlSession, HashMap<String, Object> workData) {

		return sqlSession.insert("connector.insertExtraWork",workData);
	}

}
