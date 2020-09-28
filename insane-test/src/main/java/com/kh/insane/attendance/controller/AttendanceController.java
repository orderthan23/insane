package com.kh.insane.attendance.controller;

import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.insane.attendance.model.exception.AttendanceException;
import com.kh.insane.attendance.model.service.AttendanceService;
import com.kh.insane.attendance.model.vo.AttendancePolicy;
import com.kh.insane.attendance.model.vo.EmpAttHistory;
import com.kh.insane.attendance.model.vo.HolidaySetting;
import com.kh.insane.attendance.model.vo.VacationSetting;
import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectDepartmentListFailed;
import com.kh.insane.employee.model.service.EmployeeService;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.vo.Department;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService as;
	@Autowired
	private EmployeeService es;
	
	//기본 근태 정책 설정 진입용 메소드
	@RequestMapping("selectBaseSetting.att")
	public String selectBaseSetting(HttpSession session, HttpServletRequest request) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		AttendancePolicy curAp = as.selectBaseSetting(companyNo);
		
		request.setAttribute("AttendancePolicy", curAp);
		
		return "adminSetting/attendanceBaseSetting/attendanceSetting";
	}
	
	//기본 근태 정책 설정용 메소드
	@PostMapping("updateBaseSetting.att")
	public String updateBaseSetting(AttendancePolicy ap, HttpSession session, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		ap.setCompanyNo(companyNo);
		
		try {
			as.updateBaseSetting(ap);
			return "redirect:selectBaseSetting.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//휴가 설정 접근용 메소드
	@RequestMapping("selectVacationSetting.att")
	public String selectVacationSetting(HttpSession session, HttpServletRequest request) {

		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		ArrayList<VacationSetting> curList = as.selectVacationSetting(companyNo);
		
		request.setAttribute("vacationSettingList", curList);
		
		return "adminSetting/attendanceBaseSetting/vacationSetting";
	}
	
	//휴가 설정 추가용 메소드
	@PostMapping("insertVacationSetting.att")
	public String insertVacationSetting(HttpSession session, VacationSetting vacationSettingList, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		for(VacationSetting v : vacationSettingList.getVacationSettingList()) {
			v.setCompanyNo(companyNo);
		}
		
		try {
			as.insertVacationSetting(vacationSettingList.getVacationSettingList());
			return "redirect:selectVacationSetting.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//휴가 삭제용 메소드
	@RequestMapping("updateVacation.att")
	public String updateVacation(HttpSession session, HttpServletRequest request, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String[] requestNum = request.getParameter("delVacSeq").split(",");
		
		int[] deleteSeq = new int[requestNum.length];
		
		for(int i = 0; i < requestNum.length; i ++) {
			deleteSeq[i] = Integer.parseInt(requestNum[i]);
		}
		
		try {
			as.updateVacationSetting(deleteSeq, companyNo);
			return "redirect:selectVacationSetting.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//관리자 휴일 설정 접근용 메소드
	@RequestMapping("selectHolidaySetting.att")
	public String selectHolidaySetting(HttpSession session, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		ArrayList<HolidaySetting> holidayList = as.selectHolidaySetting(companyNo);
		session.setAttribute("holidayList", holidayList);
		
		return "adminSetting/attendanceBaseSetting/holidaySetting";
	}
	
	//관리자 휴일 추가용 메소드
	@PostMapping("insertHolidaySetting.att")
	public String insertHolidaySetting(HttpSession session, HolidaySetting holidaySetting, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		holidaySetting.setCompanyNo(companyNo);
		
		try {
			as.insertHolidaySetting(holidaySetting);
			return "redirect:selectHolidaySetting.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//관리자 휴일 삭제용 메소드
	@RequestMapping("deleteHoliday.att")
	public String deleteHoliday(HttpSession session, @RequestParam String requestNum, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String[] requestNums = requestNum.split(",");
		
		int[] delHolSeq = new int [requestNums.length];
		for(int i = 0; i < delHolSeq.length; i++) {
			delHolSeq[i] = Integer.parseInt(requestNums[i]);
		}
		
		try {
			as.deleteHoliday(delHolSeq, companyNo);
			return "redirect:selectHolidaySetting.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//특정사원 금일 근태 내역 조회용 메소드
	@RequestMapping("selectEmpAttHistory.att")
	public ModelAndView selectEmpAttHistory(ModelAndView mv, HttpSession session, HttpServletResponse response) {
		
		Employee emp = (Employee) session.getAttribute("loginUser");
		
		java.sql.Date checkDate = new java.sql.Date(System.currentTimeMillis());
		
		EmpAttHistory eahToday = new EmpAttHistory();
		eahToday.setAttDate(checkDate);
		eahToday.setEmpNo(emp.getEmpNoSeq());
		
		EmpAttHistory eah = as.selectTodayOneEmpAttHistory(eahToday);
		mv.addObject("empAttHistory", eah);
		mv.setViewName("jsonView");
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}
	
	@RequestMapping("updateAttTime.att")
	public ModelAndView insertAttTime(ModelAndView mv, HttpSession session, HttpServletResponse response) {
	
		Employee emp = (Employee) session.getAttribute("loginUser");
		AttendancePolicy ap = as.selectBaseSetting(emp.getCompanyNo());

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		

		java.sql.Date checkDate = new java.sql.Date(System.currentTimeMillis());
		String attTime = sdf.format(checkDate);

		EmpAttHistory eah = new EmpAttHistory();
		eah.setAttDate(checkDate);
		eah.setAttTime(attTime);
		eah.setEmpNo(emp.getEmpNoSeq());

		try {
			java.util.Date workStart = sdf.parse(ap.getWorkStart());
			java.util.Date checkAttTime = sdf.parse(attTime);
			if(workStart.before(checkAttTime) == false) {
				eah.setRemark("지각");
			} else {
				eah.setRemark("출근");
			}
			as.updateAttTime(eah);
			mv.addObject("attTime", attTime);
			mv.setViewName("jsonView");
		} catch (AttendanceException e) {
			e.printStackTrace();
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		EmpAttHistory eahForSession = new EmpAttHistory();
		eahForSession.setEmpNo(emp.getEmpNoSeq());
		eahForSession.setAttDate(checkDate);
		EmpAttHistory empAttHistory = as.selectTodayOneEmpAttHistory(eahForSession);
		session.setAttribute("empAttHistory", empAttHistory);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	//퇴근 시간 입력용 메소드
	@RequestMapping("updateLeaveTime.att")
	public ModelAndView updateLeaveTime(ModelAndView mv, HttpSession session, HttpServletResponse response) {
		
		Employee emp = (Employee) session.getAttribute("loginUser");
		AttendancePolicy ap = as.selectBaseSetting(emp.getCompanyNo());
		
		java.sql.Date checkDate = new java.sql.Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		String leaveTime = sdf.format(checkDate);
		
		
		EmpAttHistory eah = new EmpAttHistory();
		eah.setAttDate(checkDate);
		eah.setLeaveTime(leaveTime);
		eah.setEmpNo(emp.getEmpNoSeq());
		
		
		try {
			java.util.Date workEnd = sdf.parse(ap.getWorkEnd());
			java.util.Date leave = sdf.parse(leaveTime);
			if(workEnd.after(leave) == true) {
				eah.setRemark("조퇴");
			}
			String attTime = as.updateLeaveTime(eah);
			java.util.Date att = sdf.parse(attTime);
			long calc = leave.getTime() - att.getTime();
			long timeForHour = calc / (1000 * 60 * 60);
			long timeForMin = (calc % (1000 * 60 * 60) / (1000 * 60));
			String hour = timeForHour + "";
			String min = timeForMin + "";
			if(timeForHour < 10) {
				hour = "0" + timeForHour;
			}
			if(timeForMin < 10) {
				min = "0" + timeForMin;
			}
			String workTime = hour + ":" + min;
			session.setAttribute("forWorkTime", workTime);
			mv.addObject("workTime", workTime);
			mv.setViewName("jsonView");
		} catch (AttendanceException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		EmpAttHistory eahForSession = new EmpAttHistory();
		eahForSession.setEmpNo(emp.getEmpNoSeq());
		eahForSession.setAttDate(checkDate);
		EmpAttHistory empAttHistory = as.selectTodayOneEmpAttHistory(eahForSession);
		session.setAttribute("empAttHistory", empAttHistory);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	@RequestMapping("selectMyAttReport.att")
	public String selectMyAttReport() {
		
		return "groupware/personalAttendance/paMain";
	}
	
	@RequestMapping(value="selectMonthAtt.att", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectMonthAtt(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
									String thisYear, String thisMonth, String dayRange) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		startCal.set(Calendar.YEAR, Integer.parseInt(thisYear));
		startCal.set(Calendar.MONTH, Integer.parseInt(thisMonth));
		startCal.set(Calendar.DATE, 1);
		endCal.set(Calendar.YEAR, Integer.parseInt(thisYear));
		endCal.set(Calendar.MONTH, Integer.parseInt(thisMonth)+1);
		endCal.set(Calendar.DATE, 1);
		
		java.sql.Date startDate = new java.sql.Date(startCal.getTimeInMillis());
		java.sql.Date endDate = new java.sql.Date(endCal.getTimeInMillis());
		
		EmpAttHistory eah = new EmpAttHistory();
		eah.setEmpNo(emp.getEmpNoSeq());
		eah.setStartDate(startDate);
		eah.setEndDate(endDate);
		
		ArrayList<EmpAttHistory> monthAttList = as.selectMonthAtt(eah);
		
		if(!monthAttList.isEmpty()) {
			for(int i = 0; i < monthAttList.size(); i++) {
				monthAttList.get(i).setAttDateString(monthAttList.get(i).getAttDate().toString());
			}
			
			// 검색된 한달 결과에 대한 시간 계산 로직
			AttendancePolicy ap = as.selectBaseSetting(emp.getCompanyNo());
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			
			//출근 일수
			double attCount = 0;
			//휴가 일수
			double vacCount = 0;
			//지각 횟수
			int lateCount = 0;
			//조퇴 횟수
			int erlLvCount = 0;
			
			//정상 근무시간 총량 
			long normalTimeMs = 0;
			int normalTimes = 0;
			int normalMinutes = 0;
			
			//점심시간 총량 (정상 근무시간 중 제외할 시간)
			long lunchTimeMs = 0;
			
			//추가 근무시간 총량
			long extraTimeMs = 0;
			int extraTimes = 0;
			int extraMinutes = 0;
			
			//야간 근무시간 총량
			long nightTimeMs = 0;
			int nightTimes = 0;
			int nightMinutes = 0;
			
		
			
			try {
				//점심시간 대조용
				java.util.Date lunchStart = sdf.parse(ap.getLunchStart());
				java.util.Date lunchEnd = sdf.parse(ap.getLunchEnd());
				lunchTimeMs = lunchEnd.getTime()-lunchStart.getTime();
				
				for(int i = 0; i < monthAttList.size(); i ++) {
					if(monthAttList.get(i).getAttCode().equals("LV")) {
						attCount++;
						
						//정상 근무시간 대조용
						java.util.Date workStart = sdf.parse(ap.getWorkStart());
						java.util.Date workEnd = sdf.parse(ap.getWorkEnd());
						
						//연장 근무 허용시간 대조용
						java.util.Date extraStart = sdf.parse(ap.getAllowedWorkStart());
						java.util.Date extraEnd = sdf.parse(ap.getAllowedWorkEnd());
						
						//야간 근무 인정시간 확인용
						java.util.Date nightWorkCut = sdf.parse("22:00");
						
						//출근 지각여부
						//출근 시간 계산을 위해 지각이 아닌 경우, 출근시간을 정상 근무 시작시간으로 설정
						java.util.Date checkAttTime = sdf.parse(monthAttList.get(i).getAttTime());
						
						if(workStart.after(checkAttTime) == true) {
							
							monthAttList.get(i).setAttTime(sdf.format(workStart));
							
						} else if(workStart.after(checkAttTime) == false) {
							
							lateCount += 1;
							
						}
						
						//퇴근 조퇴여부
						//허용 초과근무시간이 야간근무 인정시간보다 늦은 경우, 야간근무 시작시간부터 퇴근시간까지 야간근무 시간 총량 +
						//허용 초과근무시간이 야간근무 인정시간보다 빠른 경우, 
						//1. 퇴근시간이 허용 초과근무시간보다 늦은 경우 퇴근시간 = 허용 초과근무시간
						//2. 퇴근시간이 허용 초과근무시간보다 빠른 경우 퇴근시간 = 퇴근시간(변경필요 x)
						java.util.Date checkLeaveTime = sdf.parse(monthAttList.get(i).getLeaveTime());
						java.util.Date forCountAtt = sdf.parse(monthAttList.get(i).getAttTime());
						
						if(workEnd.before(checkLeaveTime) == true && extraStart.before(checkLeaveTime) == false) {
							
							normalTimeMs += (workEnd.getTime() - forCountAtt.getTime());
						} else if(workEnd.after(checkLeaveTime) == true) {
							
							normalTimeMs += (checkLeaveTime.getTime() - forCountAtt.getTime());
							
						} else {
							//허용 초과근무시간이 야간근무 인정시간보다 빠른 경우, 퇴근 시간이 허용 초과 근무시간보다 늦음
							if(extraEnd.before(nightWorkCut) == true && extraEnd.before(checkLeaveTime) == true) {
								
								normalTimeMs += (workEnd.getTime() - forCountAtt.getTime());
								extraTimeMs += (extraEnd.getTime() - extraStart.getTime());
								
								//허용 초과근무시간이 야간근무 인정시간보다 빠른 경우, 퇴근 시간이 허용 초과 근무시간 이내
							} else if(extraEnd.before(nightWorkCut) == true && extraEnd.before(checkLeaveTime) == false) {
								
								normalTimeMs += (workEnd.getTime() - forCountAtt.getTime());
								extraTimeMs += (checkLeaveTime.getTime() - extraStart.getTime());
								
								//허용 초과근무시간이 야간근무 인정시간보다  늦은 경우, 퇴근 시간이 야간근무 인정시간보다 늦고 초과근무 인정시간보다도 늦은 경우
							} else if(extraEnd.before(nightWorkCut) == false && 
									nightWorkCut.before(checkLeaveTime) == true && 
									extraEnd.before(checkLeaveTime) == true) {
								
								normalTimeMs += (workEnd.getTime() - forCountAtt.getTime());
								extraTimeMs += (nightWorkCut.getTime() - extraStart.getTime());
								nightTimeMs += (extraEnd.getTime() - nightWorkCut.getTime());
								
								//허용 초과근무시간이 야간근무 인정시간보다  늦은 경우, 퇴근 시간이 야간근무 인정시간보다 늦고 초과근무 인정시간보다는 빠른 경우
							} else if(extraEnd.before(nightWorkCut) == false && 
									nightWorkCut.before(checkLeaveTime) == true && 
									extraEnd.before(checkLeaveTime) == false) {
								
								normalTimeMs += (workEnd.getTime() - forCountAtt.getTime());
								extraTimeMs += (nightWorkCut.getTime() - extraStart.getTime());
								nightTimeMs += (checkLeaveTime.getTime() - nightWorkCut.getTime());
								
							} else if(extraEnd.before(nightWorkCut) == false && 
									(nightWorkCut.before(checkLeaveTime) == false || 
									nightWorkCut.equals(checkLeaveTime) == true)) {
								
								normalTimeMs += (workEnd.getTime() - forCountAtt.getTime());
								extraTimeMs += (nightWorkCut.getTime() - extraStart.getTime());
								nightTimeMs += (checkLeaveTime.getTime() - nightWorkCut.getTime());
								
							}
						}
					}
					if(monthAttList.get(i).getAttCode().equals("VAC")) {
						vacCount++;
					}
				}
//				else if(monthAttList.get(i).getAttCode().equals("AMVAC") || monthAttList.get(i).getAttCode().equals("PMVAC")) {
//					attCount += 0.5;
//					vacCount += 0.5;
//				}
				
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			//근무일자, 시간 계산 정리
			monthAttList.get(0).setAttCount(attCount);
			monthAttList.get(0).setVacationDay(vacCount);
			monthAttList.get(0).setLateCount(lateCount);
			monthAttList.get(0).setEarlyLv(erlLvCount);
			
			//총 근무 시간 계산
			long totalTimeMs = normalTimeMs - ((long) (attCount * lunchTimeMs)) + extraTimeMs + nightTimeMs;
			int totalTimes = (int) (totalTimeMs / (1000 * 60 * 60));
			int totalMinutes = (int) (totalTimeMs % (1000 * 60 * 60) / (1000 * 60));
			
			String totalHour = totalTimes + "";
			String totalMin = totalMinutes + "";
			if(totalTimes < 10) {
				totalHour = "0" + totalTimes;
			}
			if(totalMinutes < 10) {
				totalMin = "0" + totalMinutes;
			}
			String totalWorkTime = totalHour + ":" + totalMin;
			monthAttList.get(0).setTotalWorkTime(totalWorkTime);
//			System.out.println(totalWorkTime);
			//정상근무 시간 계산. 출근 일자 * 점심시간 만큼 제한다.
			normalTimeMs -= (long) (attCount * lunchTimeMs);
			normalTimes = (int) (normalTimeMs / (1000 * 60 * 60));
			normalMinutes = (int) (normalTimeMs / (1000 * 60 * 60) / (1000 * 60));
			
			String normalHour = normalTimes + "";
			String normalMin = normalMinutes + "";
			if(normalTimes < 10) {
				normalHour = "0" + normalTimes;
			}
			if(normalMinutes < 10) {
				normalMin = "0" + normalMinutes;
			}
			String normalWorkTime = normalHour + ":" + normalMin;
//			System.out.println(normalWorkTime);
			monthAttList.get(0).setNormalTime(normalWorkTime);
			
			//추가근무 시간 계산.
			extraTimes = (int) (extraTimeMs / (1000 * 60 * 60));
			extraMinutes = (int) (extraTimeMs / (1000 * 60 * 60) / (1000 * 60));
			
			String extraHour = extraTimes + "";
			String extraMin = extraMinutes + "";
			if(extraTimes < 10) {
				extraHour = "0" + extraTimes;
			}
			if(extraMinutes < 10) {
				extraMin = "0" + extraMinutes;
			}
			String extraWorkTime = extraHour + ":" + extraMin;
//			System.out.println(extraWorkTime);
			monthAttList.get(0).setExtraTime(extraWorkTime);
			
			//야간근무 시간 계산.
			nightTimes = (int) (nightTimeMs / (1000 * 60 * 60));
			nightMinutes = (int) (nightTimeMs / (1000 * 60 * 60) / (1000 * 60));
			
			String nightHour = nightTimes + "";
			String nightMin = nightMinutes + "";
			if(nightTimes < 10) {
				nightHour = "0" + nightTimes;
			}
			if(nightMinutes < 10) {
				nightMin = "0" + nightMinutes;
			}
			String nightWorkTime = nightHour + ":" + nightMin;
			monthAttList.get(0).setNightTime(nightWorkTime);
			
		} else {
			
		}
		Gson gson = new Gson(); 
		return gson.toJson(monthAttList);
	}
	
	@RequestMapping("selectDeptAtt.att")
	public String selectDeptAtt() {
		
		return "groupware/personalAttendance/paDept";
	}
	
	@RequestMapping(value="selectDeptMonthAtt.att", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectDeptMonthAtt(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
									String thisYear, String thisMonth) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		startCal.set(Calendar.YEAR, Integer.parseInt(thisYear));
		startCal.set(Calendar.MONTH, Integer.parseInt(thisMonth));
		startCal.set(Calendar.DATE, 1);
		endCal.set(Calendar.YEAR, Integer.parseInt(thisYear));
		endCal.set(Calendar.MONTH, Integer.parseInt(thisMonth)+1);
		endCal.set(Calendar.DATE, 1);
		
		java.sql.Date startDate = new java.sql.Date(startCal.getTimeInMillis());
		java.sql.Date endDate = new java.sql.Date(endCal.getTimeInMillis());
		
		EmpAttHistory eah = new EmpAttHistory();
		eah.setStartDate(startDate);
		eah.setEndDate(endDate);
		
		ArrayList<ArrayList<EmpAttHistory>> monthDeptAtt = as.selectMonthDeptAtt(eah, emp.getEmpDeptCode());
		Gson gson = new Gson(); 
		return gson.toJson(monthDeptAtt);
	}
	
	@RequestMapping("selectEmpVacation.att")
	public String selectEmpVacation(HttpSession session, HttpServletRequest request) {
		
		Employee emp = (Employee) session.getAttribute("loginUser");
		Calendar today = Calendar.getInstance();
		java.sql.Date check = new java.sql.Date(today.getTimeInMillis());
		
		VacationSetting forList = new VacationSetting();
		forList.setEmpNoSeq(emp.getEmpNoSeq());
		forList.setCheck(check);
		
		ArrayList<VacationSetting> empVacationList = as.selectEmpVacation(emp.getEmpNoSeq());
		ArrayList<VacationSetting> vacHisList = as.selectAllowedEmpVacationHistory(forList);
		
		for(VacationSetting v : vacHisList) {
			v.setVacStartDateString(v.getVacStartDate().toString());
			v.setVacEndDateString(v.getVacEndDate().toString());
		}
		
		request.setAttribute("empVacationList", empVacationList);
		request.setAttribute("vacHisList", vacHisList);
		
		return "groupware/personalAttendance/vacationRequest";
	}
	
	@RequestMapping("insertVacationRequest.att")
	public String insertVacationRequest(HttpSession session, VacationSetting vacation, Model model) {
		
		Employee emp = (Employee) session.getAttribute("loginUser");
		Calendar today = Calendar.getInstance();
		java.sql.Date reqDate = new java.sql.Date(today.getTimeInMillis());
		String ampm = vacation.getAmpm();
		if(ampm.equals("none")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			try {
				Date start = sdf.parse(vacation.getVacStartDate().toString());
				Date end = sdf.parse(vacation.getVacEndDate().toString());
				long calDate = end.getTime() - start.getTime();
				int calculate = (int) (calDate/(24*60*60*1000));
				
				vacation.setDecreaseDays(calculate + 1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			vacation.setDecreaseDays(0.5);
		}
		vacation.setReqDate(reqDate);
		vacation.setEmpNoSeq(emp.getEmpNoSeq());
		vacation.setCompanyNo(emp.getCompanyNo());
		
		try {
			as.insertVacationRequest(vacation);
			return "redirect:selectEmpVacation.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("selectVacationRequestList.att")
	public String selectVacationRequestList(HttpSession session, Model model) {
		
		Employee emp = (Employee) session.getAttribute("loginUser");
		int companyNo = emp.getCompanyNo();
		
		ArrayList<VacationSetting> allEmpVacReqList = as.selectVacationRequestList(companyNo);
		
		for(VacationSetting v : allEmpVacReqList) {
			v.setReqDateString(v.getReqDate().toString());
			v.setVacStartDateString(v.getVacStartDate().toString());
			v.setVacEndDateString(v.getVacEndDate().toString());
		}
		
		model.addAttribute("allEmpVacReqList", allEmpVacReqList);
		
		return "hrPage/attendance/vacationRequestList";
	}
	
	@RequestMapping("updateVacHisApp.att")
	public String updateVacHisApp(HttpServletRequest request, Model model) {
		
		int vacHisSeq = Integer.parseInt(request.getParameter("no"));
		
		try {
			as.updateVacationHistoryApp(vacHisSeq);
			return "redirect:selectVacationRequestList.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("updateVacHisDen.att")
	public String updateVacHisDen(HttpServletRequest request, Model model) {
		
		int vacHisSeq = Integer.parseInt(request.getParameter("no"));
		
		try {
			as.updateVacationHistoryDen(vacHisSeq);
			return "redirect:selectVacationRequestList.att";
		} catch (AttendanceException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("selectAttendanceHistoryManage.att")
	public String selectAttendanceHistoryManage() {
		
		return "hrPage/attendance/attendanceHistoryManage";
	}
	
	@RequestMapping(value="selectAllMonthAtt.att", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectAllMonthAtt(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
									String thisYear, String thisMonth) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		startCal.set(Calendar.YEAR, Integer.parseInt(thisYear));
		startCal.set(Calendar.MONTH, Integer.parseInt(thisMonth));
		startCal.set(Calendar.DATE, 1);
		endCal.set(Calendar.YEAR, Integer.parseInt(thisYear));
		endCal.set(Calendar.MONTH, Integer.parseInt(thisMonth)+1);
		endCal.set(Calendar.DATE, 1);
		
		java.sql.Date startDate = new java.sql.Date(startCal.getTimeInMillis());
		java.sql.Date endDate = new java.sql.Date(endCal.getTimeInMillis());
		
		try {
			ArrayList<Department> deptList = es.selectDepartmentList(emp.getCompanyNo());
			EmpAttHistory eah = new EmpAttHistory();
			eah.setStartDate(startDate);
			eah.setEndDate(endDate);
			ArrayList<ArrayList<ArrayList<EmpAttHistory>>> list = new ArrayList<ArrayList<ArrayList<EmpAttHistory>>>();
			for(Department d : deptList) {
				ArrayList<ArrayList<EmpAttHistory>> monthDeptAtt = as.selectMonthDeptAtt(eah, d.getDeptCodeSeq());
				list.add(monthDeptAtt);
			}
			Gson gson = new Gson(); 
			return gson.toJson(list);
		} catch (SelectDepartmentListFailed e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
}