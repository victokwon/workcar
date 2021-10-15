package com.gdj37.workcar.web.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
	
	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView modelAndView) {
		
		modelAndView.setViewName("ca/login");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView modelAndView) {
		
		modelAndView.setViewName("ca/join");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/imJoin")
	public ModelAndView imJoin(ModelAndView modelAndView) {
		
		modelAndView.setViewName("ca/imjoin");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/cmJoin")
	public ModelAndView cmJoin(ModelAndView modelAndView) {
		
		modelAndView.setViewName("ca/cmjoin");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/pwf")
	public ModelAndView pwf(ModelAndView modelAndView) {
		
		modelAndView.setViewName("ca/pwf");
		
		return modelAndView;
	}
	
}
