package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;

public interface ISampleDAO {

	public int SampleIdCheck(HashMap<String, String> params) throws Throwable;

	public int joinMem(HashMap<String, String> params) throws Throwable;
	public int joinIMem(HashMap<String, String> params) throws Throwable;
	public int joinCMem(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> login(HashMap<String, String> params)throws Throwable;

	public int cInfoCheck(HashMap<String, String> params)throws Throwable;


	public int joinCInfo(HashMap<String, String> params)throws Throwable;

//	public List<HashMap<String, String>> cInfoList(HashMap<String, String> params)throws Throwable;



}
