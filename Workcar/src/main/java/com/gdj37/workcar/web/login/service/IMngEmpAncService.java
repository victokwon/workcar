package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

public interface IMngEmpAncService {

	List<HashMap<String, String>> empAncList(String memberNo) throws Throwable;

	int delEmpAnc(HashMap<String, String> params) throws Throwable;

}
