package com.kh.insane.company.controller;


import static com.kh.insane.common.CustomUtil.Inst;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.insane.common.CommonUtils;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.company.model.exception.FailedCreateAccount;
import com.kh.insane.company.model.exception.FailedDeleteCodeException;
import com.kh.insane.company.model.exception.FailedInsertCompanyBasicInfoException;
import com.kh.insane.company.model.exception.FailedSearchUpjongCodeException;
import com.kh.insane.company.model.exception.FailedUpdateAccountStatusException;
import com.kh.insane.company.model.exception.FailedUpdateBasicInfoException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.company.model.exception.FailedUpdateManagerInfoException;
import com.kh.insane.company.model.exception.FailedUpdateStartPasswordException;
import com.kh.insane.company.model.exception.FailedUploadAdditionalInfoException;
import com.kh.insane.company.model.service.CompanyService;
import com.kh.insane.company.model.vo.CommonCode;
import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.company.model.vo.CompanyInfo;
import com.kh.insane.company.model.vo.Upjong;
import com.kh.insane.company.model.vo.Validator;
import com.kh.insane.employee.model.exception.LoginFailedException;
import com.kh.insane.employee.model.service.EmployeeService;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.vo.Department;

/**
 * Class : CompanyController
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.25
 * @apiNote 회사의 계정과 회사의  프로필을 관리하는 컨트롤러
 */

@Controller
public class CompanyController {

	@Autowired
	private CompanyService ccs;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	EmployeeService es;
	

	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @param ca 뷰로 부터 받아온 생성할 계정의 정보
	 * @see 회사 정보를 받아 생성하는 컨트롤러
	 */
	@RequestMapping(value = "insertCompany.cp")
	public String insertCompany(Model model, CompanyAccount ca) {
		

		ca.setCadminPwd(passwordEncoder.encode(ca.getCadminPwd()));

		int result = ccs.insertCompany(ca);

		if (result > 0) {

			return "main/login";
		} else {
			model.addAttribute("msg", "회원 가입 실패!");
			return "common/errorPage";

		}
	}

	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @see 회사 내 사원 계정을 생성하는 컨트롤러
	 */
	@RequestMapping(value = "createAccount.cp")

	public String createAccount(Model model, HttpServletResponse response, HttpSession session) {
		
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		 
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		
		try {
			 ccs.createAccount(companyNo);
			 return "redirect:showAccount.cp";
			

		} catch (FailedCreateAccount e) {
			model.addAttribute("msg",e.getMessage());
			return  "common/errorPage";
		} 
		
			
	}

	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @see 회사 내 사원 계정을 전부 조회하는 컨트롤러
	 */
	@RequestMapping(value = "showAccount.cp")
	public String showAccountList(Model model, HttpSession session) {

		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		 
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		
		ArrayList<Employee> accountList = ccs.showAllAccountForMyCompany(companyNo);
			model.addAttribute("accountList", accountList);
			boolean needSetting = ccs.needBeginningPwd(companyNo);
			model.addAttribute("needSetting", needSetting);
			return "adminSetting/companyInfo/createEmpAccount";
		

	}
	
