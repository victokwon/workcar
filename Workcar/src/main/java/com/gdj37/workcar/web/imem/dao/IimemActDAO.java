package com.gdj37.workcar.web.imem.dao;

import java.util.HashMap;
import java.util.List;

public interface IimemActDAO {

	public int imemUpdateGrd(HashMap<String, String> params) throws Throwable;

	public int getSubResumCnt(HashMap<String, String> params)throws Throwable;
	public List<HashMap<String, String>> getSubResum(HashMap<String, String> params)throws Throwable;
	public int changeSubResum(HashMap<String, String> params)throws Throwable;
	public int DelSupResum(HashMap<String, String> params)throws Throwable;

	public int getRecepReqCnt(HashMap<String, String> params)throws Throwable;
	public List<HashMap<String, String>> getRecepReq(HashMap<String, String> params)throws Throwable;

	public int recepReqRefuse(HashMap<String, String> params)throws Throwable;

}
