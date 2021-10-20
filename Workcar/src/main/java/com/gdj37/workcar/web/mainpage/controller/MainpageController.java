package com.gdj37.workcar.web.mainpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainpageController {
	
	@RequestMapping(value = {"mainpage","/"})
	public ModelAndView mainpage(ModelAndView mav) {
		mav.setViewName("mainpage/mainpage");
		
		return mav;
	}
}
