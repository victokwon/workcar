package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;
import java.util.List;

public interface ICorporService {

	HashMap<String, String> getP1(HashMap<String, String> params) throws Throwable;

	int getP2Cnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getP2(HashMap<String, String> params) throws Throwable;


}
