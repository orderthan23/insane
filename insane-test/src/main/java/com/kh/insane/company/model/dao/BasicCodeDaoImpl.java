package com.kh.insane.company.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;



/**
 * Class : BasicCodeDaoImpl
 * @author 고종현
 * @version 1.0.1
 * @since 2020.09.01
 * @implNote 회사의 기초 코드들을 관리하는  dao
 */
@Repository
public class BasicCodeDaoImpl implements BasicCodeDao {
	
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인 된 회사 번호,codeType 찾을 코드 종류
	 * @return codeType에 맞는 코드 리스트
	 * @see 기초 코드 리스트를 탐색하는 dao
	 * @since 2020.09.02
	 */
	@Override
	public ArrayList<HashMap<String, String>> loadCodeList(SqlSessionTemplate sqlSession, int companyNo,
			String codeType) {
		ArrayList<HashMap<String, String>> list = new ArrayList<>();
	
		switch(codeType) {
		case "education" : list = (ArrayList)sqlSession.selectList("basicCode.loadEduList",companyNo);  break;
		case "location" :  list = (ArrayList)sqlSession.selectList("basicCode.loadLocationList",companyNo);  break;
		case "license" :  list = (ArrayList)sqlSession.selectList("basicCode.loadLicenseList",companyNo);  break;
		case "rspofc" : list = (ArrayList)sqlSession.selectList("basicCode.loadRspofcList",companyNo); break;
		case "payStep" : list = (ArrayList)sqlSession.selectList("basicCode.loadPayStepList",companyNo); break;
		case "realPayStep" : list = (ArrayList)sqlSession.selectList("basicCode.loadRealPayStepList",companyNo); break;
		case "position" : list = (ArrayList)sqlSession.selectList("basicCode.loadPositionList",companyNo); break;
		}
		
		return list;
	}
	
	/**
	 * @author 고종현
	 * @param  codeType 찾을 코드 종류  insertInfo 입력할 코드 값
	 * @return codeType에 맞는 코드 삽입 성공 결과 값
	 * @see 기초 코드를 추가하는 dao
	 * @since 2020.09.02
	 */
	@Override
	public int insertCode(SqlSessionTemplate sqlSession, String codeType, HashMap<String, Object> insertInfo) {

		int result = 0;
		
		switch(codeType) {
		case "education" : result = sqlSession.insert("basicCode.insertEduCode",insertInfo); break;
		case "location" :  result = sqlSession.insert("basicCode.insertLocationCode",insertInfo); break;
		case "license" :   result = sqlSession.insert("basicCode.insertLicenseCode",insertInfo); break;
		case "rspofc" : result = sqlSession.insert("basicCode.insertRspofcCode",insertInfo); break;	
		case "payStep" : result = sqlSession.insert("basicCode.insertPayStepCode",insertInfo); break;
		case "position" : result = sqlSession.insert("basicCode.insertPositionCode",insertInfo); break;
		
		}
		
		return result;
	}

	
	/**
	 * @author 고종현
	 * @param  codeType 찾을 코드 종류  statusMap 수정할  코드 상태 ,코드 번호
	 * @return codeType에 맞는 코드 수정 성공 결과 값
	 * @see 기초 코드의 활성화 상태를 바꾸는  dao
	 * @since 2020.09.02
	 */
	@Override
	public int updateCode(SqlSessionTemplate sqlSession, String codeType, HashMap<String, Object> statusMap) {
		int result = 0;
		
		switch(codeType) {
		case "education" : result =  sqlSession.update("basicCode.updateEduStatus",statusMap); break; 
		case "location" :  result = sqlSession.update("basicCode.updateLocationCode",statusMap); break;
		case "license" :  result = sqlSession.update("basicCode.updateLicenseCode",statusMap); break;
		case "rspofc" : result = sqlSession.update("basicCode.updateRspofcCode",statusMap); break;
		case "increasePayStep" : result = sqlSession.update("basicCode.updateIncreasePayStepCode",statusMap); break;
		case "decreasePayStep" : result = sqlSession.update("basicCode.updateDecreasePayStepCode",statusMap); break;
		case "position" : result = sqlSession.update("basicCode.updatePositionCode",statusMap); break;
		
		}
		
		return result;
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인 된 회사 번호
	 * @return 회사 내에서 가장 큰 호봉 값 
	 * @see 회사 내에서 가장 큰 호봉 값을 구하는 dao
	 * @since 2020.09.03
	 */
	@Override
	public int findMaxPayStep(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("basicCode.findMaxPayStep",companyNo);
	}
	
	/**
	 * @author 고종현
	 * @param  statusMap 상태 정보를 수정할 값(사용자 입력 최대값, 회사번호) 
	 * @return 사용자 입력 최대값 보다 존재하는 큰 값들의 갯수  
	 * @see 사용자가 입력한 최대값 보다 큰 값이 있나 조회하는  dao
	 * @since 2020.09.03
	 */
	@Override
	public int howManyUpdateCount(SqlSessionTemplate sqlSession, String codeType, HashMap<String, Object> statusMap) {
		int result = 0;
		
		switch(codeType) {
		case "increasePayStep" : result = sqlSession.selectOne("basicCode.howManyIncreaseUpdateCount",statusMap); break;
		case "decreasePayStep" : result = sqlSession.selectOne("basicCode.howManyDecreaseUpdateCount",statusMap); break;
		}
		return result;
		
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사 번호
	 * @return 현재 회사에서 사용하고 있는 호봉 코드중 가장 큰 값
	 * @see 현재 회사에서 사용하고 있는 호봉 코드중 가장 큰 값을 찾는   dao
	 * @since 2020.09.03
	 */
	@Override
	public int findRealMax(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectOne("basicCode.findRealMax",companyNo);
	}

	@Override
	public int countPayStep(SqlSessionTemplate sqlSession, int companyNo) {
		
		
		return sqlSession.selectOne("basicCode.countPayStep",companyNo);
	}

	



}
