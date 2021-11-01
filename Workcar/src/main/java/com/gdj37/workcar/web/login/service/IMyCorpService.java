package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

public interface IMyCorpService {

	HashMap<String, String> cMemberDtl(String memberNo) throws Throwable;

	int uptinfo(HashMap<String, String> params) throws Throwable;

	int uptcpinfo(HashMap<String, String> params) throws Throwable;

	int imemCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> imemList(HashMap<String, String> params) throws Throwable;

	int chkNowPass(HashMap<String, String> params) throws Throwable;

	int uptNewPass(HashMap<String, String> params) throws Throwable;

	int outCMember(HashMap<String, String> params) throws Throwable;

	int uptinfopos(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> getAttndList(String memNo) throws Throwable;
	public int delAttention(String target) throws Throwable;
	public HashMap<String, String> getSuggetEmp(HashMap<String, Object> params) throws Throwable;
	public int addAttned(HashMap<String, String> params)throws Throwable;
	public int getEmpCnt(HashMap<String, String> params)throws Throwable;
	public List<HashMap<String, String>> getEmp(HashMap<String, String> params)throws Throwable;
	public int JC(HashMap<String, String> params)throws Throwable;

	

}
