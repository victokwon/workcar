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
	public int uptEmpQual(HashMap<String, Object> empQual) throws Throwable {
		
		return sqlSession.insert("empannc.uptEmpQual",empQual);
	}

	@Override
	public int uptDocBox(HashMap<String, Object> docBox) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("empannc.uptDocBox",docBox);
	}

	@Override
	public int uptEmpBox(HashMap<String, Object> prcsBox) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("empannc.uptEmpBox",prcsBox);
	}

	@Override
	public int uptAttchFile(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("empannc.uptAttchFile",params);
	}


}
