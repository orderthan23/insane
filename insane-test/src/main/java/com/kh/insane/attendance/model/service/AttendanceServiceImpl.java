package com.kh.insane.attendance.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.attendance.model.dao.AttendanceDao;
import com.kh.insane.attendance.model.exception.AttendanceException;
import com.kh.insane.attendance.model.vo.AttendancePolicy;
import com.kh.insane.attendance.model.vo.EmpAttHistory;
import com.kh.insane.attendance.model.vo.HolidaySetting;
import com.kh.insane.attendance.model.vo.VacationSetting;
import com.kh.insane.employee.model.vo.Employee;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AttendanceDao ad;
	
	@Override
	public AttendancePolicy selectBaseSetting(int companyNo) {
		
		return ad.selectBaseSetting(sqlSession, companyNo);
	}
	
	@Override
	public void updateBaseSetting(AttendancePolicy ap) throws AttendanceException {
		
		int result = ad.updateBaseSetting(sqlSession, ap);
		
		if(result < 1) {
			throw new AttendanceException("근태 정책을 수정할 값이 없습니다!"); 
		}
	}
	
	@Override
	public ArrayList<VacationSetting> selectVacationSetting(int companyNo) {
		
		ArrayList<VacationSetting> list = (ArrayList) ad.selectVacationSetting(sqlSession, companyNo);
		
		return list;
	}

	@Override
	public void insertVacationSetting(ArrayList<VacationSetting> vacationSettingList) throws AttendanceException {
		int result = 0;
		for(int i = 0; i < vacationSettingList.size(); i ++) {
			
			if(vacationSettingList.get(i).getVacationOccurUnit() == null) {
				vacationSettingList.get(i).setVacationOccurUnit(0);
			}
			result += ad.insertVacationSetting(sqlSession, vacationSettingList.get(i));
		}
		
		if(result != vacationSettingList.size()) {
			throw new AttendanceException("휴가 사항 입력에 실패했습니다!");
		}
	}

	@Override
	public void updateVacationSetting(int[] deleteSeq, int companyNo) throws AttendanceException {

		int result = 0;
		for(int i = 0; i < deleteSeq.length; i++) {
			result += ad.updateVacationSetting(sqlSession, deleteSeq[i]);
		}
		
		if(result != deleteSeq.length) {
			throw new AttendanceException("휴가 사항 삭제에 실패했습니다!");
		}
	}

	@Override
	public ArrayList<HolidaySetting> selectHolidaySetting(int companyNo) {
		
		ArrayList<HolidaySetting> holidayList = (ArrayList) ad.selectHolidaySetting(sqlSession, companyNo);
		
		return holidayList;
	}

	@Override
	public void insertHolidaySetting(HolidaySetting holidaySetting) throws AttendanceException {
		int result = ad.insertHolidaySetting(sqlSession, holidaySetting);
		if(result < 1) {
			throw new AttendanceException("휴일 설정 추가에 실패했습니다!");
		}
	}

	@Override
	public void deleteHoliday(int[] delHolSeq, int companyNo) throws AttendanceException {
		int result = 0;
		for(int i = 0; i < delHolSeq.length; i++) {
			result += ad.deleteHoliday(sqlSession, delHolSeq[i]);
		}
		if(result != delHolSeq.length) {
			throw new AttendanceException("휴일 설정 삭제에 실패했습니다!");
		}
	}

	@Override
	public void insertAttHistory(String attToday, String daysEnds) throws AttendanceException {
		
		//오늘자 근태내역 존재여부 체크
		int check = ad.checkAttHistory(sqlSession, attToday);
		System.out.println(check);
		//근태 내역이 존재하지 않는다면 사원테이블 전체에 대한 근태내역을 새로 생성한다.
		if(check == 0) {
			//먼저 내역을 생성해야할 모든 사원SEQ와 회사번호를 저장한다
			ArrayList<Employee> empNoList = (ArrayList) ad.selectAllEmpNo(sqlSession);
			//사원번호별로 출결내역을 생성한다.
			int insertResult = 0;
			java.sql.Date checkDate = new java.sql.Date(System.currentTimeMillis());
			for(int i = 0; i < empNoList.size(); i++) {
				EmpAttHistory eah = new EmpAttHistory();
				eah.setEmpNo(empNoList.get(i).getEmpNoSeq());
				eah.setCompanyNo(empNoList.get(i).getCompanyNo());
				eah.setAttDate(checkDate);
				eah.setDaysEnds(daysEnds);
				insertResult += ad.insertAttHistory(sqlSession, eah);
			}
			if(insertResult != empNoList.size()) {
				throw new AttendanceException("날짜 로드에 실패했습니다. 문의 바랍니다.");
			}
		}
	}

	@Override
	public void updateAttTime(EmpAttHistory eah) throws AttendanceException {
		
		int result = ad.updateAttTime(sqlSession, eah);
		
		if(result == 0) {
			throw new AttendanceException("출근시간 입력에 실패했습니다. 문의 바랍니다.");
		}
		
	}

	@Override
	public EmpAttHistory selectTodayOneEmpAttHistory(EmpAttHistory eahToday) {
		
		EmpAttHistory eah = ad.selectTodayOneEmpAttHistory(sqlSession, eahToday);
		System.out.println(eah);
		return eah;
	}

	@Override
	public String updateLeaveTime(EmpAttHistory eah) throws AttendanceException {

		int result = ad.updateLeaveTime(sqlSession, eah);
		String attTime = "";
		
		if(result == 0) {
			throw new AttendanceException("퇴근시간 입력에 실패했습니다. 문의 바랍니다.");
		} else {
			attTime = ad.selectTodayOneEmpAttHistory(sqlSession, eah).getAttTime();
		}
		
		return attTime;
	}


	@Override
	public ArrayList<EmpAttHistory> selectMonthAtt(EmpAttHistory eah) {
		
		ArrayList<EmpAttHistory> monthAttList = (ArrayList) ad.selectMonthAtt(sqlSession, eah);
		
		return monthAttList;
	}

	@Override
	public ArrayList<ArrayList<EmpAttHistory>> selectMonthDeptAtt(EmpAttHistory eah, Integer empDeptCode) {
		
		ArrayList<ArrayList<EmpAttHistory>> monthDeptAtt = new ArrayList<ArrayList<EmpAttHistory>>();
		
		ArrayList<Employee> deptMember = (ArrayList) ad.selectDeptEmp(sqlSession, empDeptCode);
		
		for(int i = 0; i < deptMember.size(); i++) {

			eah.setEmpNo(deptMember.get(i).getEmpNoSeq());
			ArrayList<EmpAttHistory> check = (ArrayList) ad.selectMonthAtt(sqlSession, eah);
			for(int j = 0; j < check.size(); j++) {
				check.get(j).setAttDateString(check.get(j).getAttDate().toString());
				check.get(j).setEmpName(deptMember.get(i).getEmpNameKor());
				check.get(j).setDeptName(deptMember.get(i).getDeptName());
			}
			monthDeptAtt.add(i, check);
		}
		
		return monthDeptAtt;
	}

	@Override
	public ArrayList<VacationSetting> selectEmpVacation(int empNoSeq) {
		
		ArrayList<VacationSetting> empVacationList = (ArrayList) ad.selectEmpVacation(sqlSession, empNoSeq);
		
		return empVacationList;
	}

	@Override
	public void insertVacationRequest(VacationSetting vacation) throws AttendanceException {
		
		int result = ad.insertVacationRequest(sqlSession, vacation);
		
		if(result == 0) {
			throw new AttendanceException("휴가 신청에 실패했습니다.");
		}
		
	}

	@Override
	public ArrayList<VacationSetting> selectAllowedEmpVacationHistory(VacationSetting forList) {
		
		ArrayList<VacationSetting> list = (ArrayList) ad.selectAllowedEmpVacationHistory(sqlSession, forList);
		
		return list;
	}

	@Override
	public ArrayList<VacationSetting> selectVacationRequestList(int companyNo) {
		
		ArrayList<VacationSetting> allEmpVacReqList = (ArrayList) ad.selectVacationRequestList(sqlSession, companyNo);
		
		return allEmpVacReqList;
	}

	@Override
	public void updateVacationHistoryApp(int vacHisSeq) throws AttendanceException {
		
		int result1 = ad.updateVacationHistoryApp(sqlSession, vacHisSeq);
		int result2 = 0;
		
		if(result1 > 0) {
			VacationSetting updfor = ad.selectVacHis(sqlSession, vacHisSeq);
			result2 = ad.updateEmpVacation(sqlSession, updfor);
			if(result2 == 0) {
				throw new AttendanceException("휴가 승인처리 실패했습니다.");
			}
		} else {
			throw new AttendanceException("휴가 승인처리 실패했습니다.");
		}
		
	}

	@Override
	public void updateVacationHistoryDen(int vacHisSeq) throws AttendanceException {
		
		int result = ad.updateVacationHistoryDen(sqlSession, vacHisSeq);
		
		if(result == 0) {
			throw new AttendanceException("휴가 반려처리 실패했습니다.");
		}
		
	}

}