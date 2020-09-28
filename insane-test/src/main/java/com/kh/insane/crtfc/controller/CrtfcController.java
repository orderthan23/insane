package com.kh.insane.crtfc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.crtfc.model.exception.CrtfcException;
import com.kh.insane.crtfc.model.service.CrtfcService;
import com.kh.insane.crtfc.model.vo.CrtfcVo;
import com.kh.insane.crtfc.model.vo.SearchCondition;
import com.kh.insane.employee.model.vo.Employee;

import static com.kh.insane.common.CustomUtil.Inst;


@SessionAttributes("loginUser")
@Controller
public class CrtfcController {
	@Autowired
	private CrtfcService cs;
	
	@RequestMapping("/temp.cr")
	public String tempCa(HttpSession session) {		
		 Employee emp = cs.tempUser();
		 
		 session.setAttribute("loginUser", emp);
		
		//return "paper/employment";
		 return "redirect:requestPage.cr";
		//return "redirect:selectRetiredList.em";
	}
	
	@RequestMapping("/requestPage.cr")
	public String requestPageSet(HttpServletRequest request, HttpServletResponse response) {
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		String kind = request.getParameter("type");
		
		int empSeq = emp.getEmpNoSeq();
		
		CrtfcVo cv = new CrtfcVo();		
		
		cv.setCompanyNo(emp.getCompanyNo());
		//cv.setEmpNoSeq(empSeq);
		cv.setEmpNoSeq(emp.getEmpNoSeq());
		cv.setEmpPositionCode(emp.getEmpPositionCode());
		cv.setEmpDeptCode(emp.getEmpDeptCode());
		
		CrtfcVo crtfc = cs.selectRequestCrtfc(cv);
		
		String path = "paper/";
		//<input type="hidden" name="pageTypeNum" value="경력">
		//String kind = request.getParameter("pageType");
		
		if(crtfc != null) {
			request.setAttribute("crtfc", crtfc);
			
			if(kind.equals("재직")) {
				path += "employment";
			} else if(kind.equals("경력")) {
				path += "career";
			} else if(kind.equals("퇴직")) {
				path += "leaving";
				
				ArrayList<Employee> list = cs.selectRetireEmp(emp.getCompanyNo());
				
				request.setAttribute("list", list);
			} 
			
		} else {
			request.setAttribute("msg", "증명서 요청 실패");
			return "common/errorPage";
		}
		//db에 저장.
		return path;
		//return "paper/career";
		//return "paper/employment";
	}
	
