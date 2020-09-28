package com.kh.insane.company.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.insane.company.model.exception.FailedInsertCodeException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.company.model.service.BasicCodeService;
import com.kh.insane.company.model.vo.CompanyAccount;


/**
 * Class : BasicCodeController
 * @author 고종현
 * @version 1.0.1
 * @since 2020.09.01
 * @implNote 회사의 기초 코드들을 관리하는  컨트롤러
 */
@Controller
public class BasicCodeController {

	@Autowired
	private BasicCodeService bcs;
	
	
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 페이지 주소
	 * @see  회사의 교육코드 정보를 조회하여 교육코드 페이지에 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("education.bc")
	public String moveEducationCode(Model model, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String codeType = "education";
		
		ArrayList<HashMap<String,String>> eduList = bcs.loadCodeList(companyNo,codeType);
		
		model.addAttribute("eduList",eduList);

		return "adminSetting/basicCode/educationCode";
	}
	
	
	
	/**
	 * @author 고종현
	 * @param  codeName 코드명 
	 * @throw FailedInsertCodeException  인서트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 입력한 교육코드를  전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("insertEduCode.bc")
	public void insertEduCode(Model model, @RequestParam("codeName") String codeName, HttpServletResponse response, HttpSession session) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String codeType = "education";
		HashMap<String,Object> insertInfo = new HashMap<>();
		insertInfo.put("companyNo",companyNo);
		insertInfo.put("codeName",codeName);
		int ajaxResult = 2;
		try {
			bcs.insertCode(codeType, insertInfo);
			ajaxResult = 1;
		} catch (FailedInsertCodeException e) {

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
	 * @param  status 수정할 상태 값  , code 수정할 코드 번호
	 * @throw FailedUpdateCodeException  코드 활성화 상태 업데이트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 업데이트 요청한 교육 코드 상태 값을 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("updateEduStatus.bc")
	public void updateEduStatus(Model model, @RequestParam("status") String status, @RequestParam("code") String code,
			HttpServletResponse response) {
		    String codeType = "education";
			HashMap<String, Object> statusMap = new HashMap<>();
		   	statusMap.put("status", status);
		   	statusMap.put("code", code);
		   	String result = "";
		   
				try {
					bcs.updateCode(codeType,statusMap);
					result = "1";
				} catch (FailedUpdateCodeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						response.getWriter().print(result);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			
	}
	
	
	
	/**
	 * @author 고종현
	 * @param  
	 * @return 이동할 페이지 주소
	 * @see  회사의 지역코드 정보를 조회하여 교육코드 페이지에 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("location.bc")
	public String moveLocationCode(Model model, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String codeType = "location";
		ArrayList<HashMap<String,String>> locationList = bcs.loadCodeList(companyNo,codeType);
		model.addAttribute("locationList",locationList);
		
		return "adminSetting/basicCode/locationCode";
	}
	
	
	
	/**
	 * @author 고종현
	 * @param  codeName 지역 명  address 상세주소
	 * @throw FailedInsertCodeException  인서트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 입력한 지역코드를  전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("insertLocationCode.bc")
	public void insertLocationCode(Model model, @RequestParam("codeName") String codeName,
			@RequestParam("address") String address, HttpServletResponse response, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
				
				String codeType = "location";
				int ajaxResult = 2;
				HashMap<String,Object> insertInfo = new HashMap<>();
				insertInfo.put("codeName",codeName);
				insertInfo.put("address",address);
				insertInfo.put("companyNo",companyNo);
				try {
					bcs.insertCode(codeType, insertInfo);
					ajaxResult = 1;
				} catch (FailedInsertCodeException e) {

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
	 * @param  status 수정할 상태 값  , code 수정할 코드 번호
	 * @throw FailedUpdateCodeException  코드 활성화 상태 업데이트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 업데이트 요청한 지역 코드 상태 값을 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("updateLocationStatus.bc")
	public void updateLocationStatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String codeType = "location";
		HashMap<String, Object> statusMap = new HashMap<>();
	   	statusMap.put("status", request.getParameter("status"));
	   	statusMap.put("code", request.getParameter("code"));
		
		int ajaxResult = 2;
		
			try {
				bcs.updateCode(codeType,statusMap);
				ajaxResult = 1;
			} catch (FailedUpdateCodeException e) {
				// TODO Auto-generated catch block
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
	 * @param  
	 * @return 이동할 페이지 주소
	 * @see  회사의 자격/면허코드 정보를 조회하여 교육코드 페이지에 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("license.bc")
	public String moveLicenseCode(Model model, HttpSession session) {
		
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String codeType = "license";		
		ArrayList<HashMap<String,String>> licenseList = bcs.loadCodeList(companyNo,codeType);
		model.addAttribute("licenseList",licenseList);
		
		
		return "adminSetting/basicCode/licenseCode";
	}
	
	
	
	/**
	 * @author 고종현
	 * @param  codeName 코드명  , amount 추가수당
	 * @throw FailedInsertCodeException  인서트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 입력한 자격/면허코드를  전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("insertLicenseCode.bc")
	public void insertLicenseCode(Model model, @RequestParam("codeName") String codeName,
			@RequestParam("amount") String amount, HttpServletResponse response, HttpSession session) {

		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String codeType = "license";

		HashMap<String, Object> insertInfo = new HashMap<>();
		insertInfo.put("codeName", codeName);
		insertInfo.put("amount", amount);
		insertInfo.put("companyNo", companyNo);
		int ajaxResult = 2;
		try {
			bcs.insertCode(codeType, insertInfo);
			ajaxResult = 1;
		} catch (FailedInsertCodeException e) {

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
	 * @param  status 수정할 상태 값  , code 수정할 코드 번호
	 * @throw FailedUpdateCodeException  코드 활성화 상태 업데이트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 업데이트 요청한 자격/면허코드 상태 값을 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("updateLicenseStatus.bc")
	public void updateLicenseStatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String codeType = "license";
		
		HashMap<String, Object> statusMap = new HashMap<>();
	   	statusMap.put("status", request.getParameter("status"));
	   	statusMap.put("code", request.getParameter("code"));
		
		int ajaxResult = 2;
		
			try {
				bcs.updateCode(codeType,statusMap);
				ajaxResult = 1;
			} catch (FailedUpdateCodeException e) {
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
	 * @param  
	 * @return 이동할 페이지 주소
	 * @see  회사의 직책코드 정보를 조회하여 교육코드 페이지에 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("rspofc.bc")
	public String moveRspofcCode(Model model, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		//세션 적용 시 수정할 것
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String codeType = "rspofc";		
		ArrayList<HashMap<String,String>> rspofcList = bcs.loadCodeList(companyNo,codeType);
		model.addAttribute("rspofcList",rspofcList);
		
		
		return "adminSetting/basicCode/rspofcCode";
	}
	
	
	
	/**
	 * @author 고종현
	 * @param  codeName 직책 명 
	 * @throw FailedInsertCodeException  인서트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 입력한 직책코드를  전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("insertRspofcCode.bc")
	public void insertRspofcCode(Model model, @RequestParam("codeName") String codeName,
			 HttpServletResponse response, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String codeType = "rspofc";

		HashMap<String, Object> insertInfo = new HashMap<>();
		insertInfo.put("codeName", codeName);
		insertInfo.put("companyNo", companyNo);
		int ajaxResult = 2;
		try {
			bcs.insertCode(codeType, insertInfo);
			ajaxResult = 1;
		} catch (FailedInsertCodeException e) {

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
	 * @param  status 수정할 상태 값  , code 수정할 코드 번호
	 * @throw FailedUpdateCodeException  코드 활성화 상태 업데이트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 업데이트 요청한 직책 코드 상태 값을 전송하는 컨트롤러
	 * @since 2020.09.02
	 */
	@RequestMapping("updateRspofcStatus.bc")
	public void updateRspofcStatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String codeType = "rspofc";
		
