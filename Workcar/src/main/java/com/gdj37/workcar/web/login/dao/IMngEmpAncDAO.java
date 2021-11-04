package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

public interface IMngEmpAncDAO {

	List<HashMap<String, String>> empAncList(String memberNo)  throws Throwable;

	int delEmpAnc(HashMap<String, String> params)  throws Throwable;

	List<HashMap<String, String>> empResumeList(HashMap<String, String> params) throws Throwable;

}
