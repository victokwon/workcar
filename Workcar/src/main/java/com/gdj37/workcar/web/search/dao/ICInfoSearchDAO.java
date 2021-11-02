package com.gdj37.workcar.web.search.dao;

import java.util.HashMap;
import java.util.List;

public interface ICInfoSearchDAO {

	public int getCInfoSch1Cnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getCInfoSch1List(HashMap<String, String> params)throws Throwable;

}
