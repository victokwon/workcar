package com.gdj37.workcar.common;

public class CommonProperties {
	
		
	/**
	 * 기본 셋
	 */
//	기본 리스트 사이즈
	public static final int VIEWCOUNT = 5;
	//기본 페이지 사이즈
	public static final int PAGECOUNT = 5;
	
	/**
	 * Ajax Result
	 */
	public static final String RESULT_SUCCESS = "SUCCESS";
	
	public static final String RESULT_FAILED = "FAILED";
	
	public static final String RESULT_ERROR = "ERROR";
	
	/**
	 * 파일 업로드
	 */
	//파일 업로드 경로
	public static final String FILE_UPLOAD_PATH = "E:\\java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\Workcar\\resources\\upload";
	
	//허용파일 확장자
	public static final String FILE_EXT = "xls|ppt|doc|xlsx|pptx|docx|hwp|csv|jpg|jpeg|png|gif|bmp|tld|txt|pdf|zip|alz|7z";
	public static final String IMG_EXT = "jpg|jpeg|png|gif|bmp";
	
	/**
	 * 암호화키(AES기반 16글자)
	 */
	public static final String SECURE_KEY = "goodeesmart12345";
}
