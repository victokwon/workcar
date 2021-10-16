package com.gdj37.workcar.web.sample.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.util.Utils;
import com.gdj37.workcar.web.sample.controller.service.ISampleService;

@Controller
public class SampleController {
	
	@Autowired ISampleService iSampleService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView mav, HttpSession session) {
//		세션 로그인 정보 저장
		if(session.getAttribute("sMNo") == null ) {
			mav.setViewName("ca/login");
		}else {
			mav.setViewName("redirect:join");
		}
		return mav;
	}
	
	@RequestMapping(value = "/logins")
	public ModelAndView logins(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		try {
			String pw = Utils.encryptAES128(params.get("PW"));
			params.put("PW", pw);
			
			HashMap<String, String> data = iSampleService.login(params);

			if(data!=null) {
				session.setAttribute("sMNo", data.get("MEM_NO"));
				session.setAttribute("sMNm", data.get("NAME"));
				mav.setViewName("redirect:join");
			}else {
				mav.addObject("msg","로그인실패");
				mav.setViewName("ca/join");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mav) {
		
		mav.setViewName("ca/join");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheckAjax",method = RequestMethod.POST, produces = "text/html;charset=UTF-8" )
	public String idCheckAjax(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable  {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			int idCnt = iSampleService.SampleIdCheck(params);
			modelMap.put("idCnt",idCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/joins")
	public ModelAndView joins(ModelAndView mav,@RequestParam HashMap<String, String> params) throws Throwable {
		System.out.println(params);
		
		params.put("PW", Utils.encryptAES128(params.get("PW")));
		int joinCnt = iSampleService.joinMember(params);
		
		String view =  "ca/";
		if(Integer.parseInt(params.get("MT"))  == 0 ) {
			view += "imjoin";
		}else if(Integer.parseInt(params.get("MT"))  == 1 ){
			view += "cmjoin";
		}
		
		params.clear();
		mav.setViewName(view);
		
		return mav;
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
	public ModelAndView pwf(ModelAndView mav) {
		
		mav.setViewName("ca/pwf");
		
		return mav;
	}
	
}
