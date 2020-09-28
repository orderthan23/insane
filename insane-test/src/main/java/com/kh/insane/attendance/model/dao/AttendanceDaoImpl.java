package com.kh.insane.attendance.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.attendance.model.vo.AttendancePolicy;
import com.kh.insane.attendance.model.vo.EmpAttHistory;
import com.kh.insane.attendance.model.vo.HolidaySetting;
import com.kh.insane.attendance.model.vo.VacationSetting;
import com.kh.insane.employee.model.vo.Employee;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Override
	public int updateBaseSetting(SqlSessionTemplate sqlSession, AttendancePolicy ap) {
		System.out.println("dao : " + ap);
		return sqlSession.update("Attendance.updateBaseSetting", ap);
	}
	@Override
	public AttendancePolicy selectBaseSetting(SqlSessionTemplate sqlSession, int companyNo) {
		System.out.println("dao : " + companyNo);
		return sqlSession.selectOne("Attendance.selectBaseSetting", companyNo);
	}
	@Override
	public int insertVacationSetting(SqlSessionTemplate sqlSession, VacationSetting vacationSetting) {
		return sqlSession.insert("Attendance.insertVacationSetting", vacationSetting);
	}
	@Override
	public List<Object> selectVacationSetting(SqlSessionTemplate sqlSession, int companyNo) {
		
		return sqlSession.selectList("Attendance.selectVacationSetting", companyNo);
	}
	@Override
	public int updateVacationSetting(SqlSessionTemplate sqlSession, int vacationSeq) {
		
		return sqlSession.update("Attendance.deleteVacationSetting", vacationSeq);
	}
	@Override
	public List<Object> selectHolidaySetting(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectList("Attendance.selectHolidaySetting", companyNo);
	}
	@Override
	public int insertHolidaySetting(SqlSessionTemplate sqlSession, HolidaySetting holidaySetting) {
		return sqlSession.insert("Attendance.insertHolidaySetting", holidaySetting);
	}
	@Override
	public int deleteHoliday(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.delete("Attendance.deleteHolidaySetting", i);
	}
	@Override
	public int checkAttHistory(SqlSessionTemplate sqlSession, String attToday) {
		return sqlSession.selectOne("Attendance.selectAttHistoryCount", attToday);
	}
	@Override
	public List<Object> selectAllEmpNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Attendance.selectAllEmpNo");
	}
	@Override
	public int insertAttHistory(SqlSessionTemplate sqlSession, EmpAttHistory eah) {
		return sqlSession.insert("Attendance.insertAttHistory", eah);
	}
	@Override
	public int updateAttTime(SqlSessionTemplate sqlSession, EmpAttHistory eah) {
		return sqlSession.update("Attendance.updateAttTime", eah);
	}
	@Override
	public EmpAttHistory selectTodayOneEmpAttHistory(SqlSessionTemplate sqlSession, EmpAttHistory eahToday) {
		return sqlSession.selectOne("Attendance.selectTodayOneEmpAttHistory", eahToday);
	}
	@Override
	public int updateLeaveTime(SqlSessionTemplate sqlSession, EmpAttHistory eah) {
		return sqlSession.update("Attendance.updateLeaveTime", eah);
	}
	@Override
	public List<Object> selectMonthAtt(SqlSessionTemplate sqlSession, EmpAttHistory eah) {
		return sqlSession.selectList("Attendance.selectMonthAtt", eah);
	}
	@Override
	public List<Object> selectDeptEmp(SqlSessionTemplate sqlSession, Integer empDeptCode) {
		return sqlSession.selectList("Attendance.selectDeptEmp", empDeptCode);
	}
	@Override
	public List<Object> selectEmpVacation(SqlSessionTemplate sqlSession, int empNoSeq) {
		return sqlSession.selectList("Attendance.selectEmpVacation", empNoSeq);
	}
	@Override
	public int insertVacationRequest(SqlSessionTemplate sqlSession, VacationSetting vacation) {
		return sqlSession.insert("Attendance.insertVacationRequest", vacation);
	}
	@Override
	public List<Object> selectAllowedEmpVacationHistory(SqlSessionTemplate sqlSession, VacationSetting forList) {
		return sqlSession.selectList("Attendance.selectAllowedEmpVacationHistory", forList);
	}
	@Override
	public List<Object> selectVacationRequestList(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectList("Attendance.selectVacationRequestList", companyNo);
	}
	@Override
	public int updateVacationHistoryApp(SqlSessionTemplate sqlSession, int vacHisSeq) {
		return sqlSession.update("Attendance.updateVacationHistoryApp", vacHisSeq);
	}
	@Override
	public VacationSetting selectVacHis(SqlSessionTemplate sqlSession, int vacHisSeq) {
		return sqlSession.selectOne("Attendance.selectVacHis", vacHisSeq);
	}
	@Override
	public int updateEmpVacation(SqlSessionTemplate sqlSession, VacationSetting updfor) {
		return sqlSession.update("Attendance.updateEmpVacation", updfor);
	}
	@Override
	public int updateVacationHistoryDen(SqlSessionTemplate sqlSession, int vacHisSeq) {
		return sqlSession.update("Attendance.updateVacationHistoryDen", vacHisSeq);
	}


}
