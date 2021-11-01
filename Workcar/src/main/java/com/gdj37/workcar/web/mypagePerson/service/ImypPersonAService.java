package com.gdj37.workcar.web.mypagePerson.service;

import java.util.HashMap;
import java.util.List;

public interface ImypPersonAService {

	public HashMap<String, String> myInfo(HashMap<String, String> params) throws Throwable;

	public int addMyInfo(HashMap<String, String> params) throws Throwable;

	public int updateMyInfo(HashMap<String, String> params) throws Throwable;

	public int deleteMyInfo(HashMap<String, String> params) throws Throwable;

	public int updatePass(HashMap<String, String> params) throws Throwable;

}
