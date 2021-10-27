package com.gdj37.workcar.web.detail.dao;

import java.util.HashMap;
import java.util.List;

public interface IApplyDao {

	public HashMap<String, String> getinfo(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> managerinfo(HashMap<String, String> params) throws Throwable;

	public int getinfo_Cnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getinfo_list(HashMap<String, String> params) throws Throwable;

}