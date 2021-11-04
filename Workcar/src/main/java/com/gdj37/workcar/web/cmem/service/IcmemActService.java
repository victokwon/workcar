package com.gdj37.workcar.web.cmem.service;

import java.util.HashMap;
import java.util.List;

public interface IcmemActService {

	public int getSendReqCnt(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getSendReq(HashMap<String, String> params)throws Throwable;
	public int sendReqCanc(HashMap<String, String> params)throws Throwable;

}
