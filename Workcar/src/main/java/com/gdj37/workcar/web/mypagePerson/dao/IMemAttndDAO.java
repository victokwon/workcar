package com.gdj37.workcar.web.mypagePerson.dao;

import java.util.HashMap;
import java.util.List;

public interface IMemAttndDAO {
	public List<HashMap<String, String>> getAttndList(String memNo)throws Throwable;
	public int delAttention(String target) throws Throwable;
	public HashMap<String, String> getSuggetEmp(HashMap<String, Object> params) throws Throwable;
	public int addAttned(HashMap<String, String> params) throws Throwable;
	public int getEmpCnt(HashMap<String, String> params)throws Throwable;
	public List<HashMap<String, String>> getEmp(HashMap<String, String> params)throws Throwable;
	public int JC(HashMap<String, String> params)throws Throwable;
}
