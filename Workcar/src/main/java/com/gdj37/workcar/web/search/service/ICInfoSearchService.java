package com.gdj37.workcar.web.search.service;

import java.util.HashMap;
import java.util.List;

public interface ICInfoSearchService {

	public int getCInfoSch1Cnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCInfoSch1List(HashMap<String, String> params)throws Throwable;

	public void updateCInfoHit(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getCInfo(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getViewsTop1List(HashMap<String, String> params)throws Throwable;

}
