package com.gdj37.workcar.web.detail.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDao implements IApplyDao {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getinfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Apply_Info_Dtl_SQL.getinfo", params);
	}

	@Override
	public HashMap<String, String> managerinfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Apply_Info_Dtl_SQL.managerinfo", params);
	}

	@Override
	public int getinfo_Cnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Apply_Info_Dtl_SQL.getinfo_Cnt", params);
	}

	@Override
	public List<HashMap<String, String>> getinfo_list(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Apply_Info_Dtl_SQL.getinfo_list", params);
	}
}