	@RequestMapping("/insertCareer.cr")
	public String requestCareer(HttpServletRequest request, HttpServletResponse response) {
		//회사정보, 사원정보, 사용용도, 회사명(어차피 재직중이면 회사정보에 포함), 입사일(사원정보에 포함), 퇴사일(사원정보에 포함)
		//경력인정개월수(는 계산법 따로 구해야..) 담당업무(사원정보) 최종직위(사원정보) 퇴직사유(CareerVo), 회사번호(회사정보)
		//증명서번호, 증명서구분=재직, CEO 정보, 증명서 등록일(SYSDATE)
		
		
		int companyNo = Integer.parseInt(request.getParameter("companyNo")); //회사 번호
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		//int empSeq = Integer.parseInt(request.getParameter("userNo")); //사원번호.
		
		int empSeq = emp.getEmpNoSeq();
		
		
		String reason = "-";
		if(request.getParameter("reason") != null) {
			reason = request.getParameter("reason");
		}
			
		//int requestCnt = Integer.parseInt(request.getParameter("requestCount")); //신청매수
		
		CrtfcVo cv = new CrtfcVo();
		cv.setCompanyNo(companyNo);
		//cv.setEmpNoSeq(empSeq);
		cv.setEmpNoSeq(emp.getEmpNoSeq());
		cv.setEmpPositionCode(emp.getEmpPositionCode());
		cv.setEmpDeptCode(emp.getEmpDeptCode());
		cv.setCrtfcType("경력");
		cv.setIssueReason(reason);
		//cv.setIssueReason("테스트를 위한 증명서 발급 요청");
		
		CrtfcVo crtfcNo = cs.selectCrtfcInfo(cv);
		
		cv.setCrtfcNo(crtfcNo.getCrtfcNo());
		
		try {
			int result = cs.insertCareer(cv);
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			request.setAttribute("msg", "증명서 입력 실패");
			return "common/errorPage";
		}
		
		//db에 저장.
		return "paper/career";
	}
	
	
	@RequestMapping("/insertEmployment.cr")
	public String requestEmployment(HttpServletRequest request, HttpServletResponse response) {
		//회사정보, 사원정보, 사용용도, 회사명(어차피 재직중이면 회사정보에 포함), 입사일(사원정보에 포함), 퇴사일(사원정보에 포함)
		//경력인정개월수(는 계산법 따로 구해야..) 담당업무(사원정보) 최종직위(사원정보) 퇴직사유(CareerVo), 회사번호(회사정보)
		//증명서번호, 증명서구분=재직, CEO 정보, 증명서 등록일(SYSDATE)
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		//int empSeq = Integer.parseInt(request.getParameter("userNo")); //사원번호.
		
		int empSeq = emp.getEmpNoSeq();
		
		
		String reason = request.getParameter("reason");
//		if(request.getParameter("reason") != null || request.getParameter("reason").length() > 0) {
//			reason = request.getParameter("reason");
//		}
		int length = reason.length();
		if(length == 0) {
			reason = "-";
		}
		
		//int requestCnt = Integer.parseInt(request.getParameter("requestCount")); //신청매수
		
		CrtfcVo cv = new CrtfcVo();		
		
		cv.setCompanyNo(emp.getCompanyNo());
		//cv.setEmpNoSeq(empSeq);
		cv.setEmpNoSeq(emp.getEmpNoSeq());
		cv.setEmpPositionCode(emp.getEmpPositionCode());
		cv.setEmpDeptCode(emp.getEmpDeptCode());
		cv.setCrtfcType("재직");
		cv.setIssueReason(reason);
		//cv.setIssueReason("테스트를 위한 증명서 발급 요청");
		
		CrtfcVo crtfcNo = cs.selectCrtfcInfo(cv);
		
		cv.setCrtfcNo(crtfcNo.getCrtfcNo());
		
		try {	
			//selectCrtfcRequest
			CrtfcVo crtfc = cs.selectRequestCrtfc(cv);
			int result = cs.insertEmployment(cv);
			
			request.setAttribute("crtfc", crtfc);
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			request.setAttribute("msg", "증명서 요청 실패.");
			return "common/errorPage";
		}		
		//db에 저장.
		return "paper/employment";
	}
	
	@RequestMapping("/insertLeaving.cr")
	public String requestLeaving(HttpServletRequest request, HttpServletResponse response) {
		//회사정보, 사원정보, 사용용도, 회사명(어차피 재직중이면 회사정보에 포함), 입사일(사원정보에 포함), 퇴사일(사원정보에 포함)
		//경력인정개월수(는 계산법 따로 구해야..) 담당업무(사원정보) 최종직위(사원정보) 퇴직사유(CareerVo), 회사번호(회사정보)
		//증명서번호, 증명서구분=재직, CEO 정보, 증명서 등록일(SYSDATE)
		
		//int empSeq = request.getParameter("emp")
		//Employee emp = (Employee) request.getSession().getAttribute("retiredEmp");
		int retireSeq = Integer.parseInt(request.getParameter("empSeq"));
		int empPositionCode = Integer.parseInt(request.getParameter("positionCode"));
		int empDeptCode = Integer.parseInt(request.getParameter("deptCode"));
		String reason = "-";
			
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		//"selectOneLevaingFirst"
		
		//int requestCnt = Integer.parseInt(request.getParameter("requestCount")); //신청매수
		
		CrtfcVo cv = new CrtfcVo();
		
		cv.setCompanyNo(loginUser.getCompanyNo());
		cv.setEmpNoSeq(retireSeq);
		//cv.setEmpNoSeq(emp.getEmpNoSeq());
		cv.setEmpPositionCode(empPositionCode);
		cv.setEmpDeptCode(empDeptCode);
		//cv.setIssueReason(reason);
		cv.setIssueEmpNo(loginUser.getEmpNoSeq());
		cv.setCrtfcType("퇴직");
		
		CrtfcVo crtfcNo = cs.selectCrtfcInfo(cv);
		
		cv.setCrtfcNo(crtfcNo.getCrtfcNo());
		
		try {
			CrtfcVo crtfc = cs.requestLeaving(cv);
			request.setAttribute("crtfc", crtfc);
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			request.setAttribute("msg", "증명서 발급 실패");
			return "common/errorPage";
		}
		
		request.getSession().removeAttribute("retiredEmp");
		//db에 저장.
		return "paper/leavingAccept";
	}
	
