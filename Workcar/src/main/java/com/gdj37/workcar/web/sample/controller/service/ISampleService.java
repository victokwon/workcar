package com.gdj37.workcar.web.sample.controller.service;

import java.util.HashMap;

public interface ISampleService {

	public int SampleIdCheck(HashMap<String, String> params) throws Throwable;

	public int joinMember(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> login(HashMap<String, String> params)throws Throwable;

}
