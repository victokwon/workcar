package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;
import java.util.List;


public interface IPersonService {

	public HashMap<String, String> jiwonja(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> wish(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> Qualification(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> grade(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> edu(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> resum(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> career(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> flang(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> list_info(HashMap<String, String> params) throws Throwable;

	public int list_paging(HashMap<String, String> params) throws Throwable;


}
