package com.gdj37.workcar.web.manage.service;

import java.util.HashMap;
import java.util.List;

public interface IManageService {

	public int getDclCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDcl(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getDclDtl(HashMap<String, String> params)throws Throwable;

	public int updateDcl(HashMap<String, String> params)throws Throwable;

	public int ReportedEmpDel(HashMap<String, String> params)throws Throwable;

}
