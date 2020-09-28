package com.kh.insane.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.insane.attendance.model.exception.AttendanceException;
import com.kh.insane.attendance.model.service.AttendanceService;
import com.kh.insane.attendance.model.vo.EmpAttHistory;
import com.kh.insane.attendance.model.vo.HolidaySetting;
import com.kh.insane.common.CommonUtils;
import com.kh.insane.common.CustomUtil;
import com.kh.insane.common.Pagination;
import com.kh.insane.company.model.service.CompanyService;
import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.company.model.vo.CompanyInfo;
import com.kh.insane.crtfc.model.vo.CrtfcVo;
import com.kh.insane.employee.model.exception.EmployeeException;
import com.kh.insane.employee.model.exception.HrInfoManagementException;
import com.kh.insane.employee.model.exception.LoginFailedException;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectInsInfoFailed;
import com.kh.insane.employee.model.service.EmployeeService;
import com.kh.insane.employee.model.vo.AcademicCareer;
import com.kh.insane.employee.model.vo.Appointment;
import com.kh.insane.employee.model.vo.Career;
import com.kh.insane.employee.model.vo.EducationEmployee;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.Family;
import com.kh.insane.employee.model.vo.FourInsurance;
import com.kh.insane.employee.model.vo.HRReview;
import com.kh.insane.employee.model.vo.Health;
import com.kh.insane.employee.model.vo.License;
import com.kh.insane.employee.model.vo.Location;
import com.kh.insane.employee.model.vo.Military;
import com.kh.insane.employee.model.vo.PageInfo;
import com.kh.insane.employee.model.vo.PayStep;
import com.kh.insane.employee.model.vo.PayStepHistory;
import com.kh.insane.employee.model.vo.Position;
import com.kh.insane.employee.model.vo.ProfileAttachment;
import com.kh.insane.employee.model.vo.RewardPunish;
import com.kh.insane.employee.model.vo.Rspofc;
import com.kh.insane.employee.model.vo.SearchEmployee;
import com.kh.insane.organization.model.vo.Department;

