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
		
		if( session.getAttribute("sMNo") != null && ( session.getAttribute("sMTy") == null || Integer.parseInt(String.valueOf(session.getAttribute("sMTy"))) == 0) ) {
			
			mav.setViewName("redirect:errorpage");
			
		}else if(session.getAttribute("sMNo") != null) {
		String memberNo = String.valueOf(session.getAttribute("sMNo"));
		
		HashMap<String,String> data = imycorpser.cMemberDtl(memberNo);
		
		mav.addObject("data",data);
		mav.setViewName("myPage/corMypage/empAnnc");
		
		} else{
			
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
	//	System.out.println("Message :" + result);
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//채용공고등록Ajax
	@ResponseBody
	@RequestMapping(value="/insEmpAnncAjax",method=RequestMethod.POST, produces ="text/json; UTF-8")
	public String insEmpAnncAjax (@RequestParam HashMap<String,String> params,
			@RequestParam(required =false)String[] QUAL_NO,
			@RequestParam(required=false)String[] EMP_DOC,
			@RequestParam(required=false)String[] EMP_PRCS
			) throws Throwable {
		
		int cnt = 0;
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String,Object> empQual;

		String result = "success";

			
			if (EMP_DOC != null) {
				String Doc = "";	
				for (int i = 0; i < EMP_DOC.length; i++) {

					Doc += EMP_DOC[i];
					if (i + 1 != EMP_DOC.length) {

						Doc += ",";
					}
					params.put("EMP_DOC", Doc);
				}
			}
						
			if (EMP_PRCS != null) {
				String Prcs = "";
				for (int i = 0; i < EMP_PRCS.length; i++) {

					Prcs += EMP_PRCS[i];
					if (i + 1 != EMP_PRCS.length) {

						Prcs += ",";
					}
					params.put("EMP_PRCS", Prcs);
				}
			}
					
			//System.out.println("EMP_DOCCCCC : " +params.get("EMP_DOC"));
			//System.out.println("EMP_DOCCCCC : " +params.get("EMP_PRCS"));		
		
		try {
				cnt += iempannc.insEmpAnncAjax(params);
				cnt += iempannc.insAttchFile(params);
				 System.out.println("paaaaaaaam"+params);	
				
				if(cnt == 2) {
					empQual = new HashMap<String,Object>();
					empQual.put("EMP_NO",params.get("EMP_NO"));
					for(int i =0; i<QUAL_NO.length; i++) {		
						empQual.put("QUAL_NO",QUAL_NO[i]);
						cnt+= iempannc.insEmpQual(empQual);
						
		
					}
					
			}

			System.out.println("cntcntcnt: " + cnt);

			if(cnt != 3) {
				result = "failed";
			}
		} catch (Exception e) {
			result ="error";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping("/errorpage")
	public ModelAndView errorpage (ModelAndView mav)  {
		
		mav.setViewName("myPage/corMypage/accesseDenied");
		return mav;
	}
	

	
}
