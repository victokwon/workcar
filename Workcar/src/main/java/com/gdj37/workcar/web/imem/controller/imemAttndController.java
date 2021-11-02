package com.gdj37.workcar.web.imem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.workcar.web.imem.service.IimemAttndService;

@Controller
public class imemAttndController {
	@Autowired IimemAttndService iimemAttndService;
	
	@RequestMapping(value = "/empAttnd")
	public ModelAndView empAttnd(ModelAndView mav) {
		mav.setViewName("imemAttnd/empAttnd");
		return mav;
	}
	
	@RequestMapping(value = "/corpAttnd")
	public ModelAndView corpAttnd(ModelAndView mav) {
		mav.setViewName("imemAttnd/corpAttnd");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
