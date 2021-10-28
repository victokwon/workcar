package com.gdj37.workcar.web.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.web.login.service.IEmpAnncService;
import com.gdj37.workcar.web.login.service.IMyCorpService;

@Controller
public class EmpAnnc {
	
	@Autowired
	IMyCorpService imycorpser;
	
	@Autowired
	IEmpAnncService iempannc;
	
	
	@RequestMapping(value="/empannc")
	public ModelAndView empannc (HttpSession session, ModelAndView mav) throws Throwable {
		
		if(session.getAttribute("sMNo") != null) {
		String memberNo = String.valueOf(session.getAttribute("sMNo"));
		
		HashMap<String,String> data = imycorpser.cMemberDtl(memberNo);
		
		mav.addObject("data",data);
		mav.setViewName("myPage/corMypage/empAnnc");
		
		} else {
			
			mav.setViewName("redirect:mainpage");
		}
		
		
		return mav;
	}
	

	//지역검색
	@ResponseBody
	@RequestMapping(value={"/findregionAjax","/"},method=RequestMethod.POST, produces="text/json; charset=UTF-8")
	public String findregionAjax (@RequestParam HashMap<String,String> params) throws Throwable {
		
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		String result = "success";
		System.out.println("success " + params);
		try {
			List<HashMap<String,String>> list = iempannc.findRegionAjax(params);
			
			if(list == null) {
				result ="failed";
			}
			modelMap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			result ="error";
		}
		
		
		modelMap.put("result", result);
		System.out.println("Message :" + result);
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//채용공고등록Ajax
	@ResponseBody
	@RequestMapping(value="/uptEmpAnncAjax",method=RequestMethod.POST, produces ="text/json; UTF-8")
	public String uptEmpAnncAjax (@RequestParam HashMap<String,String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result = "success";
		System.out.println("success " + params);
		
		try {
			int cnt = iempannc.uptEmpAnncAjax(params);
			cnt += iempannc.uptEmpQual(params);
			
			System.out.println("Cnt :" + cnt);
			if(cnt == 0) {
				result = "failed";
			}
		} catch (Exception e) {
			result ="error";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
}
