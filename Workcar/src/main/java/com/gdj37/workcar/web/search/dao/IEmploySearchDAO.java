package com.gdj37.workcar.web.search.dao;

import java.util.HashMap;
import java.util.List;

public interface IEmploySearchDAO {

	public int getEmpSch1Cnt(HashMap<String, String> params) throws Throwable ;

	public List<HashMap<String, String>> getEmpSch1List(HashMap<String, String> params)throws Throwable ;

	public int getQualCnt(HashMap<String, String> params)throws Throwable ;

	public List<HashMap<String, String>> getQual(HashMap<String, String> params)throws Throwable ;

	public int getAddContCnt(HashMap<String, String> params)throws Throwable ;

	public int getSectorCnt(HashMap<String, String> params)throws Throwable ;

	public List<HashMap<String, String>> getSector(HashMap<String, String> params)throws Throwable ;

	public List<HashMap<String, String>> getRegion(HashMap<String, String> params)throws Throwable ;

	public List<HashMap<String, String>> getEmployViewsTop1List(HashMap<String, String> params)throws Throwable ;

	public int getEmployViewsTop1Cnt(HashMap<String, String> params)throws Throwable ;

}
