package com.gdj37.workcar.web.imem.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class imemActDAO implements IimemActDAO {
	@Autowired SqlSession sqlSession;

	@Override
	public int imemUpdateGrd(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("ImemActNAttnd_SQL.imemUpdateGrd", params);
	}

	@Override
	public int getSubResumCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("ImemActNAttnd_SQL.getSubResumCnt", params);
	}
	@Override
	public List<HashMap<String, String>> getSubResum(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("ImemActNAttnd_SQL.getSubResum", params);
	}
	@Override
	public int changeSubResum(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("ImemActNAttnd_SQL.changeSubResum", params);
	}
	@Override
	public int DelSupResum(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("ImemActNAttnd_SQL.DelSupResum", params);
	}

	@Override
	public int getRecepReqCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("ImemActNAttnd_SQL.getRecepReqCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getRecepReq(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("ImemActNAttnd_SQL.getRecepReq", params);
	}

	@Override
	public int recepReqRefuse(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("ImemActNAttnd_SQL.recepReqRefuse", params);
	}
}
