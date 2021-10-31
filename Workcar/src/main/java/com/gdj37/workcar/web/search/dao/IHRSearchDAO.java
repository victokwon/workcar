package com.gdj37.workcar.web.search.dao;

import java.util.HashMap;
import java.util.List;

public interface IHRSearchDAO {

	public int getHRSch1Cnt(HashMap<String, String> params)throws Throwable ;

	public List<HashMap<String, String>> getHRSch1List(HashMap<String, String> params)throws Throwable ;

}
