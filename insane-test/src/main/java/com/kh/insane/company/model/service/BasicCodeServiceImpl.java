package com.kh.insane.company.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.company.model.dao.BasicCodeDao;
import com.kh.insane.company.model.exception.FailedInsertCodeException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;

/**
 * Class : BasicCodeServiceImpl
 * @author 고종현
 * @version 1.0.1
 * @since 2020.09.01
 * @implNote 회사의 기초 코드들을 관리하는  서비스
 */

@Service
public class BasicCodeServiceImpl implements BasicCodeService {
	@Autowired
	private BasicCodeDao bcd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사 번호 ,codeType 받아올 기초코드 종류 
	 * @return 기초코드 리스트
	 * @see 키워드에 맞게 기초코드를 탐색하는 서비스
	 * @since 2020.09.02
	 */
	@Override
	public ArrayList<HashMap<String, String>> loadCodeList(int companyNo, String codeType) {
		
			return bcd.loadCodeList(sqlSession,companyNo,codeType); 
	}
	
	
	/**
	 * @author 고종현
	 * @param  insertInfo 전송 받은  코드  정보, codeType 삽입할 코드 종류
	 * @throw FailedInsertCodeException 코드 삽입 성공 결과가 1보다 작을 시 발생하는 예외
	 * @see 기초코드를 추가하는 메소드
	 * @since 2020.09.02
	 */
	@Override
	public void insertCode(String codeType, HashMap<String, Object> insertInfo) throws FailedInsertCodeException {
		
		int result = bcd.insertCode(sqlSession,codeType,insertInfo);
		
		if(result <1) {
			throw new FailedInsertCodeException("코드 입력 실패!");
		}
		
	}

	
	/**
	 * @author 고종현
	 * @param codeType 삽입할 코드 종류, statusMap 업데이트할 코드 상태,코드 번호
	 * @throw FailedUpdateCodeException 코드 업데이트 성공 결과가 1보다 작을 시 발생하는 예외
	 * @see 기초코드의 사용여부를 수정하는 메소드
	 * @since 2020.09.02
	 */
	@Override
	public void updateCode(String codeType, HashMap<String, Object> statusMap) throws FailedUpdateCodeException {

		int result = bcd.updateCode(sqlSession,codeType, statusMap);
		
		if(result<1) {
			throw new FailedUpdateCodeException("코드 상태 업데이트 실패!",2);
		}
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo 로그인된 회사 번호
	 * @return 회사에 등록된 가장 큰 호봉 값
	 * @see 회사에 등록된 가장 큰 호봉 값을 구하는 서비스
	 * @since 2020.09.03
	 */
	@Override
	public int findMaxPayStep(int companyNo) {

		return bcd.findMaxPayStep(sqlSession,companyNo);
	}

	/**
	 * @author 고종현
	 * @param codeType 삽입할 코드 종류, statusMap 업데이트할 코드 상태,코드 번호
	 * @throw FailedUpdateCodeException 코드 업데이트 성공 결과가 업데이트해야 할 양 보다 작거나 업데이트 할 필요가 없을 시  발생하는 예외
	 * @see 호봉코드 의 사용여부를 수정하는 서비스
	 * @since 2020.09.04
	 */
	@Override
	public void updatePayStepStatus(String maxiType,  HashMap<String, Object> statusMap) throws FailedUpdateCodeException {
		String codeType = "";
	
			if(maxiType.equals("increase")) {
				codeType = "increasePayStep";
			}
			else if(maxiType.equals("decrease")) {
				codeType = "decreasePayStep";
			}
		    int needUpdateCount = bcd.howManyUpdateCount(sqlSession, codeType, statusMap);
		    
		    System.out.println("needUpdateCount : "+needUpdateCount);
		if(needUpdateCount == 0) {
			throw new FailedUpdateCodeException("업데이트할 코드 없음",3);
		}
		
		int result = bcd.updateCode(sqlSession, codeType, statusMap);
		
		if(result <needUpdateCount) {
			throw new FailedUpdateCodeException("코드 상태 업데이트 실패!",2);
		}
		
	}

	/**
	 * @author 고종현
	 * @param companyNo 로그인 된 회사 번호
	 * @return 회사에서 현재 사용하고 있는 호봉중 가장 높은것
	 * @see 회사에서 현재 사용여부가 y인 녀석중 카장 값이 큰 것을 찾는 서비스
	 * @since 2020.09.04
	 */
	@Override
	public int findRealMax(int companyNo) {
		int count = bcd.countPayStep(sqlSession,companyNo);
		int max= 0;
		if(count != 0) {
			max = bcd.findRealMax(sqlSession, companyNo);
		}
		
		
		return max;
	}


	

	
}
