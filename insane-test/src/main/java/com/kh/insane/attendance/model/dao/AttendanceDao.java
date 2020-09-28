package com.kh.insane.attendance.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.attendance.model.vo.AttendancePolicy;
import com.kh.insane.attendance.model.vo.EmpAttHistory;
import com.kh.insane.attendance.model.vo.HolidaySetting;
import com.kh.insane.attendance.model.vo.VacationSetting;
import com.kh.insane.employee.model.vo.Employee;

public interface AttendanceDao {

	AttendancePolicy selectBaseSetting(SqlSessionTemplate sqlSession, int companyNo);

	int updateBaseSetting(SqlSessionTemplate sqlSession, AttendancePolicy ap);

	int insertVacationSetting(SqlSessionTemplate sqlSession, VacationSetting vacationSetting);

	List<Object> selectVacationSetting(SqlSessionTemplate sqlSession, int companyNo);

	int updateVacationSetting(SqlSessionTemplate sqlSession, int i);

	List<Object> selectHolidaySetting(SqlSessionTemplate sqlSession, int companyNo);

	int insertHolidaySetting(SqlSessionTemplate sqlSession, HolidaySetting holidaySetting);

	int deleteHoliday(SqlSessionTemplate sqlSession, int i);

	int checkAttHistory(SqlSessionTemplate sqlSession, String attToday);

	List<Object> selectAllEmpNo(SqlSessionTemplate sqlSession);

	int insertAttHistory(SqlSessionTemplate sqlSession, EmpAttHistory eah);

	int updateAttTime(SqlSessionTemplate sqlSession, EmpAttHistory eah);

	EmpAttHistory selectTodayOneEmpAttHistory(SqlSessionTemplate sqlSession, EmpAttHistory eahToday);

	int updateLeaveTime(SqlSessionTemplate sqlSession, EmpAttHistory eah);

	List<Object> selectMonthAtt(SqlSessionTemplate sqlSession, EmpAttHistory eah);

	List<Object> selectDeptEmp(SqlSessionTemplate sqlSession, Integer empDeptCode);

	List<Object> selectEmpVacation(SqlSessionTemplate sqlSession, int empNoSeq);

	int insertVacationRequest(SqlSessionTemplate sqlSession, VacationSetting vacation);

	List<Object> selectAllowedEmpVacationHistory(SqlSessionTemplate sqlSession, VacationSetting forList);

	List<Object> selectVacationRequestList(SqlSessionTemplate sqlSession, int companyNo);

	int updateVacationHistoryApp(SqlSessionTemplate sqlSession, int vacHisSeq);

	int updateVacationHistoryDen(SqlSessionTemplate sqlSession, int vacHisSeq);

	VacationSetting selectVacHis(SqlSessionTemplate sqlSession, int vacHisSeq);

	int updateEmpVacation(SqlSessionTemplate sqlSession, VacationSetting updfor);

}