	@RequestMapping("/selectList.cr")
	public String selectList(HttpServletRequest request, HttpServletResponse response) {
		
		//////////////테스트용 로그인///////////////////
//		Employee loginUser = cs.tempUser();
//		request.getSession().setAttribute("loginUser", loginUser);
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		int companyNo = emp.getCompanyNo();
		//int companyNo = 1001;
				
		String selectKind = "all";
		
		if(request.getParameter("kind") != null) {
			selectKind = request.getParameter("kind");
		}
		
		int currentPage = 1;
		int limits = 20;
		
		if(request.getParameter("currentPage") != null) {	
			String str = request.getParameter("currentPage");
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//currentPage = 3;
		
		ArrayList<CrtfcVo> list = null;
		int listCount = 0;
		
		SearchCondition sc = new SearchCondition();
		sc.setCompanyNo(companyNo);
		try {
			switch(selectKind) {
			case "all":
				listCount = cs.selectListCount(sc);
//				listCount = cs.selectListCount(companyNo);
//				list = cs.selectList(companyNo);
				break;
			case "career":
				//sc.setCrtfcNo(1);
				sc.setCrtfcType("경력");
				listCount = cs.selectSpecificListCount(sc);
//				listCount = cs.selectCarrerListCount(companyNo);
//				list = cs.selectCarrerList(companyNo);
				break;
			case "employment":
				//sc.setCrtfcNo(2);
				sc.setCrtfcType("재직");
				listCount = cs.selectSpecificListCount(sc);
//				listCount = cs.selectEmploymentListCount(companyNo);
//				list = cs.selectEmploymentList(companyNo);
				break;
			case "leaving":
				//sc.setCrtfcNo(3);
				sc.setCrtfcType("퇴직");
				listCount = cs.selectSpecificListCount(sc);
//				listCount = cs.selectLeavingListCount(companyNo);
//				list = cs.selectLeavingList(companyNo);
				break;
			}
			
			int totalCount = listCount;
			int btnCount = 10;
			
			PageInfo pi = Inst().getPageInfo(limits, currentPage, totalCount, btnCount);
			
			if(selectKind.equals("all")) {				
				list = cs.selectList(sc, pi);
			} else {
				list = cs.selectSpecificList(sc, pi);
			}
			
			request.setAttribute("list", list);
			request.setAttribute("crtfcKind", selectKind);
			request.setAttribute("pi", pi);
			
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "증명서 목록 페이지 불러오기 실패.");
			return "common/errorPage";
		}
		
		return "paper/paperRequestList";
	}
	
