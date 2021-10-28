package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

public interface IMyCorpDAO {

	HashMap<String, String> cMemberDtl(String memberNo) throws Throwable;

	int uptinfo(HashMap<String, String> params) throws Throwable;

	int uptcpinfo(HashMap<String, String> params) throws Throwable;

	int imemCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> imemList(HashMap<String, String> params) throws Throwable;

	int chkNowPass(HashMap<String, String> params) throws Throwable;

	int uptNewPass(HashMap<String, String> params) throws Throwable;

	int outCMember(HashMap<String, String> params) throws Throwable;

}
