package com.gdj37.workcar.web.resume.service;

import java.util.HashMap;
import java.util.List;

public interface IResumeService {
	public List<HashMap<String, String>> resumeList(HashMap<String, String> params)throws Throwable;

	public int getResumeCnt(HashMap<String, String> params) throws Throwable;

	public int applyResume(HashMap<String, String> params) throws Throwable;


	public List<HashMap<String, String>> resumeDtlQual(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> resumeDtlFlang(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> resumeDtlWork(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> resumeDtlEdu(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> resumeDtlIedu(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> resumeDtlSintro(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> resumeDtlAttach(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> resumeDtlCarr(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getResumeDtl(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> resumeDtlLoc(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getAddContCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getRegion(HashMap<String, String> params) throws Throwable;

	public int getSectorCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getSector(HashMap<String, String> params)throws Throwable;


}