	/**
	 * @author 고종현
	 * @see 사원 계정의 활성화 상태를 업데이트 하는 컨트롤러
	 */
	@RequestMapping(value = "updateAccountStatus.cp")
	 public void updateAccountStatus(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String account = request.getParameter("account");
		String status = request.getParameter("status");
		
		String msg = "";
	
			try {
				ccs.updateAccountStatus(account,status,companyNo);
				msg = "true";
			} catch (FailedUpdateAccountStatusException e) {
				msg="false";
				e.printStackTrace();
			} finally {
				try {
					response.getWriter().print(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	}
	
	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @see 회사의  기초 정보 페이지에 기존 정보를 로드 받아 전송하는 컨트롤러
	 */
	@RequestMapping(value = "basicInfo.cp")
	public String moveBasicInfoForm(Model model, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String[] columns = new String[] { "CORP_PERS", "REPRESENT_LOCAL_FOREIGN" };
		CompanyInfo companyInfo = ccs.loadBasicInfo(companyNo);
		HashMap<String, ArrayList<CommonCode>> codeMap = ccs.loadCommonCodes(columns);
		model.addAttribute("codeMap", codeMap);
		model.addAttribute("companyInfo", companyInfo);

		return "adminSetting/companyInfo/basicInfo";
	}

	/**
	 * @author 고종현
	 * @param keyword 클라이언트가 입력한 검색어
	 * @return 전송할 뷰 페이지 주소
	 * @see 업종코드를 검색하는 컨트롤러
	 */
	@RequestMapping(value = "searchUpjongList.cp")
	public String searchUpjongList(Model model, @RequestParam("keyword") String keyword) {

		ArrayList<Upjong> upjongList = null;
		try {
			upjongList = ccs.searchUpjongList(keyword);
			model.addAttribute("keyword", keyword);
			model.addAttribute("upjongList", upjongList);
			return "adminSetting/companyInfo/upjongPop";

		} catch (FailedSearchUpjongCodeException e) {
			model.addAttribute("status", e.getMessage());

			return "adminSetting/companyInfo/upjongPop";
		}

	}
	
	
	
	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @see 업총 코드 팝업의 최초 메세지를 전송하는 컨트롤러
	 */
	@RequestMapping(value = "showUpjongPop.cp")
	public String showUpjongPop(Model model) {

		model.addAttribute("status", "검색어를 입력해주세요.");
		return "adminSetting/companyInfo/upjongPop";
	}
	
	/**
	 * @author 고종현
	 * @param queryString 뷰페이지의 폼의 모든 정보를 직렬화 처리로 가져온 쿼리스트링
	 * @see 회사의 입력된 기초정보가 유효한지 확인하는 컨트롤러
	 */
	@RequestMapping(value = "validateBasicInfo", produces = "application/text; charset=utf8")
	public void validateBasicInfo(Model model, @RequestParam("queryString") String queryString,
			HttpServletResponse response) {
		String[] query = queryString.split("&");
		Validator validator = new Validator();
		String[] check = new String[query.length];
		for (int i = 0; i < query.length; i++) {

			check[i] = query[i].substring(query[i].lastIndexOf("=") + 1);

		}
		String result = "1";

		// 개업년월일 유효 확인
		try {
			if (check[23].equals("") || (new SimpleDateFormat("yyyy-MM-dd").parse(check[23]).after(new Date()))) {
				result = "2";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// 업종코드 공백인지 혹은 이상한 값이 있는지 확인
		if (check[22].equals("") || !validator.isNumeric(check[22])) {
			result = "3";
		}

		// 사업장 전화번호가 유효한지 확인
		if (check[16].equals("") || check[17].equals("") || check[18].equals("")) {
			result = "4";
		} else {
			if (!validator.isPhone(check[16] + check[17] + check[18])) {
				result = "5";
			}
		}
		// 법정동 코드가 공백이거나 숫자가 아닐 경우가 있는지 확인
		if (check[15].equals("")) {
			result = "6";
		}

		// 사업장 주소가 공백인지 확인
		if (check[13].equals("") || check[14].equals("")) {
			result = "7";
		}

		// 대표 내/외국인 구분이 비었는지 확인
		if (check[12].equals("")) {
			result = "8";
		}

		// 대표자 주민등록번호가 유효한지 확인
		if (check[10].equals("") || check[11].equals("")) {
			result = "9";
		} else {
			if (!validator.isPersonalID(check[10] + "-" + check[11])) {
				result = "10";
			}
		}

		// 대표장 명이 공백인지 확인
		if (check[9].equals("")) {
			result = "11";
		}

		// 만약 법인 구분이 법인이라면 법인번호가 유효한지 화인
		if (check[2].equals("101")) {
			if (check[6].equals("") || check[7].equals("") || check[8].equals("")) {

				result = "12";
			} else {
				if (!validator.isCorporateRegistNo(check[6] + check[7] + check[8])) {
					result = "13";
				}
			}
		}

		// 만약 법인 구분이 개인이라면 사업자번호가 유효한지 확인
		if (check[2].equals("102")) {
			if (check[3].equals("") || check[4].equals("") || check[5].equals("")) {
				result = "14";
			} else {

				if (!validator.isBusinessLicense(check[3] + check[4] + check[5])) {
					result = "15";
				}
			}
		}
		// 법인 구분이 공백인지 확인한다. if(check[2].equals("")) { result = "법인 구분을 선택하세요"; }
		if (check[2].equals("")) {
			result = "16";
		}

		// 회사명이 공백인지 확인한다.

		if (check[1].equals("") || check[1].equals(" ")) {
			result = "17";
		}

		// 입력된 인사년도가 현재 년도보다 숫자가 낮은지 조회하고 혹은 null인지 숫자가 아닌 형식인지 확인한다.
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		int nowYear = Integer.parseInt(format.format(today) + "");
		

		if (check[0].equals("") || !validator.isNumeric(check[0]) || (Integer.parseInt(check[0]) < nowYear)) {
			result = "18";
		}

		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	/**
	 * @author 고종현
	 * @param  request 뷰에서 가져온 요청정보
	 * @return 전송할 뷰 페이지 주소
	 * @see 유효성 검사가 통과한 정보를 db로 전송하는 컨트롤러
	 */
	@RequestMapping(value = "insertCompanyInfo.cp")
	public String insertCompanyInfo(Model model, HttpServletRequest request, HttpSession session) {
		
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();

		String hrYear = Validator.isBlank(request.getParameter("hrYear"));
		String corpPers = Validator.isBlank(request.getParameter("corpPers"));
		String businessLicenseNo = "";
		String corparateRegistNo = "";
		if (corpPers.equals("102")) {
			businessLicenseNo = Validator.isBlank(request.getParameter("businessLicenseNo1") + "-"
					+ request.getParameter("businessLicenseNo2") + "-" + request.getParameter("businessLicenseNo3"));
			corparateRegistNo = null;
		} else if (corpPers.equals("101")) {
			corparateRegistNo = request.getParameter("corparateRegistNo1") + "-"
					+ request.getParameter("corparateRegistNo2") + "-" + request.getParameter("corparateRegistNo3");
			businessLicenseNo = null;
		}
		String representName = request.getParameter("representName");
		String representResidentNo = request.getParameter("representResidentNo1") + "-"
				+ request.getParameter("representResidentNo2");
		String representLocalForegin = request.getParameter("representLocalForegin");
		String businessAddress = request.getParameter("businessAddress1") + "$"
				+ request.getParameter("businessAddress2");
		String beobJeongCode = request.getParameter("beobJeongCode");
		String businessTel = request.getParameter("businessTel1") + "-" + request.getParameter("businessTel2") + "-"
				+ request.getParameter("businessTel3");
		String businessFax = null;
		if (!request.getParameter("businessFax1").equals("") && !request.getParameter("businessFax2").equals("")
				&& !request.getParameter("businessFax3").equals("")) {
			businessFax = request.getParameter("businessFax1") + "-" + request.getParameter("businessFax2") + "-"
					+ request.getParameter("businessFax3");
		}
		String businessTypeCode = request.getParameter("businessTypeCode");
		String businessOpenDate = request.getParameter("businessOpenDate");
		String businessEndDate = request.getParameter("businessEndDate");

		CompanyInfo info = new CompanyInfo(companyNo, hrYear, corpPers, businessLicenseNo, corparateRegistNo,
				representName, representResidentNo, representLocalForegin, businessAddress, beobJeongCode, businessTel,
				businessFax, businessTypeCode, businessOpenDate, businessEndDate, "Y");

		try {
			ccs.insertCompanyBasicInfo(info);
			CompanyAccount loginUser = (CompanyAccount)session.getAttribute("loginUser");
			loginUser.setCompanyStatus("Y");
			session.setAttribute("loginUser", loginUser);
			return "redirect:basicInfo.cp";

		} catch (FailedInsertCompanyBasicInfoException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	/**
	 * @author 고종현
	 * @param  request 뷰에서 가져온 요청정보
	 * @return 전송할 뷰 페이지 주소
	 * @see 유효성 검사가 된 수정된  회사 기초정보를 db로 전송하는 컨트롤러 
	 */
	@RequestMapping(value = "updateBasicInfo.cp")
	public String updateCompanyBasicInfo(Model model, HttpServletRequest request, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();

		String hrYear = Validator.isBlank(request.getParameter("hrYear"));
		String corpPers = Validator.isBlank(request.getParameter("corpPers"));
		String businessLicenseNo = "";
		String corparateRegistNo = "";
		if (corpPers.equals("1")) {
			businessLicenseNo = Validator.isBlank(request.getParameter("businessLicenseNo1") + "-"
					+ request.getParameter("businessLicenseNo2") + "-" + request.getParameter("businessLicenseNo3"));
			corparateRegistNo = null;
		} else if (corpPers.equals("0")) {
			corparateRegistNo = request.getParameter("corparateRegistNo1") + "-"
					+ request.getParameter("corparateRegistNo2") + "-" + request.getParameter("corparateRegistNo3");
			businessLicenseNo = null;
		}
		String representName = request.getParameter("representName");
		String representResidentNo = request.getParameter("representResidentNo1") + "-"
				+ request.getParameter("representResidentNo2");
		String representLocalForegin = request.getParameter("representLocalForegin");
		String businessAddress = request.getParameter("businessAddress1") + "$"
				+ request.getParameter("businessAddress2");
		String beobJeongCode = request.getParameter("beobJeongCode");
		String businessTel = request.getParameter("businessTel1") + "-" + request.getParameter("businessTel2") + "-"
				+ request.getParameter("businessTel3");
		String businessFax = null;
		if (!request.getParameter("businessFax1").equals("") && !request.getParameter("businessFax2").equals("")
				&& !request.getParameter("businessFax3").equals("")) {
			businessFax = request.getParameter("businessFax1") + "-" + request.getParameter("businessFax2") + "-"
					+ request.getParameter("businessFax3");
		}
		String businessTypeCode = request.getParameter("businessTypeCode");
		String businessOpenDate = request.getParameter("businessOpenDate");
		String businessEndDate = request.getParameter("businessEndDate");

		CompanyInfo info = new CompanyInfo(companyNo, hrYear, corpPers, businessLicenseNo, corparateRegistNo,
				representName, representResidentNo, representLocalForegin, businessAddress, beobJeongCode, businessTel,
				businessFax, businessTypeCode, businessOpenDate, businessEndDate, "Y");

		try {
			ccs.updateBasicInfo(info);
			return "redirect:basicInfo.cp";
		} catch (FailedUpdateBasicInfoException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}

	@RequestMapping(value = "imsiCreate.cp")
	public String createCompany() {
		return "main/createCompany";
	}

	
	
	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @see 기존에 작성된 회사 추가 정보가 있는지 확인하여 회사 추가 정보 입력 페이지로 전송하는 컨트롤러 
	 */
	@RequestMapping(value = "additionalInfo.cp")
	public String moveAdditionalInfo(Model model, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String[] columns = new String[] { "CORP_TYPE", "SMALL_BUSINESS_YN", "NON_SMALL_TYPE", "COMPANY_TYPE",
				"TAXATION_TYPE", "INCOME_CLASSIFICATION", "REPRESENT_TYPE", "JOINT_OFFICE_YN", "MAIN_RESIDENT_TYPE" };
		HashMap<String, ArrayList<CommonCode>> codeMap = ccs.loadCommonCodes(columns);
		
		CompanyInfo additionalInfo = ccs.loadAdditionalInfo(companyNo);
		
		model.addAttribute("additionalInfo",additionalInfo);
		model.addAttribute("codeMap", codeMap);
		return "adminSetting/companyInfo/additionalInfo";
	}
	
	/**
	 * @author 고종현
	 * @param  request 뷰에서 가져온 요청정보
	 * @param  updateInfo 업데이트 될 회사 정보
	 * @param  photo 업데이트 될 회사 로고 사진
	 * @return 전송할 뷰 페이지 주소
	 * @see 유효성 검사가 된 수정된  회사 추가 정보를 DB로 전송하는 컨트롤러
	 */
	@RequestMapping(value = "updateAdditionalInfo.cp")
	public String updateAdditionalInfo(Model model, CompanyInfo updateInfo, HttpServletRequest request,
			MultipartFile photo, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		updateInfo.setCompanyNo(companyNo);
		
		
		String mainResidentNo1 = request.getParameter("mainResidentNo1");
		String mainResidentNo2 = request.getParameter("mainResidentNo2");
		updateInfo.setMainResidentNo(mainResidentNo1 + "-" + mainResidentNo2);
		
		String root = request.getSession().getServletContext().getRealPath("resources");

		String originFileName = photo.getOriginalFilename();
		String filePath = "";
		String savePath = "";
		String ext="";
		String changeName = "";
		if (originFileName != null && !originFileName.equals("")) {
			 ext = originFileName.substring(originFileName.lastIndexOf("."));
			 changeName = CommonUtils.getRandomString();
			filePath = root + "/companyLogoImg";
			savePath =  "/resources/companyLogoImg/" + changeName + ext;
			try {
				photo.transferTo(new File(filePath + "/" + changeName + ext));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		updateInfo.setCompanyLogoImgPath(savePath);

		try {
			ccs.updateAdditionalInfo(updateInfo);
			return "redirect:additionalInfo.cp";
		} catch (FailedUploadAdditionalInfoException e) {
			new File(filePath + "/" + changeName + ext).delete();
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}

		
	}
	
	/**
	 * @author 고종현
	 * @param  representNo 뷰에서 가져온 대표자 주민등록번호
	 * @return result 주민등록 번호 유효성 여부
	 * @see 회사 대표자 주민등록번호가 올바른 형식인지 유효성 검사하는 컨트롤러
	 */
	@RequestMapping(value = "validateAdditionalInfo.cp")
	public void validateAdditionalInfo(Model model, @RequestParam("representNo") String representNo,
			HttpServletResponse response) {

		String result = "2";
		
		if (new Validator().isPersonalID(representNo)) {
			result = "1";
		}
		
		try {
			response.getWriter().print(result);
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @see 기존 회사 담당자 정보가 있는지 조회하여 회사 담당자 입력 페이지로 이동하는 컨트롤러
	 */
	@RequestMapping(value ="managerInfo.cp")
	public String moveManagerInfo(Model model, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		CompanyInfo managerInfo = ccs.loadManagerInfo(companyNo);
		model.addAttribute("managerInfo",managerInfo);
		
		return "adminSetting/companyInfo/managerInfo";
	}
	
	
	/**
	 * @author 고종현
	 * @return 전송할 뷰 페이지 주소
	 * @see 회사에 등록된 부서를 조회할 수 있는 팝업을 띄우는 컨트롤러
	 */
	@RequestMapping(value = "showDeptPop.cp")
	public String showDeptPop(Model model, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		ArrayList<Department> deptList = ccs.loadAllDeptList(companyNo);
		model.addAttribute("deptList", deptList);
		return "adminSetting/companyInfo/deptPop";
	}
	
	/**
	 * @author 고종현
	 * @param  queryString 뷰에서 가져올 폼의 정보를 직렬화 처리하여 가져온 정보
	 * @return result 유효성 검사 결과 여부
	 * @see 클라이언트가 입력한 담당자 정보가 유효한지 확인하는 컨트롤러
	 */
	@RequestMapping(value = "validateMangerInfo.cp")
	public void validateManagerInfo (Model model, @RequestParam("queryString") String queryString,
			HttpServletResponse response) {
		String[] query = queryString.split("&");
		Validator validator = new Validator();
		String[] check = new String[query.length];
		for (int i = 0; i < query.length; i++) {

			
			check[i] = query[i].substring(query[i].lastIndexOf("=") + 1);
			if(check[i].equals("") || check[i] == null) {
				check[i] = "null"; 
			}

		}
		String result = "1";
		
		String phone="";
		for(int i=2; i<=4; i++) {
			if(check[i].equals("null")) {
				continue;
			}
		
				phone+=check[i];
			
		}
		
		check[5] = check[5].replace("%40", "@");
		check[6] = check[6].replace("%40", "@");
		
		if(!phone.equals("") && !validator.isPhone(phone)) {
			result = "2";
		}
		
		if(!check[5].equals("null") && !validator.isEmail(check[5])) {
			result = "3";
		}
		
		if(!check[6].equals("null") && !validator.isEmail(check[6])) {
			result = "4";
		}
		
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author 고종현
	 * @param  updateInfo 클라이언트가 입력한 담당자 정보
	 * @return 전송할 뷰 페이지 주소
	 * @see 유효성 검사가 통과된 수정된 매니저 정보를 db로 전송하는 컨트롤러
	 */
	@RequestMapping(value="updateManagerInfo.cp")
	public String updateManagerInfo(Model model, CompanyInfo updateInfo, HttpServletRequest request, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		
		updateInfo.setCompanyNo(companyNo);
		String phone = request.getParameter("adminPhone1") + "-" + request.getParameter("adminPhone2") + "-" + request.getParameter("adminPhone3");
		updateInfo.setAdminPhone(phone);
		try {
			ccs.updateManagerInfo(updateInfo);
			return "redirect:managerInfo.cp";
		} catch (FailedUpdateManagerInfoException e) {
			model.addAttribute("msg",e.getMessage());
			
			return "common/errorPage";	
		}
	}
	
	/**
	 * @author 고종현
	 * @param  request 뷰에서 가져온 요청정보
	 * @return 비밀번호 유효성 부적합 결과 혹은 업데이트 성공 여부 결과
	 * @see 수정할 비밀번호를 클라이언트에게 받아 유효성검사후 업데이트 하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping(value = "updateStartPwd.cp")
	public void updateStartPwd(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		Validator validator = new Validator();
		int result = 1; // 비밀번호 불일치

		if (password1.equals(password2)) {

			if (!validator.isPassword(password1)) {
				result = 2;  //비밀번호 유효성 위반
			} else {
				HashMap<String, Object> updateInfo = new HashMap<>();
				updateInfo.put("companyNo", companyNo);
				updateInfo.put("password", password1);
				try {
					ccs.updateStartPassword(updateInfo);
					result = 4;  //햅격
				} catch (FailedUpdateStartPasswordException e) {
					result = 3;  // 에러
					e.printStackTrace();
				}
			}

		}
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 뷰페이지 주소
	 * @see 관리자 비밀번호  변경 화면 전 사원로그인을 진행하는 화면으로 전송해주는 컨트롤러
	 * @since 2020.09.04
	 */
	@RequestMapping(value="changeSystemPwdPop.cp")
	public String moveChangeSystemPwdPop(Model model, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		
		return "adminSetting/companyInfo/changeSystemPwdPop";
	}
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 뷰페이지 주소
	 * @see 로그인 한 사원계정이 관리자 비밀번호를 업데이트 할 수 있는지 권한을 확인하는 컨트롤러
	 * @since 2020.09.04
	 */
	
	@RequestMapping(value="changeSystemPwdLogin.cp")
	public void checkingLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Employee emp = new Employee();
		
		emp.setEmpNo(userId);
		emp.setEmpPwd(userPwd);
		emp.setCompanyNo(companyNo);
		int empSeq = 0;
	
		try {
			Employee loginUser =  es.loginEmployee(emp);
			empSeq = loginUser.getEmpNoSeq();
			HashSet<String> auth = ccs.loadMyAuth(loginUser);
			System.out.println(auth);
			if(auth.isEmpty() || !(auth.contains("AD1")) ) {
				empSeq = -1;
			}
		} catch (LoginFailedException e) {

			e.printStackTrace();
		} finally {
			try {
				response.getWriter().print(empSeq);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 뷰페이지 주소
	 * @see 사원 계정 확인후 관리자 계정 비밀번호 수정 페이지로 전송하는 컨트롤러
	 * @since 2020.09.04
	 */
	@RequestMapping(value="startChangeSystemPwd.cp")
	public String startChangeSystemPwd(Model model, HttpServletRequest request, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		
		String updator = request.getParameter("updator");
		model.addAttribute("updator",updator);
		return "adminSetting/companyInfo/changeSystemPwdPop2";
	}
	
	
	/**
	 * @author 고종현
	 * @param  beforePwd 이전 비밀번호 , newPwd 새로운 비밀번호
	 * @return 성공 에러 여부
	 * @see 변경할 비밀번호를 클라이언트에게 입력받아 데이터베이스에 전송하는 컨트롤러
	 * @since 2020.09.04
	 */
	@RequestMapping(value="updateSystemPwd.cp")
	public void updateSystemPwd(HttpServletRequest request , HttpServletResponse response, HttpSession session) {
		int companyNo = 0; // 얘는 고정
		
		// 세션값 생성시 변경
		String cadminId = ((CompanyAccount) session.getAttribute("loginUser")).getCadminId();
		
		Employee emp = new Employee();
		int result = 1;
		emp.setCompanyNo(companyNo);
		emp.setEmpNo(cadminId);
		emp.setEmpPwd(request.getParameter("beforePwd"));
		
		try {
			CompanyAccount ca = ccs.loginCompanyManager(emp);
			if(new Validator().isPassword(request.getParameter("newPwd"))) {
				ca.setCadminPwd(request.getParameter("newPwd"));
				try {
					ccs.updateSystemPwd(ca);
				} catch (FailedUpdateCodeException e) {
					result = e.getResult();
					e.printStackTrace();
				}	
				
			}else {
				result = 3;
			}
			
			
		} catch (LoginFailedException e) {
			e.printStackTrace();
			result = 2;
		} finally {
			try {
				response.getWriter().print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 회사 선택창에서 전체 리스트를 불러옴
		@RequestMapping(value = "selectAllList.cp")
		public String selectAllList(Model model, HttpServletRequest request) {
			// 페이징 처리 ArrayList<CompanyAccount> list = null;
			int listCount = ccs.selectAllListCount();
			int currentPage = 1;
			int limit = 10;

			if (request.getParameter("currentPage") != null) {
				String str = request.getParameter("currentPage");
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int btnCount = 10;

			PageInfo pi = Inst().getPageInfo(limit, currentPage, listCount, btnCount);
			
			ArrayList<CompanyAccount> list = ccs.selectList(pi);

//			List list = ccs.selectAllList();

			if (list != null) {

				request.setAttribute("list", list);
				request.setAttribute("pi", pi);

				return "common/companySearchResultList";
			} else {
				model.addAttribute("msg", "리스트 불러오기 실패");
				return "common/errorPage";
			}
		}

		// 회사 이름 검색
		@RequestMapping(value = "searchName.cp")
		public String searchNameList(@RequestParam("companyName") String compName, HttpServletRequest request) {

			List list = ccs.searchNameList(compName);

			request.setAttribute("list", list);
			return "common/companySearchResultList";

		}
		
		
		/**
		 * @author 고종현
		 * @param  companyNo :로그인 된 회사 번호
		 * @return 이동할 뷰페이지 주소
		 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
		 * @since 2020.09.09
		 */
		@RequestMapping(value="loadDeptAuth.cp")
		public String moveDeptAuth(HttpSession session, Model model) {
			int companyNo = ((CompanyAccount)session.getAttribute("loginUser")).getCompanyNo();
			ArrayList<Department> departmentList = ccs.loadAllDeptList(companyNo);
			ArrayList<HashMap<String,Object>> authList = ccs.loadAllAuth();
			ArrayList<HashMap<String,Object>> customList = ccs.showAllCustomAuthName(companyNo);
			model.addAttribute("customList",customList);
			model.addAttribute("departmentList", departmentList);
			model.addAttribute("authList", authList);
			
			
			
			return "adminSetting/authorSetting/authorSetting";
		}
		
		
		/**
		 * @author 고종현
		 * @param  companyNo :로그인 된 회사 번호
		 * @return 이동할 뷰페이지 주소
		 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
		 * @since 2020.09.09
		 */
		@RequestMapping(value="loadUsefulAuth.cp")
		public void loadUsefulAuth(HttpServletRequest request, HttpServletResponse response) {
			String type = request.getParameter("type");
			int seq = Integer.parseInt(request.getParameter("seq"));
			System.out.println(type+" "+seq);
			String usefulAuth = ccs.loadUsefulAuth(type,seq);
			
			try {
				response.getWriter().print(usefulAuth);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
			
		}
		
		
		/**
		 * @author 고종현
		 * @param  queryString 체크된 항목의 값 , type 권한을설정할 주체(계정,부서,커스텀) seq(권한을 설정할 주체의 고유번호), companyNo 로그인된 계정의 회사번호
		 * @return ajax : 성공 결과값
		 * @see  설정한 권한을 등록해주는 컨트롤러
		 * @since 2020.09.14
		 */
		@RequestMapping(value="updateAuth.cp")
		public void updateAuth(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			String queryString = request.getParameter("queryString");
			int seq = Integer.parseInt(request.getParameter("seq"));
			String type = request.getParameter("type");
			queryString = queryString.replaceAll("&", ",");
			queryString = queryString.replaceAll("authCode=","");
			int companyNo = ((CompanyAccount)session.getAttribute("loginUser")).getCompanyNo();
		
			HashMap<String,Object> auth = new HashMap<>();
			
			auth.put("authCode",queryString);
			auth.put("seq",seq);
			auth.put("companyNo",companyNo);
			int ajaxResult = 1;	
			try {
				ccs.updateAuth(auth,type);
			} catch (FailedUpdateCodeException e) {
				e.printStackTrace();
				ajaxResult = e.getResult();
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
		@RequestMapping(value="loadEmpAuth.cp")
		public String moveEmpAuth(HttpSession session, Model model) {
			int companyNo = ((CompanyAccount)session.getAttribute("loginUser")).getCompanyNo();
			ArrayList<Employee> empList;
		
				empList = ccs.showAllAccountForMyCompany(companyNo);
				ArrayList<HashMap<String,Object>> authList = ccs.loadAllAuth();
				ArrayList<HashMap<String,Object>> customList = ccs.showAllCustomAuthName(companyNo);
				
				model.addAttribute("customList",customList);
				model.addAttribute("empList", empList);
				model.addAttribute("authList", authList);
				
				return "adminSetting/authorSetting/authorSetting2";
			
			}
		
		
		/**
		 * @author 고종현
		 * @param  companyNo :로그인 된 회사 번호
		 * @return 이동할 뷰페이지 주소
		 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
		 * @since 2020.09.09
		 */
		@RequestMapping(value="loadCustomAuth.cp")
		public String moveCustomAuth(HttpSession session, Model model) {
			int companyNo = ((CompanyAccount)session.getAttribute("loginUser")).getCompanyNo();
			ArrayList<HashMap<String,Object>> customList = ccs.showAllCustomAuthName(companyNo);
			ArrayList<HashMap<String,Object>> authList = ccs.loadAllAuth();
			
			model.addAttribute("customList", customList);
			model.addAttribute("authList", authList);
			return "adminSetting/authorSetting/customAuthorSetting";
		}
		
		
		/**
		 * @author 고종현
		 * @param  companyNo :로그인 된 회사 번호
		 * @return 이동할 뷰페이지 주소
		 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
		 * @since 2020.09.09
		 */
		@RequestMapping(value="addCustomAuth.cp")
		public void insertCustomAuth(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
			int companyNo = ((CompanyAccount)session.getAttribute("loginUser")).getCompanyNo();
			String name = request.getParameter("name");
			
			HashMap<String, Object> customMap = new HashMap<>();
			customMap.put("name",name);
			customMap.put("companyNo",companyNo);
			int ajaxResult = 1;
			try {
				ccs.insertCustomAuth(customMap);
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
		@RequestMapping(value="deleteCustomCode.cp")
		public void deleteCustomCode(HttpServletRequest request, HttpServletResponse response){
			int customNumber = Integer.parseInt(request.getParameter("customNumber"));
			int ajaxResult = 1;
			try {
				ccs.deleteCustomCode(customNumber);
			} catch (FailedDeleteCodeException e) {
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
