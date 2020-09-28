package com.kh.insane.common;

import java.util.UUID;

public class CommonUtils {
	
	/* 파일 랜덤이름 생성용 메소드 */
	public static String getRandomString() {
		
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
