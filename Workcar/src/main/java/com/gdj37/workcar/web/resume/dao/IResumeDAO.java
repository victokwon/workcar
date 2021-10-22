package com.gdj37.workcar.web.resume.dao;

import java.util.HashMap;
import java.util.List;

public interface IResumeDAO {

	List<HashMap<String, String>> resumeList(HashMap<String, String> params)throws Throwable;

	int getResumeCnt(HashMap<String, String> params)throws Throwable;

	int applyResume(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> resumeDtlQual(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> resumeDtlFlang(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> resumeDtlWork(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> resumeDtlEdu(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> resumeDtlIedu(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> resumeDtlSintro(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> resumeDtlAttach(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> resumeDtlCarr(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getResumeDtl(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> resumeDtlLoc(HashMap<String, String> params)throws Throwable;


}
