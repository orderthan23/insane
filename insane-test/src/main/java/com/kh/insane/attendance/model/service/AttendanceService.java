package com.kh.insane.attendance.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.insane.attendance.model.exception.AttendanceException;
import com.kh.insane.attendance.model.vo.AttendancePolicy;
import com.kh.insane.attendance.model.vo.EmpAttHistory;
import com.kh.insane.attendance.model.vo.HolidaySetting;
import com.kh.insane.attendance.model.vo.VacationSetting;

public interface AttendanceService {

	void updateBaseSetting(AttendancePolicy ap) throws AttendanceException;

	void insertVacationSetting(ArrayList<VacationSetting> vacationSettingList) throws AttendanceException;

	AttendancePolicy selectBaseSetting(int companyNo);

	ArrayList<VacationSetting> selectVacationSetting(int companyNo);

	void updateVacationSetting(int[] deleteSeq, int companyNo) throws AttendanceException;

	ArrayList<HolidaySetting> selectHolidaySetting(int companyNo);

	void insertHolidaySetting(HolidaySetting holidaySetting) throws AttendanceException;

	void deleteHoliday(int[] delHolSeq, int companyNo) throws AttendanceException;

	void insertAttHistory(String attToday, String daysEnds) throws AttendanceException;

	void updateAttTime(EmpAttHistory eah) throws AttendanceException;

	EmpAttHistory selectTodayOneEmpAttHistory(EmpAttHistory eahToday);

	String updateLeaveTime(EmpAttHistory eah) throws AttendanceException;

	ArrayList<EmpAttHistory> selectMonthAtt(EmpAttHistory eah);

	ArrayList<ArrayList<EmpAttHistory>> selectMonthDeptAtt(EmpAttHistory eah, Integer empDeptCode);

	ArrayList<VacationSetting> selectEmpVacation(int empNoSeq);

	void insertVacationRequest(VacationSetting vacation) throws AttendanceException;

	ArrayList<VacationSetting> selectAllowedEmpVacationHistory(VacationSetting forList);

	ArrayList<VacationSetting> selectVacationRequestList(int companyNo);

	void updateVacationHistoryApp(int vacHisSeq) throws AttendanceException;

	void updateVacationHistoryDen(int vacHisSeq) throws AttendanceException;

}
