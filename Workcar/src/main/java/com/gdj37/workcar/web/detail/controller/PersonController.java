package com.gdj37.workcar.web.detail.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.workcar.web.detail.service.IPersonService;

@Controller
public class PersonController {
	
	@Autowired
    IPersonService iPersonService;
	
	@RequestMapping(value = "/personDetail")
	public ModelAndView personDetail(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		HashMap<String, String> data1 = iPersonService.getM1(params);
		HashMap<String, String> data2 = iPersonService.getM2(params);
		
		mav.addObject("data", data1);
		mav.addObject("data2", data2);
		
		mav.setViewName("detail/personDetail");
		
		return mav;
	}
	
	
}
