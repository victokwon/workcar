package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

public interface IEmpAnncDtlDAO {

	HashMap<String, String> empAncDtl(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> qaulList(HashMap<String, String> params) throws Throwable;

	int uptEmpAnncAjax(HashMap<String, String> params) throws Throwable;

	int uptAttchFile(HashMap<String, String> params) throws Throwable;

	int uptEmpQual(HashMap<String, Object> empQual) throws Throwable;

}
