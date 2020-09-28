package com.kh.insane.common.connector.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.insane.attendance.model.service.AttendanceService;
import com.kh.insane.attendance.model.vo.AttendancePolicy;
import com.kh.insane.common.connector.model.service.MainPageService;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.ProfileAttachment;
import com.kh.insane.reward.model.exception.RewardException;
import com.kh.insane.reward.model.service.RewardService;
import com.kh.insane.reward.model.vo.DeductionSetting;
import com.kh.insane.reward.model.vo.ProvisionSetting;
import com.kh.insane.reward.model.vo.SalarySetting;

/**
 * Class : MainPageController
 * @author 고종현
 * @version 1.0.0
 * @since 2020.09.05
 * @apiNote 메인페이지와 타페이지의 연결을 담당하는 컨트롤러
 */
@Controller
public class MainPageController {
	@Autowired
	private MainPageService mps;
	
	@Autowired
	private RewardService rs;
	
	@Autowired
	private AttendanceService as;
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 뷰페이지 주소
	 * @see 로그인이 확인 된 사원 계정을  메인페이지에 표시할 값들을 받아 메인페이지로 전송하는 컨트롤러
	 * @since 2020.09.05
	 */
	@RequestMapping(value="groupwareMain.mp")
	public String moveGroupwareMain(Model model, HttpSession session) {
		//프로필 정보를 받아옴
		ProfileAttachment profileInfo  = mps.loadMyProfile((Employee)session.getAttribute("loginUser"));
		//회사의 소식들을 받아옴
		HashMap<String,ArrayList<HashMap<String,Object>>> newsList = mps.loadNews((Employee)session.getAttribute("loginUser"));
		
		//비밀번호 변경의 필요성을 조회
		boolean needChange = mps.checkNeedChange((Employee)session.getAttribute("loginUser"));
		model.addAttribute("needChange",needChange);
		model.addAttribute("profileInfo", profileInfo);
		model.addAttribute("newsList",newsList);
		return "main/main";
	}
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 뷰페이지 주소
	 * @see 해당 사원계정이  인사페이지 접근 권한이 있는지 확인후 인사페이지 팝업을 전송하는 컨트롤러
	 * @since 2020.09.04
	 */
	@RequestMapping(value="openHrm.mp")
	public String popOpenHrm(Model model, HttpSession session) {
		//인사과 접근권한 체크 나중에 수정해야됨
		return "main/hrMain";
	}
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 뷰페이지 주소
	 * @see 해당 사원계정이  인사페이지 접근 권한이 있는지 확인후 인사페이지 팝업을 전송하는 컨트롤러
	 * @since 2020.09.06
	 */
	@RequestMapping(value="changePwd.mp")
	public void updatePwd(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		Employee updateEmp  = (Employee) session.getAttribute("loginUser");
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");
		
		int ajaxResult = 1;
		try {
			mps.updatePwd(updateEmp,oldPwd,newPwd);
		} catch (FailedUpdateCodeException e) {
			e.printStackTrace();
			ajaxResult = e.getResult();
		} finally {
			try {
				response.getWriter().print(ajaxResult);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value = "errorPage.mp")
	public String moveErrorPage(Model model, @Param("msg") String msg) {
		
		model.addAttribute("msg",msg);
		return "common/errorPage";
	}


	@RequestMapping(value = "hrSalarySetting.mp")
	public String moveHrSalarySetting(Model model, HttpSession session) {
		int companyNo = ((Employee) session.getAttribute("loginUser")).getCompanyNo(); 
		
		HashMap<String, Object> list = rs.selectSalarySetting(companyNo);
		
		model.addAttribute("list", list);
		
		return "hrPage/hrSalarySetting";
		
	}
	
	
	//기본급여설정 추가용 메소드
		@PostMapping("insertSalarySetting.mp")
		public String insertSalarySetting(HttpSession session, SalarySetting salarySettingList, Model model) {
			
			int companyNo = ((Employee) session.getAttribute("loginUser")).getCompanyNo(); 
			
			for(int i = 0; i < salarySettingList.getSalarySettingList().size(); i++) {
				salarySettingList.getSalarySettingList().get(i).setCompanyNo(companyNo);
			}
			
			try {
				rs.insertSalarySettingList(salarySettingList.getSalarySettingList());
				return "redirect:hrSalarySetting.mp";
			} catch (RewardException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
			
		}
		
		//기본급여설정 삭제용 메소드
		@RequestMapping("updateSalarySetting.mp")
		public String updatetSalarySetting(HttpSession session, ServletRequest request, Model model) {
			
			String[] requestNum = request.getParameter("delSalSeq").split(",");
			int[] delSalSeq = new int[requestNum.length];
			
			for(int i = 0; i < delSalSeq.length; i++) {
				delSalSeq[i] = Integer.parseInt(requestNum[i]);
			}
			
			try {
				rs.updateSalarySetting(delSalSeq);
				return "redirect:hrSalarySetting.mp";
			} catch (RewardException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
			
		}
		
		
		
		//지급공제사항 접근용 메소드
		@RequestMapping("selectProvisionAndDeductionSetting.mp")
		public String selectProvisionAndDeductionSetting(HttpSession session, Model model) {
			
			int companyNo = ((Employee) session.getAttribute("loginUser")).getCompanyNo();
			
			HashMap<String, Object> list = rs.selectProvisionAndDeductionSetting(companyNo);
			
			model.addAttribute("list", list);
			
			return "hrPage/hrProvisionAndDeductionSetting";
		}
		
		//지급사항 추가용 메소드
		@PostMapping("insertProvisionSetting.mp")
		public String insertProvisionSetting(ProvisionSetting provisionSetting, HttpSession session, Model model) {
			
			int companyNo = ((Employee) session.getAttribute("loginUser")).getCompanyNo(); 
			
			for(int i = 0; i < provisionSetting.getProvisionSettingList().size(); i ++) {
				provisionSetting.getProvisionSettingList().get(i).setCompanyNo(companyNo);
			}
			
			try {
				rs.insertProvisionSetting(provisionSetting.getProvisionSettingList());
				return "redirect:selectProvisionAndDeductionSetting.mp";
			} catch (RewardException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
			
		}
		
		//지급사항 삭제용 메소드
		@RequestMapping("updateProvision.mp")
		public String updateProvision(HttpSession session, HttpServletRequest request, Model model) {
			
			String[] requestNum = request.getParameter("delProvSeq").split(",");
			
			int[] delProvSeq = new int[requestNum.length];
			
			for(int i = 0; i < requestNum.length; i ++) {
				delProvSeq[i] = Integer.parseInt(requestNum[i]);
			}
			
			try {
				rs.updateProvision(delProvSeq);
				return "redirect:selectProvisionAndDeductionSetting.mp";
			} catch (RewardException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}
		
		//공제사항 추가용 메소드
		@PostMapping("insertDeductionSetting.mp")
		public String insertDeductionSetting(DeductionSetting deductionSetting, HttpSession session, Model model) {
			
			int companyNo = ((Employee) session.getAttribute("loginUser")).getCompanyNo(); 
			
			for(int i = 0; i < deductionSetting.getDeductionSettingList().size(); i ++) {
				deductionSetting.getDeductionSettingList().get(i).setCompanyNo(companyNo);
			}
			
			try {
				rs.insertDeductionSetting(deductionSetting.getDeductionSettingList());
				return "redirect:selectProvisionAndDeductionSetting.mp";
			} catch (RewardException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
			
		}
		
		//공제사항 삭제용 메소드
		@RequestMapping("updateDeduction.mp")
		public String updateDeduction(HttpSession session, HttpServletRequest request, Model model) {
			
			String[] requestNum = request.getParameter("delDeduSeq").split(",");
			
			int[] delDeduSeq = new int[requestNum.length];
			
			for(int i = 0; i < requestNum.length; i ++) {
				delDeduSeq[i] = Integer.parseInt(requestNum[i]);
			}
			
			try {
				rs.updateDeduction(delDeduSeq);
				return "redirect:selectProvisionAndDeductionSetting.mp";
			} catch (RewardException e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}	
		}
		
		
		@RequestMapping(value="letsYageun")
		public String moveYageunPop(HttpServletRequest request, HttpSession session) {
			
			Employee emp = (Employee) session.getAttribute("loginUser");
			
			AttendancePolicy ap = as.selectBaseSetting(emp.getCompanyNo());
			
			request.setAttribute("limitTime", ap);
			
		return "common/yageunPop";	
		}
		
		
		@RequestMapping(value = "insertExtraWork.mp")
		public void insertExtraWork(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
			String extraWorkDate = request.getParameter("extraWorkDate");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String issue = request.getParameter("issue");

			HashMap<String, Object> workData = new HashMap<>();

			workData.put("extraWorkDate", extraWorkDate);
			workData.put("startTime", startTime);
			workData.put("endTime", endTime);
			workData.put("issue", issue);
			workData.put("companyNo",((Employee)session.getAttribute("loginUser")).getCompanyNo());
			workData.put("empNoSeq",((Employee)session.getAttribute("loginUser")).getEmpNoSeq());
			
			System.out.println(workData);

			int ajaxResult = 1;
			try {
				mps.insertExtraWork(workData);
			} catch (FailedUpdateCodeException e) {
				e.printStackTrace();
				ajaxResult = e.getResult();

			} finally {

				try {
					response.getWriter().print(ajaxResult);
				} catch (IOException e) {
					e.printStackTrace();
				}

			}

		}
		
		

}