package com.gdj37.workcar.web.manage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManageDAO implements IManageDAO {
	@Autowired SqlSession sqlSession;
//	신고관리
	@Override
	public int getDclCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Manage_SQL.getDclCnt", params);
	}
	@Override
	public List<HashMap<String, String>> getDcl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Manage_SQL.getDcl", params);
	}
	@Override
	public HashMap<String, String> getDclDtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Manage_SQL.getDclDtl", params);
	}
	@Override
	public int updateDcl(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Manage_SQL.updateDcl", params);
	}
	@Override
	public int ReportedEmpDel(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Manage_SQL.ReportedEmpDel", params);
	}
//	평점관리
	@Override
	public int getGrdCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Manage_SQL.getGrdCnt", params);
	}
	@Override
	public List<HashMap<String, String>> getGrd(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Manage_SQL.getGrd", params);
	}
	@Override
	public HashMap<String, String> getGrdDtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Manage_SQL.getGrdDtl", params);
	}
	@Override
	public int updateGrd(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Manage_SQL.updateGrd", params);
	}
	
}
