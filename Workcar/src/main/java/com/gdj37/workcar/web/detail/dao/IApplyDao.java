package com.gdj37.workcar.web.detail.dao;

import java.util.HashMap;
import java.util.List;

public interface IApplyDao {

	public HashMap<String, String> getinfo(HashMap<String, String> params) throws Throwable;

	public int getinfo_Cnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getinfo_list(HashMap<String, String> params) throws Throwable;

	public int reviews(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> rating(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getQualList(HashMap<String, String> params) throws Throwable;

	public int insertDcl(HashMap<String, String> params)throws Throwable;


}
