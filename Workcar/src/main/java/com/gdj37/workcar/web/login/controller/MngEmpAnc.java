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
import com.gdj37.workcar.web.login.service.IMngEmpAncService;
import com.gdj37.workcar.web.login.service.IMyCorpService;

@Controller
public class MngEmpAnc {

	@Autowired
	IMngEmpAncService imngser;
	@Autowired
	IMyCorpService imycorpser;
	
	@RequestMapping("/mngancpage")
	public ModelAndView mngancpage (HttpSession session, ModelAndView mav) throws Throwable {
		
		if( session.getAttribute("sMNo") != null && ( session.getAttribute("sMTy") == null || Integer.parseInt(String.valueOf(session.getAttribute("sMTy"))) == 0)) {
		
			mav.setViewName("redirect:errorpage");
		}
		
		else if(session.getAttribute("sMNo")!= null) {
			String memberNo = String.valueOf(session.getAttribute("sMNo"));
		//System.out.println("memberNO"+memberNo);
		//	HashMap<String,String> data = imycorpser.cMemberDtl(memberNo);
		List<HashMap<String,String>> list = imngser.empAncList(memberNo);
		//System.out.println("list list"+ list.toString());	
		//mav.addObject("memdata",data);
		mav.addObject("list",list);
		mav.setViewName("myPage/corMypage/manageEmpAnnc");
		}else {
			mav.setViewName("redirect:mainpage");
		}
		
		return mav;
	}
	
	
	//채용 공고 리스트 삭제
	@ResponseBody
	@RequestMapping( value = "/delEmpAncAjax", method = RequestMethod.POST, produces = "text/json; charset=UTF-8")
	public String delEmpAncAjax(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		System.out.println("~~params~~"+params);
		try {
			int cnt = imngser.delEmpAnc(params);
			
			if(cnt == 0 ) {
				result ="failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result ="error";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
		
	}
	
	
	//이력서 리스트 불러오기
	@ResponseBody
	@RequestMapping(value="/ancResumeLists", method=RequestMethod.POST, produces="text/json; charset=UTF-8")
	public String ancResumeLists(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			List<HashMap<String,String>> rlist = imngser.empResumeList(params);
			
			if(rlist == null) {
				result ="failed";
			}
			modelMap.put("rlist",rlist);
			
		} catch (Exception e) {
			result="error";
			e.printStackTrace();
			
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
		
	}
	
	
	
	
}
