package com.gdj37.workcar.web.space.service;

import java.util.HashMap;
import java.util.List;

public interface ISpaceAService {

	public int getACnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAList(HashMap<String, String> params) throws Throwable;

	
	
}
