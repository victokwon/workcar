package com.gdj37.workcar.web.imem.service;

import java.util.HashMap;
import java.util.List;

public interface IimemAttndService {

	List<HashMap<String, String>> getAttndList(String memNo);
	HashMap<String, String> getsuggetEmp(HashMap<String, Object> paramMap);
	int delAttnd(String target);
	int addAttned(HashMap<String, String> params);

}
