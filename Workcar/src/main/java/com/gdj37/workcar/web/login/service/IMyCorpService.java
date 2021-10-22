package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

public interface IMyCorpService {

	HashMap<String, String> cMemberDtl(String memberNo) throws Throwable;

	int uptinfor(HashMap<String, String> params) throws Throwable;

	int uptcpinfor(HashMap<String, String> params) throws Throwable;

	int imemCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> imemList(HashMap<String, String> params) throws Throwable;

	int chkNowPass(HashMap<String, String> params) throws Throwable;

	int uptNewPass(HashMap<String, String> params) throws Throwable;
}
