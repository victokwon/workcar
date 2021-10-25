package com.gdj37.workcar.web.space.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpaceADao implements ISpaceADao {
	@Autowired
	public SqlSession sqlSession;
 
	@Override
	public int getACnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.getACnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("space.getAList", params);
	}

	@Override
	public HashMap<String, String> getA(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space.getA", params);
	}

	@Override
	public int ABAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("space.ABAdd", params);
	}

	@Override
	public int ABUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("space.ABUpdate", params);
	}

	@Override
	public int ABDelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("space.ABDelete", params);
	}

	
}
