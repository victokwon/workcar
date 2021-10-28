package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

public interface IEmpAnncService {

	int uptempannc(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> findRegionAjax(HashMap<String, String> params) throws Throwable;

	int uptEmpAnncAjax(HashMap<String, String> params) throws Throwable;

	int uptEmpQual(HashMap<String, String> params) throws Throwable;

	

}
