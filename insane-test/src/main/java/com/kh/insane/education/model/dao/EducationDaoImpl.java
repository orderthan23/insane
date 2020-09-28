package com.kh.insane.education.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.education.model.vo.Education;
import com.kh.insane.education.model.vo.Evaluation;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.PageInfo;

@Repository
public class EducationDaoImpl implements EducationDao {
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int getListCount(SqlSessionTemplate sqlSession, int companyNo) {

		return sqlSession.selectOne("education.getListCount",companyNo);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Education> loadEduList(SqlSessionTemplate sqlSession, int companyNo,PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
		return (ArrayList)sqlSession.selectList("education.loadEduList",companyNo,rowBounds);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int updateEduStatus(SqlSessionTemplate sqlSession, Education education) {

		return sqlSession.update("education.updateEduStatus",education);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public Education loadEduDetail(SqlSessionTemplate sqlSession, int eduScheduleSeq) {

		return sqlSession.selectOne("education.loadEduDetail",eduScheduleSeq);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int cancleEdu(SqlSessionTemplate sqlSession, int eduScheduleSeq) {
		
		return sqlSession.update("education.cancleEdu",eduScheduleSeq);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 완료된 교육 리스트
	 * @see  회사내 완료된 교육 리스트를 받아오는 DAO
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Education> loadCompleteEducation(SqlSessionTemplate sqlSession, int companyNo) {

		return (ArrayList)sqlSession.selectList("education.loadCompleteEducation",companyNo);
	}

	/**
	 * @author 고종현
	 * @param  edu 완료된 교육
	 * @return  교육 이수자 리스트
	 * @see  교육내 이수자 리스트를 받아오는 DAO
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Evaluation> loadEvaluation(SqlSessionTemplate sqlSession, Education edu) {
		return (ArrayList)sqlSession.selectList("education.loadEvaluation",edu);
	}
	
	
	
	
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Employee> getLoadOurCompanyEmp(SqlSessionTemplate sqlSession,
			HashMap<String, Object> keywordInfo) {
		
		return (ArrayList)sqlSession.selectList("education.getLoadOurCompanyEmp", keywordInfo);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int insertCompleteEmp(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {

		return sqlSession.insert("education.insertCompleteEmp",hmap);
	}

	
	
	

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int updateCompleteInfo(SqlSessionTemplate sqlSession, Evaluation evaluation) {

		return sqlSession.update("education.updateCompleteInfo",evaluation);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int deleteCompleteInfo(SqlSessionTemplate sqlSession, Evaluation evaluation) {

		return sqlSession.delete("education.deleteCompleteInfo",evaluation);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int updateChangeIssue(SqlSessionTemplate sqlSession, Education edu) {

		return sqlSession.update("education.updateChangeIssue",edu);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<HashMap<String, Object>> loadNoticeEduInfo(SqlSessionTemplate sqlSession, int companyNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getLimit());
			
		return (ArrayList)sqlSession.selectList("education.loadNoticeEduInfo",companyNo,rowBounds);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int getNoticeEduListCount(SqlSessionTemplate sqlSession, int companyNo) {
		
		return sqlSession.selectOne("education.getNoticeEduListCount",companyNo);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public HashMap<String, Object> loadEduNoticeDetail(SqlSessionTemplate sqlSession, int boardSeq) {

		return sqlSession.selectOne("education.loadEduNoticeDetail",boardSeq);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int updateEduNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> eduNotice) {

		return sqlSession.update("education.updateEduNotice",eduNotice);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int removeEduNotice(SqlSessionTemplate sqlSession, int boardSeq) {

		return sqlSession.update("education.removeEduNotice",boardSeq);
	}

	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Education> loadAllEducationCode(SqlSessionTemplate sqlSession, int companyNo) {

		
		return (ArrayList)sqlSession.selectList("education.loadAllEducationCode",companyNo);
	}


	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int insertEduNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> eduMap) {

		return sqlSession.insert("education.insertEduNotice",eduMap);
	}

	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int getLastBoardNum(SqlSessionTemplate sqlSession, Integer integer) {
		
		int companyNo = integer;
		
		
		return sqlSession.selectOne("education.findLastNum",companyNo);
	}


	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public int insertEducationPlan(SqlSessionTemplate sqlSession, Education edu) {
		
		return sqlSession.insert("education.insertEducationPlan",edu);
	}










	


	

	

}
