package com.gdj37.workcar.web.sample.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "/joins")
	public ModelAndView joins(ModelAndView modelAndView,@RequestParam HashMap<String, String> params) {
		System.out.println(params);
		
		
		
		String view =  "ca/";
		if(Integer.parseInt(params.get("mt"))  == 0 ) {
			view += "imjoin";
		}else if(Integer.parseInt(params.get("mt"))  == 1 ){
			view += "cmjoin";
		}
		System.out.println(view);
		modelAndView.setViewName(view);
		
		return modelAndView;
	}
	
//	@RequestMapping(value = "/imJoin")
//	public ModelAndView imJoin(ModelAndView modelAndView) {
//		
//		modelAndView.setViewName("ca/imjoin");
//		
//		return modelAndView;
//	}
//	
//	@RequestMapping(value = "/cmJoin")
//	public ModelAndView cmJoin(ModelAndView modelAndView) {
//		
//		modelAndView.setViewName("ca/cmjoin");
//		
//		return modelAndView;
//	}
	
	@RequestMapping(value = "/pwf")
	public ModelAndView pwf(ModelAndView modelAndView) {
		
		modelAndView.setViewName("ca/pwf");
		
		return modelAndView;
	}
	
}
