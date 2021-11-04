package com.gdj37.workcar.web.search.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.search.dao.IViewsTopDAO;

@Service
public class ViewsTopService implements IViewsTopService{
	@Autowired
	public IViewsTopDAO iViewsTopDAO;
	
}
