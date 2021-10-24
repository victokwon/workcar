package com.gdj37.workcar.web.detail.dao;

import java.util.HashMap;
import java.util.List;

public interface ICorporDao {

	HashMap<String, String> getP1(HashMap<String, String> params) throws Throwable;

	int getP2Cnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getP2(HashMap<String, String> params) throws Throwable;


}
