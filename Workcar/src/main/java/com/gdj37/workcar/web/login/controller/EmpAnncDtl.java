package com.gdj37.workcar.web.login.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.workcar.web.login.service.IEmpAnncDtlService;

@Controller
public class EmpAnncDtl {

	@Autowired
	IEmpAnncDtlService iempdtlser;
	
	
	@RequestMapping("/empAncDtl")
	public ModelAndView empAncDtl(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
		
	HashMap<String,String> data = iempdtlser.empAncDtl(params);
	
	
	
	mav.addObject("data",data);
	mav.setViewName("myPage/corMypage/empAncDtl");
	return mav;
	}
	
}
