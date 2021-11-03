package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

public interface IEmpAnncService {

	int uptempannc(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> findRegionAjax(HashMap<String, String> params) throws Throwable;

	int insEmpAnncAjax(HashMap<String, String> params) throws Throwable;

	//int uptEmpQual(HashMap<String, String> params) throws Throwable;

	int insEmpQual(HashMap<String, Object> empQual) throws Throwable;

	int uptDocBox(HashMap<String, Object> docBox) throws Throwable;

	int uptEmpBox(HashMap<String, Object> prcsBox) throws Throwable;

	int insAttchFile(HashMap<String, String> params)throws Throwable;
	

}
