package com.kh.insane.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.insane.approval.model.service.ApprovalService;
import com.kh.insane.approval.model.vo.Document;
import com.kh.insane.education.model.service.EducationService;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.exception.OrganizationChartFailed.ShowOrganizationChartFailed;
import com.kh.insane.organization.model.service.OrganizationService;
import com.kh.insane.organization.model.vo.OrganizationChart;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aps;
	@Autowired
	private OrganizationService os;
	
	@Autowired
	private EducationService eds;
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="waitAppro.app")
	public String moveWaitApproval(Model model, HttpSession session) {
		
		
		return "groupware/approval/approving";
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="outgoingApproval.app")
	public String moveOutgoingAppro(Model model, HttpSession session) {
		int empNoSeq = ((Employee)session.getAttribute("loginUser")).getEmpNoSeq();
		ArrayList<Document> documentList = aps.loadOutgoingApprovalList(empNoSeq);
		
		return "groupware/approval/outgoingAppro";
	}
	
	
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="tempApproval.app")
	public String moveOutgoingYetAppro(Model model, HttpSession session) {
		
		
		return "groupware/approval/tempAppro";
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="rejectApproval.app")
	public String moveRejectApproval(Model model, HttpSession session) {
		
		
		return "groupware/approval/rejectAppro";
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="successApproval.app")
	public String moveSuccessApproval(Model model, HttpSession session) {
		
		
		return "groupware/approval/successAppro";
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="writeApproval.app")
	public String moveWriteApproval(Model model, HttpSession session) {
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		ArrayList<Document> documentTypeList =  aps.loadDocumentTypeList(companyNo);
		
		model.addAttribute("documentTypeList",documentTypeList);
		return "groupware/approval/writeAppro";
	}
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@RequestMapping(value="popSanctionLine.app")
	public String popSanctionLine(Model model, HttpSession session) {
		int companyNo = ((Employee)session.getAttribute("loginUser")).getCompanyNo();
		
		try {
			ArrayList<OrganizationChart> organiZationList = os.showOrganizationChart(companyNo);
			model.addAttribute("organiZationList", organiZationList);
			return "groupware/approval/sanctionLinePop";
		} catch (ShowOrganizationChartFailed e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping(value="popSearchEmployee.app")
	public String popSearchEmployee(Model model, HttpSession session) {
		
		
		
		return "groupware/approval/searchEmployeePop";
	}
	
	
	@RequestMapping(value="searchEmployee.app")
	public String searchMemberInEdu(Model model, HttpSession session, HttpServletRequest request) {
		
		HashMap<String,Object> keywordInfo = new HashMap<>();
		keywordInfo.put("companyNo",((Employee)session.getAttribute("loginUser")).getCompanyNo());
		keywordInfo.put("keyword", request.getParameter("keyword"));
		
		
		ArrayList<Employee> empList = eds.getLoadOurCompanyEmp(keywordInfo);
		model.addAttribute("empList", empList);
		model.addAttribute("keyword",keywordInfo.get("keyword"));
		return "groupware/approval/searchEmployeePop";
	}
}
