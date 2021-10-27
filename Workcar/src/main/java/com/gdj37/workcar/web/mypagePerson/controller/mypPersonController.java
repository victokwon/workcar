package com.gdj37.workcar.web.mypagePerson.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.mypagePerson.service.ImypPersonAService;


@Controller
public class mypPersonController {
	@Autowired
	public ImypPersonAService imypPersonAService;
	  
	@Autowired
	public IPagingService iPagingService;
	  
	@RequestMapping({"/personRegi"})
	public ModelAndView personRegi(ModelAndView mav) {
	    mav.setViewName("personMypage/personRegi");
	    return mav;
	}
	
	@RequestMapping({"/personAct"})
	public ModelAndView personAct(ModelAndView mav) {
	    mav.setViewName("personMypage/personAct");
	    return mav;
	}
	
	@RequestMapping({"/personInter"})
	public ModelAndView personInter(ModelAndView mav) {
	    mav.setViewName("personMypage/personInter");
	    return mav;
	}
	
}
