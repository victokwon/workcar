package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

public interface IEmpAnncDtlDAO {

	HashMap<String, String> empAncDtl(HashMap<String, String> params);

	List<HashMap<String, String>> qaulList(HashMap<String, String> params);

}
