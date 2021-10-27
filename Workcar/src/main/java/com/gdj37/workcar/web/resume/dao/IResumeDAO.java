package com.gdj37.workcar.web.resume.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	HashMap<String, String> getAddContCnt(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> getRegion(HashMap<String, String> params) throws Throwable;

	int getSectorCnt(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> getSector(HashMap<String, String> params)throws Throwable;

	int getQualCnt(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> getQual(HashMap<String, String> params)throws Throwable;
	// 삭제(초기화)
	public int DelAttchForUp(HashMap<String, String> params)throws Throwable;
	public int DelCarrForUp(HashMap<String, String> params)throws Throwable;
	public int DelEduForUp(HashMap<String, String> params)throws Throwable;
	public int DelIeduForUp(HashMap<String, String> params)throws Throwable;
	public int DelFlangForUp(HashMap<String, String> params)throws Throwable;
	public int DelLocForUp(HashMap<String, String> params)throws Throwable;
	public int DelQualForUp(HashMap<String, String> params)throws Throwable;
	public int DelSintroForUp(HashMap<String, String> params)throws Throwable;
	public int DelWorkForUp(HashMap<String, String> params)throws Throwable;
	//생성(수정)
	public int AttchUpdate(Map<String, Object> paramMap)throws Throwable;
	public int CarrUpdate(Map<String, Object> paramMap)throws Throwable;
	public int EduUpdate(Map<String, Object> paramMap)throws Throwable;
	public int IeduUpdate(Map<String, Object> paramMap)throws Throwable;
	public int FlangUpdate(Map<String, Object> paramMap)throws Throwable;
	public int LocUpdate(Map<String, Object> paramMap)throws Throwable;
	public int QualUpdate(Map<String, Object> paramMap)throws Throwable;
	public int SintroUpdate(Map<String, Object> paramMap)throws Throwable;
	public int WorkUpdate(Map<String, Object> paramMap)throws Throwable;
	
}
