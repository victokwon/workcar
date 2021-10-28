package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpAnncDAO implements IEmpAnncDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int uptempannc(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("empannc.uptempannc",params);
	}

	@Override
	public List<HashMap<String, String>> findRegionAjax(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("empannc.findRegionAjax",params);
	}

	@Override
	public int uptEmpAnncAjax(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("empannc.uptEmpAnncAjax",params);
	}

	@Override
	public int uptEmpQual(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("empannc.uptEmpQual",params);
	}


}
