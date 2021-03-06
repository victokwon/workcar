package com.gdj37.workcar.web.resume.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAO implements IResumeDAO{
	@Autowired SqlSession sqlSession;
//	mapper = Resume_SQL

	@Override
	public List<HashMap<String, String>> resumeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeList",params);
	}

	@Override
	public int getResumeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Resume_SQL.getResumeCnt",params);
	}

	@Override
	public int applyResume(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Resume_SQL.applyResume",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlQual(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlQual",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlFlang(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlFlang",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlWork(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlWork",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlEdu(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlEdu",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlIedu(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlIedu",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlSintro(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlSintro",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlAttach(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlAttach",params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlCarr(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlCarr",params);
	}

	@Override
	public HashMap<String, String> getResumeDtl(HashMap<String, String> params) throws Throwable {
		if(params.get("actGbn")=="empResume"){
			sqlSession.update("Resume_SQL.updateSupp",params);
		}
		return sqlSession.selectOne("Resume_SQL.getResumeDtl",params);
	}

	@Override
	public  List<HashMap<String, String>> resumeDtlLoc(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.resumeDtlLoc",params);
	}

	@Override
	public HashMap<String, String> getAddContCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Resume_SQL.getAddContCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getRegion(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.getRegion",params);
	}

	@Override
	public int getSectorCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Resume_SQL.getSectorCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getSector(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.getSector",params);
	}

	@Override
	public int getQualCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Resume_SQL.getQualCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getQual(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.getQual",params);
	}


	
	// ??????(??????)
	@Override
	public int AttchUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.AttchUpdate",paramMap);
	}

	@Override
	public int CarrUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.CarrUpdate",paramMap);
	}

	@Override
	public int EduUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.EduUpdate",paramMap);
	}

	@Override
	public int IeduUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.IeduUpdate",paramMap);
	}

	@Override
	public int FlangUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.FlangUpdate",paramMap);
	}

	@Override
	public int LocUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.LocUpdate",paramMap);
	}

	@Override
	public int QualUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.QualUpdate",paramMap);
	}

	@Override
	public int SintroUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.SintroUpdate",paramMap);
	}

	@Override
	public int WorkUpdate(Map<String, Object> paramMap) throws Throwable {
		return sqlSession.insert("Resume_SQL.WorkUpdate",paramMap);
	}

	@Override
	public int dtlUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("Resume_SQL.DelAttchForUp",params);
		sqlSession.delete("Resume_SQL.DelCarrForUp",params);
		sqlSession.delete("Resume_SQL.DelEduForUp",params);
		sqlSession.delete("Resume_SQL.DelIeduForUp",params);
		sqlSession.delete("Resume_SQL.DelFlangForUp",params);
		sqlSession.delete("Resume_SQL.DelLocForUp",params);
		sqlSession.delete("Resume_SQL.DelQualForUp",params);
		sqlSession.delete("Resume_SQL.DelSintroForUp",params);
		sqlSession.delete("Resume_SQL.DelWorkForUp",params);
		return sqlSession.update("Resume_SQL.dtlUpdate",params);
	}

	@Override
	public int dtlAdd(HashMap<String, String> params) throws Throwable {
		 sqlSession.insert("Resume_SQL.dtlAdd",params);
		 System.out.println(Integer.valueOf(String.valueOf(params.get("resumeNo"))));
		 return Integer.valueOf(String.valueOf(params.get("resumeNo")));
	}

	@Override
	public HashMap<String, String> getUserDtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Resume_SQL.getUserDtl",params);
	}

	
	
	
	
	@Override
	public int getResumeEmpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Resume_SQL.getResumeEmpCnt",params);
	}
	@Override
	public List<HashMap<String, String>> getResume(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.getResume",params);
	}
	@Override
	public int PA(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Resume_SQL.PA",params);
	}

	
	
	@Override
	public List<HashMap<String, String>> empResumeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Resume_SQL.empResumeList",params);
	}

	@Override
	public int empResumeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Resume_SQL.empResumeCnt",params);
	}
}
