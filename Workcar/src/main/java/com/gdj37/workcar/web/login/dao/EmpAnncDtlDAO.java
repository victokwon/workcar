package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpAnncDtlDAO implements IEmpAnncDtlDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public HashMap<String, String> empAncDtl(HashMap<String, String> params) throws Throwable{
		//sqlSession.selectOne("ancdtl.empAncDtl",params);
		
		return sqlSession.selectOne("ancdtl.empAncDtl",params);
	}

	@Override
	public List<HashMap<String, String>> qaulList(HashMap<String, String> params) throws Throwable {
	
		return sqlSession.selectList("ancdtl.qaulList",params);
	}

	@Override
	public int uptEmpAnncAjax(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("ancdtl.uptEmpAnncAjax",params);
	}

	@Override
	public int uptAttchFile(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("ancdtl.uptEmpAnncAjax",params);
	}

	@Override
	public int uptEmpQual(HashMap<String, Object> empQual) throws Throwable {
		
		return sqlSession.update("ancdtl.uptEmpQual",empQual);
	}
	
	
	
}
