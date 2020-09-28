package com.kh.insane.education.model.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.company.model.exception.FailedDeleteCodeException;
import com.kh.insane.company.model.exception.FailedInsertCodeException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.education.model.dao.EducationDao;
import com.kh.insane.education.model.vo.Education;
import com.kh.insane.education.model.vo.Evaluation;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.PageInfo;

@Service
public class EducationServiceImpl implements EducationService {
	
	@Autowired
	private EducationDao edd;
	
	@Autowired	
	private SqlSessionTemplate sqlSession;

	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int getListCount(int companyNo) {
		
		return edd.getListCount(sqlSession,companyNo);
	}
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Education> loadEduList(int companyNo, PageInfo pi) throws FailedUpdateCodeException {
		ArrayList<Education> eduList = edd.loadEduList(sqlSession, companyNo, pi);
		ArrayList<Education> needUpdateList = new ArrayList<>();
		Date sqlDate = new java.sql.Date(System.currentTimeMillis());
		int count = 0;
		for (Education edu : eduList) {
			if (!edu.getEduStatus().equals("CANCLE")) {
				if (edu.getEduStartDate().before(sqlDate) || edu.getEduStartDate().equals(sqlDate)) {
					edu.setEduStatus("ING"); 
					if (edu.getEduEndDate().before(sqlDate) || edu.getEduEndDate().equals(sqlDate)) {
						edu.setEduStatus("DONE");
					}
					count++;
					needUpdateList.add(edu);
				}
			}
		}
		
		if(count>0) {
			 int updateResult = 0;
			for(int i=0; i<needUpdateList.size(); i++) {
			 
			  updateResult +=edd.updateEduStatus(sqlSession,needUpdateList.get(i));
			}
			if(updateResult<count) {
				throw new FailedUpdateCodeException("교육 상태 업데이트 실패!");
			}
		}
		 
		
		return eduList;
	}
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public Education loadEduDetail(int eduScheduleSeq) {

		return edd.loadEduDetail(sqlSession, eduScheduleSeq);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public void cancleEdu(int eduScheduleSeq) throws FailedUpdateCodeException {

		int result = edd.cancleEdu(sqlSession, eduScheduleSeq);
		
		if(result <1) {
			throw new FailedUpdateCodeException("업데이트 실패",2);
		}
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 교육 리스트 + 이수자목록
	 * @see  교육이 완료된 교육 정보와 그 교육의 이수자 정보 리스트를 받아오는 서비스
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Education> loadCompleteEducation(int companyNo) {
		ArrayList<Education> eduList = edd.loadCompleteEducation(sqlSession, companyNo);
		for(Education edu : eduList) {
			edu.setEvaluations(edd.loadEvaluation(sqlSession, edu));
		}
		return  eduList;
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Employee> getLoadOurCompanyEmp(HashMap<String, Object> keywordInfo) {
		
		return edd.getLoadOurCompanyEmp(sqlSession,keywordInfo);
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public void insertCompleteEmp(ArrayList<Integer> empNoSeq, int eduScheduleSeq, int companyNo) 
			throws FailedUpdateCodeException {
			int finalResult = 0;
		for(int i = 0; i<empNoSeq.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<>();
			hmap.put("empNoSeq",empNoSeq.get(i));
			hmap.put("eduScheduleSeq",eduScheduleSeq);
			hmap.put("companyNo",companyNo);
			
			int result =  edd.insertCompleteEmp(sqlSession,hmap);
			finalResult += result;
		}
		
		if(finalResult != empNoSeq.size()) {
			throw new FailedUpdateCodeException("업데이트 실패!",2);
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
	public void updateCompleteInfo(Evaluation evaluation) throws FailedUpdateCodeException {
		
		int result = edd.updateCompleteInfo(sqlSession,evaluation);
		
		if(result < 1) {
			throw new FailedUpdateCodeException("업데이트 실패!",2);
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
	public void deleteCompleteInfo(Evaluation evaluation) throws FailedDeleteCodeException {
		
		int result = edd.deleteCompleteInfo(sqlSession, evaluation);
		
		if(result <1) {
			throw new FailedDeleteCodeException("삭제 실패",2);
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
	public void updateChangeIssue(Education edu) throws FailedUpdateCodeException {
		
		 int result1 = edd.updateChangeIssue(sqlSession, edu);
		 
		
		 if(result1<1) {
			 throw new FailedUpdateCodeException("변동사항 업데이트 실패!",2);
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
	public ArrayList<HashMap<String, Object>> loadNoticeEduInfo(int companyNo, PageInfo pi) {
		
		
		return edd.loadNoticeEduInfo(sqlSession,companyNo,pi);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int getNoticeEduListCount(int companyNo) {

		return edd.getNoticeEduListCount(sqlSession,companyNo);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public HashMap<String, Object> loadEduNoticeDetail(int boardSeq) {

		return edd.loadEduNoticeDetail(sqlSession,boardSeq);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public void updateEduNotice(HashMap<String, Object> eduNotice) throws FailedUpdateCodeException {
		
		int result = edd.updateEduNotice(sqlSession,eduNotice);
		if(result<1) {
			throw new FailedUpdateCodeException("업데이트 실패!", 2);
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
	public void removeEduNotice(int boardSeq) throws FailedUpdateCodeException {
		int result = edd.removeEduNotice(sqlSession,boardSeq);
		
		if(result<1) {
			throw new FailedUpdateCodeException("게시글 삭제 실패!",2);
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
	public ArrayList<Education> loadAllEducationCode(int companyNo) {
		
		
		return edd.loadAllEducationCode(sqlSession, companyNo);
	}
	
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public void insertEduNotice(HashMap<String, Object> eduMap) throws FailedInsertCodeException {
		
		int count = edd.getNoticeEduListCount(sqlSession,(Integer)eduMap.get("companyNo"));
		int boardNo = 1;
		if(count !=0) {
		
			boardNo = edd.getLastBoardNum(sqlSession,(Integer)eduMap.get("companyNo"))+1;
		}
		
		eduMap.put("boardNo",boardNo);
		int result = edd.insertEduNotice(sqlSession,eduMap);
		if(result<1) {
			throw new FailedInsertCodeException("교육안내 작성 실패! ");
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
	public void insertEducationPlan(Education edu) throws FailedInsertCodeException {

		int result = edd.insertEducationPlan(sqlSession, edu);
		
		if(result< 1) {
			throw new FailedInsertCodeException("교육 일정 작성 실패!");
		}
	}

	
}
