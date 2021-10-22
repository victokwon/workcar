package com.gdj37.workcar.web.space.dao;

import java.util.HashMap;
import java.util.List;

public interface ISpaceADao {

	public int getACnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getA(HashMap<String, String> params) throws Throwable;

	

}
