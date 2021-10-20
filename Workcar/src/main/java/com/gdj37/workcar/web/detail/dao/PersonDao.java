package com.gdj37.workcar.web.detail.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDao implements IPersonDao {

	@Autowired SqlSession sqlSession;

	@Override
	public HashMap<String, String> getM1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("persondetail.getM1",params);
	}

	@Override
	public HashMap<String, String> getM2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("persondetail.getM2",params);
	}
	
}