@SessionAttributes({"loginUser","companyInfo", "auth"})

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService es;
	@Autowired
	private CompanyService ccs;
	@Autowired
	private AttendanceService as;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	/* @RequestMapping("login.em") */
	@PostMapping("login.em")
	public String loginCheck(Model model, Employee e, HttpServletRequest request) {

		// 메인페이지 실행 시 오늘자 근태내역 존재여부 확인
		// 확인 후 존재하지 않으면 고객사 전 사원에 대해 근태내역 생성, 존재하면 처리없이 메인페이지로
		GregorianCalendar calendar = new GregorianCalendar();
		int day = calendar.get(Calendar.DAY_OF_WEEK);
		String daysEnds = (day == 0 || day == 6) ? "ends" : "days";
		java.sql.Date checkDate = new java.sql.Date(System.currentTimeMillis());
		String attToday = checkDate.toString();

		try {
			as.insertAttHistory(attToday, daysEnds);
		} catch (AttendanceException e2) {
			model.addAttribute("msg", e2.getMessage());
			return "common/errorPage";
		}

		try {
			System.out.println(e);
			if (e.getCompanyNo() == 0) {
				CompanyAccount loginUser = ccs.loginCompanyManager(e);
				System.out.println(loginUser.getCompanyNo());
				ArrayList<HolidaySetting> holidayList = as.selectHolidaySetting(loginUser.getCompanyNo());
				model.addAttribute("loginUser", loginUser);
				request.getSession().setAttribute("holidayList", holidayList);
			
				return "redirect:basicInfo.cp";
			} else {
				Employee loginUser = es.loginEmployee(e);
				CompanyInfo companyInfo = ccs.loadMyCompanyInfo(loginUser);
				HashSet<String> auth = ccs.loadMyAuth(loginUser);
				
				ArrayList<HolidaySetting> holidayList = as.selectHolidaySetting(loginUser.getCompanyNo());
				EmpAttHistory eah = new EmpAttHistory();
				eah.setEmpNo(loginUser.getEmpNoSeq());
				eah.setAttDate(checkDate);
				EmpAttHistory empAttHistory = as.selectTodayOneEmpAttHistory(eah);
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
				if (empAttHistory.getAttTime() != null && empAttHistory.getLeaveTime() != null) {
					java.util.Date att = sdf.parse(empAttHistory.getAttTime());
					java.util.Date leave = sdf.parse(empAttHistory.getLeaveTime());

					long calc = leave.getTime() - att.getTime();
					long timeForHour = calc / (1000 * 60 * 60);
					long timeForMin = (calc % (1000 * 60 * 60) / (1000 * 60));
					String hour = timeForHour + "";
					String min = timeForMin + "";
					if (timeForHour < 10) {
						hour = "0" + timeForHour;
					}
					if (timeForMin < 10) {
						min = "0" + timeForMin;
					}
					String workTime = hour + ":" + min;
					System.out.println(workTime);
					empAttHistory.setWorkTime(workTime);
				}

				System.out.println(holidayList);
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("companyInfo", companyInfo);
				model.addAttribute("auth",auth);
				request.getSession().setAttribute("holidayList", holidayList);
				request.getSession().setAttribute("empAttHistory", empAttHistory);
//				model.addAttribute("holidayList", holidayList);
//				model.addAttribute("empAttHistory", empAttHistory);
				return "redirect:groupwareMain.mp";
			}
		} catch (LoginFailedException | ParseException e1) {
			model.addAttribute("msg", e1.getMessage());

			return "common/errorPage";
		}
	}

	/*
	 * // 임시용 회원가입
	 * 
	 * @PostMapping("insert.em") public String insertMember(Model model, Employee e,
	 * HttpServletRequest request) {
	 * 
	 * String comNo = (request.getParameter("companyNo2")); String empId =
	 * request.getParameter("empNo2"); String empPwd =
	 * request.getParameter("empPwd2");
	 * 
	 * e.setCompanyNo(comNo); e.setEmpNo(empId); e.setEmpPwd(empPwd);
	 * 
	 * try { e.setEmpPwd(passwordEncoder.encode(e.getEmpPwd()));
	 * System.out.println(e); es.insertEmployee(e);
	 * 
	 * } catch (Exception e1) {
	 * 
	 * model.addAttribute("msg", "회원 가입 실패");
	 * 
	 * return "common/errorPage"; }
	 * 
	 * return "redirect:index.jsp"; }
	 */

	// 임시용 로그아웃
	/*
	 * @RequestMapping("logout.em") public String logout(HttpSession ses) {
	 * 
	 * ses.invalidate();
	 * 
	 * return "redirect:index.jsp"; }
	 */

	@RequestMapping("logout.em")
	public String logout(SessionStatus status) {

		status.setComplete();

		return "redirect:index.jsp";
	}

	@RequestMapping("hrInfoManagementList.em")
	public String showHrInfoManagementListPage(Model model, HttpServletRequest request) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		int currentPage = 1;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		try {
			int listCount = es.getListCount(companyNo);

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			ArrayList<Employee> list = es.selectEmpList(pi, companyNo);

			model.addAttribute("list", list);
			model.addAttribute("pi", pi);

			return "hrPage/hrInfo/employeeManagement/hrInfoManagementList";
		} catch (HrInfoManagementException e) {
			model.addAttribute("msg", e.getMessage());

			return "common/errorPage";
		}

	}

	/* 사원 정보 등록 페이지 이동 메소드 */
	@RequestMapping("insertEmployeePage.em")
	public String showInsertEmployeePage() {

		return "hrPage/hrInfo/employeeManagement/insertEmployeePage";
	}

	/* 사원 정보 등록용 메소드 */
	@RequestMapping("insertEmpInfo.em")
	public String insertEmpInfo(Model model, Employee emp, HttpServletRequest request, MultipartFile profileImgFile) {

		Employee sessionEmp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = sessionEmp.getCompanyNo();

		emp.setCompanyNo(companyNo);

		System.out.println(emp);
		System.out.println(profileImgFile);

		String fullRoot = request.getSession().getServletContext().getRealPath("resources");
		/*
		 * String firstRoot = fullRoot.substring(0, fullRoot.lastIndexOf("\\")); String
		 * lastRoot = fullRoot.substring(fullRoot.lastIndexOf("\\"));
		 * System.out.println(fullRoot); System.out.println(firstRoot);
		 * System.out.println(lastRoot);
		 */
		
		String filePath = "";
		String savePath = "";
		

		filePath = fullRoot + "\\profileImg\\";
		savePath = "\\resources\\profileImg\\";

		String originFileName = profileImgFile.getOriginalFilename();
		System.out.println("origin name: " + originFileName);
		String ext = null;
		String changeName = null;
		String fullChangeName = null;

		ProfileAttachment profile = null;

		if (originFileName.equals("") || originFileName.equals(null)) {
			System.out.println("originName : '' or null");
		} else {
			ext = originFileName.substring(originFileName.lastIndexOf("."));
			changeName = CommonUtils.getRandomString();
			fullChangeName = changeName + ext;

			profile = new ProfileAttachment();

			profile.setFilePath(savePath);
			profile.setOriginName(originFileName);
			profile.setChangeName(fullChangeName);
			profile.setAttStatus("profile");

			System.out.println(profile);
		}

		try {
			profileImgFile.transferTo(new File(filePath+ "//" + fullChangeName));

			int result = es.insertEmpInfo(emp, profile);

			System.out.println("controller result : " + result);

			model.addAttribute("switchCode", "hrInfoManagementList");

		} catch (IllegalStateException | IOException | HrInfoManagementException e) {
			System.out.println("실패");
			new File(filePath + "\\" + changeName + ext).delete();
			model.addAttribute("error", "사원 정보 입력 실패");

			return "common/errorPage";
		}

		return "redirect:hrInfoManagementList.em";
	}

	@RequestMapping("findEmpNo.em")
	public ModelAndView findEmpNo(ModelAndView mv, HttpServletRequest request) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		try {
			ArrayList<Employee> list = es.selectEmpList(companyNo);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("findLocationCode.em")
	public ModelAndView findLocationCode(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		try {
			ArrayList<Location> list = es.selectLocationList(companyNo);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("findDeptCode.em")
	public ModelAndView findDeptCode(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		try {
			ArrayList<Department> list = es.selectDepartmentList(companyNo);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("findPositionCode.em")
	public ModelAndView findPositionCode(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		try {
			ArrayList<Position> list = es.selectPositionList(companyNo);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("findRspofcCode.em")
	public ModelAndView findRspofcCode(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		try {
			ArrayList<Rspofc> list = es.selectRspofcList(companyNo);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("findPayStepCode.em")
	public ModelAndView findPayStepCode(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		try {
			ArrayList<PayStep> list = es.selectPayStepList(companyNo);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("/selectRetiredList.em")
	public String selectRetiredList(HttpServletRequest request, HttpServletResponse response) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();
		// String selectKind;
		// if(request.getParameter("kind") != null) {
		// selectKind = request.getParameter("kind");
		// }

		// String name = request.getParameter("name");

		int currentPage = 1;
		int limits = 20;

		if (request.getParameter("currentPage") != null) {
			String str = request.getParameter("currentPage");
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// currentPage = 3;

		ArrayList<Employee> list = null;
		int listCount = 0;

		Employee scEmp = new Employee();

		scEmp.setCompanyNo(companyNo);
		scEmp.setEmpStatus("N");

		String name = null;
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
			scEmp.setEmpNameKor(name);
		}

		listCount = es.selectRetiredListCount(scEmp);

		int totalCount = listCount;
		int btnCount = 10;

		com.kh.insane.common.model.vo.PageInfo pi = CustomUtil.Inst().getPageInfo(limits, currentPage, totalCount,
				btnCount);

		try {
			list = es.selectLeavingList(scEmp, pi);

			request.setAttribute("list", list);
			if (name != null) {
				request.setAttribute("name", name);
			}
			request.setAttribute("pi", pi);

		} catch (EmployeeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			return "common/error";
		}

		// return "paper/leavingList";
		return "hrPage/hrInfo/employeeManagement/leavingList";
	}

	@RequestMapping("selectRetiredEmp.em")
	public String selectRetiredEmp(HttpServletRequest request, HttpServletResponse response) {
		// selectEmployeeUseSeq
		int seqNum = Integer.parseInt(request.getParameter("num"));

		Employee emp = es.selectRetiredEmp(seqNum);

		CrtfcVo cv = new CrtfcVo();
		cv.setEmpNoSeq(emp.getEmpNoSeq());
		cv.setCompanyNo(emp.getCompanyNo());

		request.getSession().removeAttribute("retiredEmp");

		request.getSession().setAttribute("retiredEmp", emp);

		return "redirect:insertLeaving.cr";
		// return "paper/leavingAccept";
	}

	@RequestMapping("selectEmployeeInfo.em")
	public String selectEmpOneInfo(Model model, String num) {

		int empNoSeq = Integer.parseInt(num);

		try {
			HashMap<String, Object> hmap = es.selectEmpOneInfo(empNoSeq);

			model.addAttribute("hmap", hmap);

			return "hrPage/hrInfo/employeeManagement/selectEmployeePage";
		} catch (HrInfoManagementException e) {
			model.addAttribute("msg", e.getMessage());

			return "common/errorPage";
		}

	}

	@RequestMapping("selectInsInfo.em")
	public ModelAndView selectInsInfo(ModelAndView mv, String empNoSeq) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {
			FourInsurance fourIns = es.selectInsInfo(reqEmpNoSeq);

			mv.addObject("fourIns", fourIns);
			mv.setViewName("jsonView");

		} catch (SelectInsInfoFailed e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("updateHltIns.em")
	public ModelAndView updateHltIns(ModelAndView mv, String empNoSeq) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {
			FourInsurance fourIns = es.updateHltIns(reqEmpNoSeq);

			mv.addObject("fourIns", fourIns);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("updateAccIns.em")
	public ModelAndView updateAccIns(ModelAndView mv, String empNoSeq) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {
			FourInsurance fourIns = es.updateAccIns(reqEmpNoSeq);

			mv.addObject("fourIns", fourIns);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("updateEmpIns.em")
	public ModelAndView updateEmpIns(ModelAndView mv, String empNoSeq) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {
			FourInsurance fourIns = es.updateEmpIns(reqEmpNoSeq);

			mv.addObject("fourIns", fourIns);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("updateNtnIns.em")
	public ModelAndView updateNtnIns(ModelAndView mv, String empNoSeq) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {
			FourInsurance fourIns = es.updateNtnIns(reqEmpNoSeq);

			mv.addObject("fourIns", fourIns);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("selectFamInfo.em")
	public ModelAndView selectFamInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<Family> list = es.selectFamInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectAcaInfo.em")
	public ModelAndView selectAcaInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<AcademicCareer> list = es.selectAcaInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectMiliInfo.em")
	public ModelAndView selectMiliInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		Military military = null;

		military = es.selectMiliInfo(reqEmpNoSeq);

		mv.addObject("military", military);
		mv.setViewName("jsonView");

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectHealthInfo.em")
	public ModelAndView selectHealthInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<Health> list = es.selectHealthInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectCareerInfo.em")
	public ModelAndView selectCareerInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<Career> list = es.selectCareerInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectLicenseInfo.em")
	public ModelAndView selectLicenseInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<License> list = es.selectLicenseInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectAppointInfo.em")
	public ModelAndView selectAppointInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<Appointment> list = es.selectAppointInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectRPInfo.em")
	public ModelAndView selectRPInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<RewardPunish> list = es.selectRPInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectHRreviewInfo.em")
	public ModelAndView selectHRreviewInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<HRReview> list = es.selectHRreviewInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectPayStepInfo.em")
	public ModelAndView selectPayStepInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			ArrayList<PayStepHistory> list = es.selectPayStepInfo(reqEmpNoSeq);

			mv.addObject("list", list);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("showUpdateEmpPage.em")
	public String showUpdateEmpPage(Model model, String num) {

		int empNoSeq = Integer.parseInt(num);

		try {
			HashMap<String, Object> hmap = es.selectEmpOneInfo(empNoSeq);

			model.addAttribute("hmap", hmap);

			return "hrPage/hrInfo/employeeManagement/updateEmployeePage";
		} catch (HrInfoManagementException e) {
			model.addAttribute("msg", e.getMessage());

			return "common/errorPage";
		}

	}

	/* 사원 정보 수정용 메소드 */
	@RequestMapping("updateEmpInfo.em")
	public String updateEmpInfo(Model model, Employee emp, Military military, HttpServletRequest request,
			MultipartFile profileImgFile) {

		Employee sessionEmp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = sessionEmp.getCompanyNo();

		emp.setCompanyNo(companyNo);

		System.out.println("emp : " + emp);
		System.out.println("img : " + profileImgFile);
		System.out.println("mil" + military);

		String fullRoot = request.getSession().getServletContext().getRealPath("resources");
		/*
		 * String firstRoot = fullRoot.substring(0, fullRoot.lastIndexOf("\\")); String
		 * lastRoot = fullRoot.substring(fullRoot.lastIndexOf("\\"));
		 * System.out.println(fullRoot); System.out.println(firstRoot);
		 * System.out.println(lastRoot);
		 */

		String filePath = "";
		String savePath = "";
		

		filePath = fullRoot + "\\profileImg\\";
		savePath = "\\resources\\profileImg\\";

		String originFileName = profileImgFile.getOriginalFilename();
		System.out.println("origin name: " + originFileName);
		String ext = null;
		String changeName = null;
		String fullChangeName = null;

		ProfileAttachment profile = null;

		if (originFileName.equals("") || originFileName.equals(null)) {
			System.out.println("originName : '' or null");
		} else {
			ext = originFileName.substring(originFileName.lastIndexOf("."));
			changeName = CommonUtils.getRandomString();
			fullChangeName = changeName + ext;

			profile = new ProfileAttachment();

			profile.setFilePath(savePath);
			profile.setOriginName(originFileName);
			profile.setChangeName(fullChangeName);
			profile.setAttStatus("profile");

			System.out.println(profile);
		}

		try {
			profileImgFile.transferTo(new File(filePath+ "//" + fullChangeName));

			int result = es.updateEmpInfo(emp, profile, military);

			System.out.println("controller result : " + result);

		} catch (IllegalStateException | IOException | HrInfoManagementException e) {
			System.out.println("실패");
			new File(filePath + "\\" + changeName + ext).delete();
			model.addAttribute("error", "사원 정보 수정 실패");

			return "common/errorPage";
		}

		return "redirect:hrInfoManagementList.em";
	}

	@RequestMapping("insertFamInfo.em")
	public ModelAndView insertFamInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			Family famInfo) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		famInfo.setCompanyNo(companyNo);

		try {
			ArrayList<Family> list = es.insertFamInfo(famInfo);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteFamInfo.em")
	public ModelAndView deleteFamInfo(ModelAndView mv, HttpServletResponse response, String num, String empNoSeq) {

		int familySeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		Family family = new Family();
		family.setFamilySeq(familySeq);
		family.setEmpNoSeq(reqEmpNoSeq);

		try {
			ArrayList<Family> list = es.deleteFamInfo(family);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("insertAcaInfo.em")
	public ModelAndView insertAcaInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			AcademicCareer academy) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		academy.setCompanyNo(companyNo);

		try {
			ArrayList<AcademicCareer> list = es.insertAcaInfo(academy);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteAcaInfo.em")
	public ModelAndView deleteAcaInfo(ModelAndView mv, HttpServletResponse response, String num, String empNoSeq) {

		int acaSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		AcademicCareer academy = new AcademicCareer();
		academy.setAcademicCareerSeq(acaSeq);
		academy.setEmpNoSeq(reqEmpNoSeq);

		try {
			ArrayList<AcademicCareer> list = es.deleteAcaInfo(academy);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("insertHealthInfo.em")
	public ModelAndView insertHealthInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			Health health) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		health.setCompanyNo(companyNo);

		try {
			ArrayList<Health> list = es.insertHealthInfo(health);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteHealthInfo.em")
	public ModelAndView deleteHealthInfo(ModelAndView mv, HttpServletResponse response, String num, String empNoSeq) {

		int healthSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		Health health = new Health();
		health.setHealthSeq(healthSeq);
		health.setEmpNoSeq(reqEmpNoSeq);

		try {
			ArrayList<Health> list = es.deleteHealthInfo(health);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("insertCareerInfo.em")
	public ModelAndView insertCareerInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			Career career) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		career.setCompanyNo(companyNo);

		try {
			ArrayList<Career> list = es.insertCareerInfo(career);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteCareerInfo.em")
	public ModelAndView deleteCareerInfo(ModelAndView mv, HttpServletResponse response, String num, String empNoSeq) {

		int careerSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		Career career = new Career();
		career.setCareerSeq(careerSeq);
		career.setEmpNoSeq(reqEmpNoSeq);

		try {
			ArrayList<Career> list = es.deleteCareerInfo(career);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectModalLicenseInfo.em")
	public ModelAndView selectModalLicenseInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response,
			HttpServletRequest request) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			HashMap<String, Object> hmap = es.selectModalLicenseInfo(reqEmpNoSeq, companyNo);

			mv.addObject("hmap", hmap);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("insertLicenseInfo.em")
	public ModelAndView insertLicenseInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			License license) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		license.setCompanyNo(companyNo);

		try {
			ArrayList<License> list = es.insertLicenseInfo(license);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteLicenseInfo.em")
	public ModelAndView deleteLicenseInfo(ModelAndView mv, HttpServletResponse response, String num, String empNoSeq) {

		int licenseSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		License license = new License();
		license.setLicenseSeq(licenseSeq);
		license.setEmpNoSeq(reqEmpNoSeq);

		try {
			ArrayList<License> list = es.deleteLicenseInfo(license);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("selectModalAppointInfo.em")
	public ModelAndView selectModalAppointInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response,
			HttpServletRequest request) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		try {

			HashMap<String, Object> hmap = es.selectModalAppointInfo(reqEmpNoSeq, companyNo);

			mv.addObject("hmap", hmap);
			mv.setViewName("jsonView");

		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("insertAppointmentInfo.em")
	public ModelAndView insertAppointmentInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			Appointment appointment) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		appointment.setCompanyNo(companyNo);

		try {
			ArrayList<Appointment> list = es.insertAppointmentInfo(appointment);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteAppointmentInfo.em")
	public ModelAndView deleteAppointmentInfo(ModelAndView mv, HttpServletResponse response, String num,
			String empNoSeq) {

		int appSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		Appointment appointment = new Appointment();
		appointment.setGvofodHistorySeq(appSeq);
		appointment.setTargetEmpNo(reqEmpNoSeq);

		try {
			ArrayList<Appointment> list = es.deleteAppointmentInfo(appointment);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("insertRewardPunishInfo.em")
	public ModelAndView insertRewardPunishInfo(ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response, RewardPunish rp) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		rp.setCompanyNo(companyNo);

		try {
			ArrayList<RewardPunish> list = es.insertRewardPunishInfo(rp);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteRewardPunishInfo.em")
	public ModelAndView deleteRewardPunishInfo(ModelAndView mv, HttpServletResponse response, String num,
			String empNoSeq) {

		int rpSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		RewardPunish rp = new RewardPunish();
		rp.setRwrdPnshHistorySeq(rpSeq);
		rp.setTargetEmpNo(reqEmpNoSeq);

		try {
			ArrayList<RewardPunish> list = es.deleteRewardPunishInfo(rp);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("insertHRreviewInfo.em")
	public ModelAndView insertHRreviewInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			HRReview hr) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		hr.setCompanyNo(companyNo);

		try {
			ArrayList<HRReview> list = es.insertHRreviewInfo(hr);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	@RequestMapping("deleteHRreviewInfo.em")
	public ModelAndView deleteHRreviewInfo(ModelAndView mv, HttpServletResponse response, String num, String empNoSeq) {

		int hrSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);

		HRReview hr = new HRReview();
		hr.setPrsnlExmHistorySeq(hrSeq);
		hr.setTargetEmpNo(reqEmpNoSeq);

		try {
			ArrayList<HRReview> list = es.deleteHRreviewInfo(hr);

			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		return mv;
	}

	
	@RequestMapping("selectModalPayStepInfo.em")
	public ModelAndView selectModalPayStepInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response, HttpServletRequest request) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		int companyNo = emp.getCompanyNo();
		
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);
		
		try {
			
			HashMap<String, Object> hmap = es.selectModalPayStepInfo(reqEmpNoSeq, companyNo);
			
			mv.addObject("hmap", hmap);
			mv.setViewName("jsonView");
			
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	@RequestMapping("insertPayStepInfo.em")
    public ModelAndView insertPayStepInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, PayStepHistory psHistory) {

        Employee emp = (Employee) request.getSession().getAttribute("loginUser");

        int companyNo = emp.getCompanyNo();

        psHistory.setCompanyNo(companyNo);

        try {
            ArrayList<PayStepHistory> list = es.insertPayStepInfo(psHistory);

            mv.addObject("list", list);
            mv.setViewName("jsonView");
        } catch (HrInfoManagementException e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        return mv;
    }
	
	@RequestMapping("deletePayStepInfo.em")
	public ModelAndView deletePayStepInfo(ModelAndView mv, HttpServletResponse response, String num, String empNoSeq) {
		
		int psSeq = Integer.parseInt(num);
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);
		
		PayStepHistory psHistory = new PayStepHistory();
		psHistory.setPayStepHistorySeq(psSeq);
		psHistory.setTargetEmpNo(reqEmpNoSeq);
		
		try {
			ArrayList<PayStepHistory> list = es.deletePayStepInfo(psHistory);
			
			mv.addObject("list", list);
			mv.setViewName("jsonView");
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	
	
	@RequestMapping("selectEmpListForSalary.em")
    public String selectEmpListForSalary(Model model, HttpServletRequest request) {

        Employee emp = (Employee) request.getSession().getAttribute("loginUser");

        int companyNo = emp.getCompanyNo();

        int currentPage = 1;

        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

        try {
            int listCount = es.getListCount(companyNo);

            PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

            ArrayList<Employee> list = es.selectEmpList(pi, companyNo);

            model.addAttribute("list", list);
            model.addAttribute("pi", pi);

            return "wage/empWageList/selectEmployeePage";
        } catch (HrInfoManagementException e) {
            model.addAttribute("msg", e.getMessage());
            return "common/errorPage";

        }
	
}

	@RequestMapping("selectEducationInfo.em")
	public ModelAndView selectEducationInfo(ModelAndView mv, String empNoSeq, HttpServletResponse response) {
		
		int reqEmpNoSeq = Integer.parseInt(empNoSeq);
		
		try {
			
			ArrayList<EducationEmployee> list = es.selectEducationInfo(reqEmpNoSeq);
			
			mv.addObject("list", list);
			mv.setViewName("jsonView");
			
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	@RequestMapping("searchEmployeeList.em")
	public ModelAndView searchEmployeeList(ModelAndView mv, String num, 
			HttpServletRequest request, HttpServletResponse response, SearchEmployee sEmp) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		int companyNo = emp.getCompanyNo();
		
		sEmp.setCompanyNo(companyNo);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		int currentPage = 1;
		System.out.println("num : " + num); System.out.println("sEmp : " + sEmp);
		if(num != null) {
			currentPage = Integer.parseInt(num);
		}
		
		try {
			
			int listCount = es.getSearchEmpListCount(sEmp);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Employee> list = es.searchEmployeeList(pi, sEmp);
			
			hmap.put("list", list);
			hmap.put("pi", pi);
			
			mv.addObject("hmap", hmap);
			mv.setViewName("jsonView");
			
		} catch (HrInfoManagementException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	@RequestMapping("selectPersonalEmpInfo.em")
	public String selectPersonalEmpInfo(Model model, String num) {
		
		int empNoSeq = Integer.parseInt(num);
		
		try {
			HashMap<String, Object> hmap = es.selectEmpOneInfo(empNoSeq);
			
			model.addAttribute("hmap", hmap);
			
			return "hrPage/hrInfo/employeeManagement/selectPersonalEmployeePage";
		} catch (HrInfoManagementException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	}
	
}










	