		HashMap<String, Object> statusMap = new HashMap<>();
	   	statusMap.put("status", request.getParameter("status"));
	   	statusMap.put("code", request.getParameter("code"));
		
	  
		int ajaxResult = 0;
		
			try {
				bcs.updateCode(codeType,statusMap);
				ajaxResult = 1;
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
	 * @param  
	 * @return 이동할 페이지 주소
	 * @see  회사의 호봉코드 정보를 조회하여 호봉코드 페이지에 전송하는 컨트롤러
	 * @since 2020.09.03
	 */
	@RequestMapping("payStep.bc")
	public String movePayStepCode(Model model, HttpSession session) {
		
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}	
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		String codeType = "payStep";		
		ArrayList<HashMap<String,String>> payStepList = bcs.loadCodeList(companyNo,codeType);
		int realMax = bcs.findRealMax(companyNo);
		model.addAttribute("realMax",realMax);
		model.addAttribute("payStepList",payStepList);
		
		
		return "adminSetting/basicCode/payStepCode";
	}
	
	
	/**
	 * @author 고종현
	 * @param  
	 * @throw FailedInsertCodeException  인서트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  새로 추가될 호봉코드를 디비상에 있는 최대값을 찾아 +1 확장된 코드를  전송하는 컨트롤러
	 * @since 2020.09.03
	 */
	@RequestMapping("insertPayStepCode.bc")
	public void insertPayStepCode(Model model, HttpServletResponse response, HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String codeType = "payStep";
		
		int codeName = bcs.findMaxPayStep(companyNo) + 1;
		
		System.out.println(codeName);
			
		HashMap<String, Object> insertInfo = new HashMap<>();
		insertInfo.put("codeName", codeName);
		insertInfo.put("companyNo", companyNo);
		int ajaxResult = 2;
		try {
			bcs.insertCode(codeType, insertInfo);
			ajaxResult = 1;
		} catch (FailedInsertCodeException e) {

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
	 * @param maximum 설정할 호봉의 최대치
	 * @throw FailedUpdateCodeException 코드 활성화 상태 업데이트 성공 결과 값이 1 보다 작을 떄 발생하는 예외
	 * @see 클라이언트가 업데이트 요청한 호봉 코드 최대 값을 전송하는 컨트롤러
	 * @since 2020.09.03
	 */
	@RequestMapping(value = "updatePayStepStatus.bc")
	public void updatePayStepStatus(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String maxiType = request.getParameter("maxiType");
		int maximum = Integer.parseInt(request.getParameter("maximum"));
		int ajaxResult = 0;
		HashMap<String, Object> statusMap = new HashMap<>();
		statusMap.put("companyNo", companyNo);
		statusMap.put("maximum", maximum);
		try {
			bcs.updatePayStepStatus(maxiType, statusMap);
			ajaxResult = 1;
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
	 * @param  
	 * @return 이동할 페이지 주소
	 * @see  회사의 직급코드 정보를 조회하여 호봉코드 페이지에 전송하는 컨트롤러
	 * @since 2020.09.04
	 */
	@RequestMapping(value="position.bc")
	public String movePositionCode(Model model, HttpSession session) {
		if ( ((CompanyAccount)session.getAttribute("loginUser")).getCompanyStatus()==null) {
			
			model.addAttribute("msg","비활성화된 회사계정입니다. 기초 정보 등록후  이용해 주세요");
			return "common/errorPage";
		}
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		ArrayList<HashMap<String,String>> positionList = bcs.loadCodeList(companyNo,"position");
		ArrayList<HashMap<String,String>> payStepList = bcs.loadCodeList(companyNo,"realPayStep"); // 사용중인 호봉의 리스트만 부르는것
		model.addAttribute("payStepList", payStepList);
		model.addAttribute("positionList",positionList);
		
		
		return "adminSetting/basicCode/positionCode";
	}
	
	/**
	 * @author 고종현
	 * @param  
	 * @throw FailedInsertCodeException  인서트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  사용자가 입력한  새로 추가될 직급코드를  전송하는 컨트롤러
	 * @since 2020.09.03
	 */
	@RequestMapping(value="insertPositionCode.bc")
	public void insertPositionCode(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		String codeType = "position";
		
		HashMap<String, Object> insertInfo = new HashMap<>();
		insertInfo.put("positionName", request.getParameter("positionName"));
		insertInfo.put("addYearlyVacAmount", Integer.parseInt(request.getParameter("addYearlyVacAmount")));
		insertInfo.put("limitPayStep", Integer.parseInt(request.getParameter("limitPayStep")));
		insertInfo.put("companyNo", companyNo);
		int ajaxResult = 2;
		try {
			bcs.insertCode(codeType, insertInfo);
			ajaxResult = 1;
		} catch (FailedInsertCodeException e) {
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
	 * @param  status 수정할 상태 값  , code 수정할 코드 번호
	 * @throw FailedUpdateCodeException  코드 활성화 상태 업데이트 성공 결과 값이  1 보다 작을 떄 발생하는 예외
	 * @see  클라이언트가 업데이트 요청한 직급 코드 상태 값을 전송하는 컨트롤러
	 * @since 2020.09.04
	 */
	@RequestMapping(value = "updatePositionStatus.bc")
	public void updatePositionStatus(Model model, HttpServletRequest request, HttpServletResponse response) {

		String codeType = "position";

		HashMap<String, Object> statusMap = new HashMap<>();
		statusMap.put("status", request.getParameter("status"));
		statusMap.put("code", request.getParameter("code"));

		int ajaxResult = 0;

		try {
			bcs.updateCode(codeType, statusMap);
			ajaxResult = 1;
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
	
	
}