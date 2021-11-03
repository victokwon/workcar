package com.gdj37.workcar.web.imem.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class imemAttndDAO implements IimemAttndDAO {
	@Autowired SqlSession sqlSession;
}
