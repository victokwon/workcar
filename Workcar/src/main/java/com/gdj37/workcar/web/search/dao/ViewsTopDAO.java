package com.gdj37.workcar.web.search.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ViewsTopDAO implements IViewsTopDAO{
	@Autowired
	public SqlSession sqlSession;
}
