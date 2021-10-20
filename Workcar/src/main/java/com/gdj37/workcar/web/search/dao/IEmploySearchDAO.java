package com.gdj37.workcar.web.search.dao;

import java.util.HashMap;
import java.util.List;

public interface IEmploySearchDAO {

	public int getEmpSch1Cnt(HashMap<String, String> params) throws Throwable ;

	public List<HashMap<String, String>> getEmpSch1List(HashMap<String, String> params)throws Throwable ;;

}
