package com.gdj37.workcar.web.search.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.search.service.IViewsTopService;

@Controller
public class ViewsTopController {
	@Autowired
	public IViewsTopService iViewsTopService;
	@Autowired
	public IPagingService iPagingService;
	
	
	
}
