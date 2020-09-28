package com.kh.insane.company.model.vo;

import java.util.regex.Pattern;

/**
 * Class : Validator
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.30
 * @apiNote 유효성 검사를 전문적으로 만들어진 객체
 */
public class Validator {
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 비었는지 확인하는 메소드 
	 * @since 2020.08.28
	 */
	public static String isBlank(String str) {
		if(str.equals("")) {
			return null;
		}else {
			return str;
		}
	}
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 숫자로만 이루어져있는지 확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isNumeric(String str) {
	    return Pattern.matches("^[0-9]*$", str);
	}
	 

	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 영어로만 이루어져있는지 확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isAlpha(String str) {
	    return Pattern.matches("^[a-zA-Z]*$", str);
	}
	 
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 숫자 혹은 영어로만 이루어 져있는지 확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isAlphaNumeric(String str) {
	    return Pattern.matches("[a-zA-Z0-9]*$", str);
	}
	 
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 한국어로만 이루어 져있는지 확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isKorean(String str) {
	    return Pattern.matches("[가-힣]*$", str);
	}
	 
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 영대문자 로만 이루어 져있는지 확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isUpper(String str) {
	    return Pattern.matches("^[A-Z]*$", str);
	}
	 
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 영소문자 로만 이루어 져있는지 확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isDowner(String str) {
	    return Pattern.matches("^[a-z]*$", str);
	}
	 
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 이메일 형식인지 확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isEmail(String str) {
	    return Pattern.matches("^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$", str);
	}
	 
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 URL 형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isURL(String str) {
	    return Pattern.matches("^[^((http(s?))\\:\\/\\/)]([0-9a-zA-Z\\-]+\\.)+[a-zA-Z]{2,6}(\\:[0-9]+)?(\\/\\S*)?$",
	            str);
	}
	 
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 핸드폰 전화번호 형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isMob(String str) {
	    return Pattern.matches("^\\d{2,3}\\d{3,4}\\d{4}$", str);
	}
	 
	// 일반 전화 검사기
	public boolean isPhone(String str) {
	    return Pattern.matches("^\\d{2,3}\\d{3,4}\\d{4}$", str);
	}
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 사업자 등록번호 형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isBusinessLicense(String str) {
	    return Pattern.matches("^\\d{3}\\d{2}\\d{5}$", str);
	}
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 법인 등록번호 형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isCorporateRegistNo(String str) {
	    return Pattern.matches("^\\d{4}\\d{2}\\d{7}$", str);
	}
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 IP주소 형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isIp(String str) {
	    return Pattern.matches("([0-9]{1,3})\\.([0-9]{1,3})\\.([0-9]{1,3})\\.([0-9]{1,3})", str);
	}
	 
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 우편번호 형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isPost(String str) {
	    return Pattern.matches("^\\d{3}\\d{2}$", str);
	}
	 
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 주민 등록번호 형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isPersonalID(String str) {
	    return Pattern.matches("^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$", str);
	}
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 이미지 확장자  형식인지  확인하는 메소드
	 * @since 2020.08.28
	 */
	public boolean isPicture(String str) {
		return Pattern.matches("^([\\S]+(\\.(?!)(jpg|png|gif|bmp))$)",str);
	}
	
	/**
	 * @author 고종현
	 * @param  str 검증받을 문자열
	 * @return 유효성  적합 여부
	 * @see   해당 문자가 비밀번호로  사용가능한지 적합성을 확인하는 메소드
	 * @since 2020.09.02
	 */
	public boolean isPassword(String str) {
		return Pattern.matches("^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{8,20}$", str);
	}
	
}
