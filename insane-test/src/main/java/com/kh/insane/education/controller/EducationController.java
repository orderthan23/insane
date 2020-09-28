package com.kh.insane.education.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.insane.common.Pagination;
import com.kh.insane.company.model.exception.FailedDeleteCodeException;
import com.kh.insane.company.model.exception.FailedInsertCodeException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.education.model.service.EducationService;
import com.kh.insane.education.model.vo.Education;
import com.kh.insane.education.model.vo.Evaluation;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.PageInfo;

/**
 * Class : MainPageController
 * @author 고종현
 * @version 1.0.0
 * @since 2020.09.08
 * @apiNote 교육의 관련된 정보를 조회하고 업데이트하는 컨트롤러
 */
@Controller
public class EducationController {

	@Autowired
	private EducationService eds;
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  회사의 모든 교육 내역을 조회하는 컨트롤러 
	 * @since 2020.09.08
	 */
	@RequestMapping(value="Edulist.edu")
	public String moveEducationList(Model model, HttpSession session, HttpServletRequest request) {
		int currentPage = 1;
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = eds.getListCount(companyNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,10);
		
		
		ArrayList<Education> eduList;
		try {
			eduList = eds.loadEduList(companyNo,pi);
			model.addAttribute("eduList",eduList);
			model.addAttribute("pi",pi);
			return "notice/eduList";
		} catch (FailedUpdateCodeException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * @author 고종현
	 * @param  eduScheduleSeq 클라이언트가 선택한 교육 게시물
	 * @return 이동할 뷰페이지 주소
	 * @see  선택된 교육 내용의 정보를 조회하는 컨트롤러 
	 * @since 2020.09.08
	 */
	@RequestMapping(value="eduDetail.edu")
	public String moveEducationDetail(Model model, HttpServletRequest request) {
		int eduScheduleSeq = Integer.parseInt(request.getParameter("eduScheduleSeq"));
		Education edu = eds.loadEduDetail(eduScheduleSeq);
		model.addAttribute("edu",edu);
		
		return "notice/eduDetail";
	}
	
	/**
	 * @author 고종현
	 * @param  eduScheduleSeq 클라이언트가 취소 하기로 선택한 교육 게시물
	 * @return 이동할 뷰페이지 주소
	 * @see  선택된 교육을 취소상태로 업데이트 하는 컨트롤러
	 * @since 2020.09.08
	 */
	@RequestMapping(value="cancleEdu.edu")
	public void cancleEdu( HttpServletRequest request, HttpServletResponse response) {
		int eduScheduleSeq = Integer.parseInt(request.getParameter("eduScheduleSeq"));
		int ajaxResult = 1;
		try {
			eds.cancleEdu(eduScheduleSeq);
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
	 * @see  이수가 완료된 교육 리스트를 불러오는 컨트롤러 
	 * @since 2020.09.09
	 */
	@RequestMapping(value="moveEduAssessment.edu")
	public String moveEduAssessment(Model model, HttpSession session) {
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		ArrayList<Education> eduList = eds.loadCompleteEducation(companyNo);
		System.out.println(eduList);
		model.addAttribute("eduList",eduList);
		
		return "hrPage/education/completeEduList";
	}
	
	@RequestMapping(value="addCompletePop.edu")
	public String addCompletePop(Model model) {
		
	return "hrPage/education/addCompletePop";	
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="searchMemberInEdu.edu")
	public String searchMemberInEdu(Model model, HttpSession session, HttpServletRequest request) {
		
		HashMap<String,Object> keywordInfo = new HashMap<>();
		keywordInfo.put("companyNo",((Employee)session.getAttribute("loginUser")).getCompanyNo());
		keywordInfo.put("keyword", request.getParameter("keyword"));
		
		
		ArrayList<Employee> empList = eds.getLoadOurCompanyEmp(keywordInfo);
		model.addAttribute("empList", empList);
		model.addAttribute("keyword",keywordInfo.get("keyword"));
		return "hrPage/education/addCompletePop";
	}
	
	/**
	 * @author 고종현
	 * @param  empNoSeq : 추가할 사원의 시퀀스
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자를 추가하는 컨트롤러
	 * @since 2020.09.10
	 */
	@RequestMapping(value="insertCompleteEmp.edu")
	public void insertCompleteEmp(Model model, HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		String empNoSeqs = request.getParameter("empNoSeq");
		int eduScheduleSeq = Integer.parseInt(request.getParameter("eduScheduleSeq"));
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		ArrayList<Integer> empNoSeq = new ArrayList<>();
		 int ajaxResult = 1;
		for(int i=0; i<empNoSeqs.split(",").length; i++) {
		 empNoSeq.add( Integer.parseInt(empNoSeqs.split(",")[i]));
		 }
		
		try {
			eds.insertCompleteEmp(empNoSeq,eduScheduleSeq,companyNo);
		} catch (FailedUpdateCodeException e) {
			ajaxResult = e.getResult();
			e.printStackTrace();
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
	 * @param  evaluation : 사원의 평가 정보
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자의 평가사항을 업데이트 하는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="updateCompleteInfo.edu")
	public void updateCompleteInfo(HttpSession session, HttpServletRequest request, 
			HttpServletResponse response){
		
		Evaluation evaluation = new Evaluation();
		
		int eduScheduleSeq = Integer.parseInt(request.getParameter("value2"));
		String remark = request.getParameter("remark");
		String passFail = request.getParameter("status");
		int empNoSeq = Integer.parseInt(request.getParameter("empNoSeq"));
		int company = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		int ajaxResult = 1;
		evaluation.setEduScheduleSeq(eduScheduleSeq);
		evaluation.setRemark(remark);
		evaluation.setPassFail(passFail);
		evaluation.setEmpNoSeq(empNoSeq);
		evaluation.setCompany(company);
		
		try {
			eds.updateCompleteInfo(evaluation);
		} catch (FailedUpdateCodeException e) {
			ajaxResult = e.getResult();
			e.printStackTrace();
		} finally {
			try {
				response.getWriter().print(ajaxResult);
			} catch (IOException e) {
				// TODO Auto-generated catch block
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
	@RequestMapping(value="deleteCompleteInfo.edu")
	public void deleteCompleteInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int eduScheduleSeq = Integer.parseInt(request.getParameter("value2"));
		int empNoSeq = Integer.parseInt(request.getParameter("empNoSeq"));
		int company = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		Evaluation evaluation = new Evaluation();
		evaluation.setEduScheduleSeq(eduScheduleSeq);
		evaluation.setEmpNoSeq(empNoSeq);
		evaluation.setCompany(company);
		int ajaxResult = 1;
		
		try {
			eds.deleteCompleteInfo(evaluation);
		} catch (FailedDeleteCodeException e) {
			ajaxResult = e.getResult();
			e.printStackTrace();
		} finally {
			try {
				response.getWriter().print(ajaxResult);
			} catch (IOException e) {
				// TODO Auto-generated catch block
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
	@RequestMapping(value="updateChangeIssue.edu")
	public void updateChangeIssue(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		int eduScheduleSeq = Integer.parseInt(request.getParameter("eduScheduleSeq")); 
		String changeIssue = request.getParameter("changeIssue");
		
		Education edu = new Education();
		edu.setCompanyNo(companyNo);
		edu.setEduScheduleSeq(eduScheduleSeq);
		edu.setChangeIssue(changeIssue);
		int ajaxResult = 1;
		try {
			eds.updateChangeIssue(edu);
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
	@RequestMapping(value="noticeEdu.edu")
	public String moveNoticeEdu(Model model, HttpSession session, HttpServletRequest request ) {
		int currentPage = 1;
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = eds.getNoticeEduListCount(companyNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,10);
		
		ArrayList<HashMap<String,Object>> eduList = eds.loadNoticeEduInfo(companyNo,pi);
		model.addAttribute("eduList", eduList);
		model.addAttribute("pi", pi);
		
		
		return  "notice/eduNotice";
	}
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="eduNoticeDetail.edu")
	public String moveNoticeEduDetail(Model model, HttpServletRequest request) {
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		HashMap<String, Object> eduNotice = eds.loadEduNoticeDetail(boardSeq);
		
		model.addAttribute("eduNotice",eduNotice);
		
		return "notice/eduNoticeDetail";
	}
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="updateEduNotice.edu")
	public void updateEduNotice(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> eduNotice  = new HashMap<>();
		eduNotice.put("boardSeq",Integer.parseInt(request.getParameter("boardSeq")));
		eduNotice.put("boardTitle",request.getParameter("boardTitle"));
		eduNotice.put("boardContent",request.getParameter("boardContent"));
		eduNotice.put("status",request.getParameter("status"));
		int ajaxResult = 1;
		try {
			eds.updateEduNotice(eduNotice);
		} catch (FailedUpdateCodeException e) {
			ajaxResult = e.getResult();
			e.printStackTrace();
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
	@RequestMapping(value="removeEduNotice.edu")
	public void removeEduNotice(HttpServletRequest request, HttpServletResponse response) {
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		int ajaxResult = 1;
		
		try {
			eds.removeEduNotice(boardSeq);
		} catch (FailedUpdateCodeException e) {
			ajaxResult = e.getResult();
			e.printStackTrace();
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
	@RequestMapping(value="searchEduCode.edu")
	public String moveEduCodePop(HttpSession session, Model model) {
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		
		ArrayList<Education> eduCodeList = eds.loadAllEducationCode(companyNo);
		
		model.addAttribute("eduCodeList",eduCodeList);
		
		return "hrPage/education/eduCodePop";
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="insertEdu.edu")
	public String moveInsertEdu(Model model) {
		
		return "hrPage/education/eduPlanInsert";
	}
	
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="writeNoticeEdu.edu")
	public String moveWriteNoticeEdu(Model model) {
		
		return "hrPage/education/writeNoticeEdu";
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="insertEduNotice.edu")
	public String insertEduNotice(HttpServletRequest request, HttpSession session, Model model) {
		 HashMap<String,Object> eduMap = new HashMap<>();
		 eduMap.put("title",request.getParameter("title"));
		 eduMap.put("content",request.getParameter("content"));
		 eduMap.put("status", request.getParameter("status"));
		 eduMap.put("empNoSeq",((Employee)session.getAttribute("loginUser")).getEmpNoSeq());
		 eduMap.put("companyNo",((Employee)session.getAttribute("loginUser")).getCompanyNo());
		
		 try {
			  eds.insertEduNotice(eduMap);
			return "redirect:noticeEdu.edu";
		} catch (FailedInsertCodeException e) {
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
			return "common/errorPage";
		}
		 
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="insertEducationPlan.edu")
	public String insertEducationPlan(Model model, HttpSession session, Education edu) {
		System.out.println(edu);
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		edu.setCompanyNo(companyNo);
		try {
			eds.insertEducationPlan(edu);
			return "redirect:Edulist.edu";
		} catch (FailedInsertCodeException e) {

			e.printStackTrace();
			return "common/errorPage";
		}
	}
}
