package com.gdj37.workcar.web.detail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.detail.service.IJobOfferService;

@Controller
public class JobOfferController {
	
	@Autowired
    IJobOfferService iJobOfferService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/joboffer")
	public ModelAndView personDetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		
		mav.addObject("sNo",params.get("resumno"));
		mav.addObject("empno",params.get("empno"));
		mav.setViewName("redirect:joboffers");
		return mav;
	}
	
	
	@RequestMapping(value = "/joboffers")
	public ModelAndView personDetails(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
int page = 1; //현재 P변수
		System.out.println(params);
		if(params.get("page") != null) { //넘어오는 현재 P가 존재할 시 
			page = Integer.parseInt(params.get("page"));
		}
		
		int cnt = iJobOfferService.list_paging(params); //총 게시글 개수
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 4, 5);
	    
		//데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		
		
		
		HashMap<String, String> jiwonja = iJobOfferService.jiwonja(params);
		HashMap<String, String> wish = iJobOfferService.wish(params);
		
		List<HashMap<String, String>> Qualification = iJobOfferService.Qualification(params);
		List<HashMap<String, String>> flang = iJobOfferService.flang(params);
		HashMap<String, String> career = iJobOfferService.career(params);
		
		HashMap<String, String> grade = iJobOfferService.grade(params);
		HashMap<String, String> edu = iJobOfferService.edu(params);
		HashMap<String, String> resum = iJobOfferService.resum(params);
		
		
		mav.addObject("jiwonja", jiwonja);
		mav.addObject("wish", wish);
		
		mav.addObject("Qualification", Qualification);
		mav.addObject("flang",flang);
		mav.addObject("career",career);
		
		mav.addObject("grade",grade);
		mav.addObject("edu",edu);
		mav.addObject("resum",resum);
		mav.addObject("cnt",cnt);
		
		mav.addObject("page",page);
		mav.addObject("pb",pb);
		
		mav.setViewName("detail/joboffer");
		
		return mav;
	}
	
	@RequestMapping(value="/jobofferListAjax" , method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String jobofferListAjax(@RequestParam HashMap<String,String> params) throws Throwable {
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>(); /* 데이터를 담을 map */
		
		int page = 1; //현재 P변수
		
		if(params.get("page") != null) { //넘어오는 현재 P가 존재할 시 
			page = Integer.parseInt(params.get("page"));
		}
		
		int cnt = iJobOfferService.list_paging(params); //총 게시글 개수
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 3, 5);
	    
		//데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iJobOfferService.list_info(params);
		
		modelMap.put("pb",pb);
		modelMap.put("list",list);
		
		return mapper.writeValueAsString(modelMap);
		
		
	}
}
