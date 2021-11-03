package com.gdj37.workcar.web.imem.dao;

import java.util.HashMap;
import java.util.List;

public interface IimemAttndDAO {

	List<HashMap<String, String>> getAttndList(String memNo);

	HashMap<String, String> getsuggetEmp(HashMap<String, Object> paramMap);

	int delAttnd(String target);

	int addAttned(HashMap<String, String> params);

	List<HashMap<String, String>> getEmp(HashMap<String, String> params);

}
