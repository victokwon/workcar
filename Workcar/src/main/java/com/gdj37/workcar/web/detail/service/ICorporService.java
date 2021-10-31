package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;
import java.util.List;

public interface ICorporService {

	HashMap<String, String> corporinfo(HashMap<String, String> params) throws Throwable;

	int list_paging(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getP2(HashMap<String, String> params) throws Throwable;

	int reviews(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> rating(HashMap<String, String> params) throws Throwable;

	int starEnroll(HashMap<String, String> params) throws Throwable;


}