	@RequestMapping("/selectOne.cr")
	public String selectOneCrtfc(HttpServletRequest request, HttpServletResponse response) {		
		
		int crtfcSeq = Integer.parseInt(request.getParameter("num"));
		//String crtfcStatus = request.getParameter("crtfcStatus");
		//int requestEmpNo = Integer.parseInt(request.getParameter("requestEmp"));		
		
		//////////////테스트용 로그인///////////////////
		//Employee loginUser = cs.tempUser();
		//request.getSession().setAttribute("loginUser", loginUser);
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
//		Employee emp = cs.tempUser();			 
//		request.getSession().setAttribute("loginUser", emp);
		
		try {
			
			/* selectOneCrtfcDetailBefore */			
			CrtfcVo cv = cs.selectOneCrtfc(crtfcSeq);
			
			CrtfcVo crtfc = null;
			if(cv.getProcessStatus().equals("Y")) {
				crtfc = cs.selectOneCrtfcDetail(crtfcSeq);
			} else {
				cv.setIssueEmpSeq(emp.getEmpNoSeq());
				crtfc = cs.selectOneBefore(cv);
			}
			
			String path = "paper/";
			
//			if(kind.equals("재직")) {
//				path += "employment";
//			} else if(kind.equals("경력")) {
//				path += "career";
//			}
			
			String kind = request.getParameter("pageType");
			switch(crtfc.getCrtfcType()) {
			case "경력":
				path += "careerAccept";
				break;
			case "재직":
				path += "employmentAccept";
				break;
			case "퇴직":
				path += "leavingAccept";
				break;
			}
			//selectOneCrtfcDetail
			Employee requestor = cs.selectRequestor(crtfc.getEmpNoSeq());
			
			java.sql.Date date = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
			
			crtfc.setIssueDate(date);
			
			request.setAttribute("crtfc", crtfc);
			/* request.setAttribute("requestor", requestor); */
			
			return path;
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "증명서 선택 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("/accept.cr")
	public String crtfAccept(HttpServletRequest request, HttpServletResponse response) {
				
		int crtfcSeq = Integer.parseInt(request.getParameter("crtfcSeq"));
//		ISSUE_EMP_NO	NUMBER	Yes		4	발급자사원번호
//		ISSUE_DATE	DATE	Yes		5	발급일자
//		ISSUE_REASON	VARCHAR2(300 BYTE)	No		6	발급사유
//		PROCESS_STATUS	VARCHAR2(5 BYTE)	No		7	처리상태
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		try {
			CrtfcVo crtfc = null;
			if(crtfcSeq > 0) {
				crtfc = cs.selectOneCrtfc(crtfcSeq);
			} else {
				crtfc = new CrtfcVo();
				int empSeq = Integer.parseInt(request.getParameter("empSeq"));
				int positionCode = Integer.parseInt(request.getParameter("empPositionCode"));
				int deptCode = Integer.parseInt(request.getParameter("deptCode"));
				crtfc.setEmpNoSeq(empSeq);
				crtfc.setApplyDate(new java.sql.Date(new GregorianCalendar().getTimeInMillis()));
				crtfc.setProcessStatus("Y");
				crtfc.setCompanyNo(emp.getCompanyNo());				
				crtfc.setCrtfcType("퇴직");
				//crtfc.setCrtfcNo(3);
				crtfc.setIssueReason("-");
				crtfc.setEmpPositionCode(positionCode);
				crtfc.setEmpDeptCode(deptCode);
				
				CrtfcVo crtfcNo = cs.selectCrtfcInfo(crtfc);				
				crtfc.setCrtfcNo(crtfcNo.getCrtfcNo());
				
				/*<insert id="insertReWriteCrtfc">
				INSERT INTO CRTFC_HISTORY 
				VALUES(CRTFC_SEQ.NEXTVAL, 
				       #{empNoSeq}, 
				       #{applyDate}, 
				       #{issueEmpNo}, 
				       SYSDATE, 
				       #{issueReason}, 
				       'Y', 
				       #{companyNo}, 
				       #{crtfcNo})
					</insert>*/
			}
			
			crtfc.setIssueEmpNo(emp.getEmpNoSeq());		
			//request.getSession().setAttribute("loginUser", emp);
			
			if(crtfc.getProcessStatus().equals("Y") || crtfc.getProcessStatus().equals("y")) {
				//insert
				cs.insertLeaving(crtfc);
				//cs.insertReWritecrtfc(crtfc);
			} else {				
				//update
				cs.updateCrtfc(crtfc);
			}
			
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			request.setAttribute("msg", "증명서 발급 실패");
			return "common/errorPage";
		}
		
		//return "paper/paperRequestList";
		//return "/selectList.cr";
		return "redirect:selectList.cr";
		//return "forward:selectList.cr";
	}
	
	//@RequestMapping("/leavingAccept.cr")
	
	@RequestMapping("/updateCancle.cr")
	public String crtfCancle(HttpServletRequest request, HttpServletResponse response) {
				
		int crtfcSeq = Integer.parseInt(request.getParameter("crtfcSeq"));
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		try {
			CrtfcVo crtfc = null;
			if(crtfcSeq > 0) {
				crtfc = cs.selectOneCrtfc(crtfcSeq);
			} else {
				crtfc = new CrtfcVo();
				int empSeq = Integer.parseInt(request.getParameter("empSeq"));
				int positionCode = Integer.parseInt(request.getParameter("empPositionCode"));
				int deptCode = Integer.parseInt(request.getParameter("deptCode"));
				crtfc.setEmpNoSeq(empSeq);
				crtfc.setApplyDate(new java.sql.Date(new GregorianCalendar().getTimeInMillis()));
				crtfc.setProcessStatus("D");
				crtfc.setCompanyNo(emp.getCompanyNo());				
				crtfc.setCrtfcType("퇴직");
				//crtfc.setCrtfcNo(3);
				crtfc.setIssueReason("-");
				crtfc.setEmpPositionCode(positionCode);
				crtfc.setEmpDeptCode(deptCode);
				
				CrtfcVo crtfcNo = cs.selectCrtfcInfo(crtfc);				
				crtfc.setCrtfcNo(crtfcNo.getCrtfcNo());
				
				/*<insert id="insertReWriteCrtfc">
				INSERT INTO CRTFC_HISTORY 
				VALUES(CRTFC_SEQ.NEXTVAL, 
				       #{empNoSeq}, 
				       #{applyDate}, 
				       #{issueEmpNo}, 
				       SYSDATE, 
				       #{issueReason}, 
				       'Y', 
				       #{companyNo}, 
				       #{crtfcNo})
					</insert>*/
			}
			
			crtfc.setIssueEmpNo(emp.getEmpNoSeq());		
			//request.getSession().setAttribute("loginUser", emp);
			
			if(crtfc.getProcessStatus().equals("D") || crtfc.getProcessStatus().equals("d")) {
				//insert
				cs.insertLeavingCancle(crtfc);
				//cs.insertReWritecrtfc(crtfc);
			} else {				
				//update
				cs.updateCrtfcCancle(crtfc);
			}
			
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", "목록 불러오기 실패");
			return "common/errorPage";
		}
		
		//return "paper/paperRequestList";
		//return "/selectList.cr";
		return "redirect:selectList.cr";
		//return "forward:selectList.cr";
	}
	
	@RequestMapping("/selectListEmp.cr")
	public String selectListEmp(HttpServletRequest request, HttpServletResponse response) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		int companyNo = emp.getCompanyNo();
		String selectKind = "all";
		
		if(request.getParameter("kind") != null) {
			selectKind = request.getParameter("kind");
		}
		
		int currentPage = 1;
		int limits = 20;
		
		if(request.getParameter("currentPage") != null) {	
			String str = request.getParameter("currentPage");
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ArrayList<CrtfcVo> list = null;
		int listCount = 0;
		
		SearchCondition sc = new SearchCondition();
		sc.setCompanyNo(companyNo);
		sc.setEmpNoSeq(emp.getEmpNoSeq());
		
		try {
			switch(selectKind) {
			case "all":
				listCount = cs.selectListCountEmp(sc);
				break;
			case "career":
				sc.setCrtfcType("경력");
				listCount = cs.selectSpecificListCountEmp(sc);
				//listCount = cs.selectSpecificListCount(sc);
				break;
			case "employment":
				sc.setCrtfcType("재직");
				listCount = cs.selectSpecificListCountEmp(sc);
				break;
			case "leaving":
				sc.setCrtfcType("퇴직");
				listCount = cs.selectSpecificListCountEmp(sc);
				break;
			}
			
			int totalCount = listCount;
			int btnCount = 10;
			
			PageInfo pi = Inst().getPageInfo(limits, currentPage, totalCount, btnCount);
			
			if(selectKind.equals("all")) {
				list = cs.selectListEmp(sc, pi);
			} else {
				list = cs.selectSpecificListEmp(sc, pi);
			}
			
			request.setAttribute("list", list);
			request.setAttribute("crtfcKind", selectKind);
			request.setAttribute("pi", pi);
			
		} catch (CrtfcException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			request.setAttribute("msg", "내 증명서 목록 불러오기 실패");
			return "common/errorPage";
		}
		
		return "paper/paperRequestListEmp";
	}
	
}
