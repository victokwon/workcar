package com.gdj37.workcar.web.login.controller;

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
import com.gdj37.workcar.web.login.service.IEmpAnncDtlService;

@Controller
public class EmpAnncDtl {

	@Autowired
	IEmpAnncDtlService iempdtlser;
	
	
	@RequestMapping("/empAncDtl")
	public ModelAndView empAncDtl(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
		
	HashMap<String,String> data = iempdtlser.empAncDtl(params);
	List<HashMap<String,String>> qlist = iempdtlser.qaulList(params);
	
	System.out.println("toString"+qlist.toString());
	
	
	mav.addObject("data",data);
	mav.addObject("qlist",qlist);
	mav.setViewName("myPage/corMypage/empAncDtl");
	return mav;
	}
	
	
	
	//채용공고수정Ajax
	@ResponseBody
	@RequestMapping(value="/uptEmpAnncAjax",method=RequestMethod.POST, produces ="text/json; UTF-8")
	public String uptEmpAnncAjax (@RequestParam HashMap<String,String> params,
			@RequestParam(required =false)String[] QUAL_NO,
			@RequestParam(required=false)String[] EMP_DOC,
			@RequestParam(required=false)String[] EMP_PRCS
			) throws Throwable {
		
		int cnt = 0;
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String,Object> empQual;
		//HashMap<String,Object> docBox;
		//HashMap<String,Object> prcsBox;
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
				cnt += iempdtlser.uptEmpAnncAjax(params);
				cnt += iempdtlser.uptAttchFile(params);
				 System.out.println("paaaaaaaam"+params);	
				
				if(cnt == 2) {
					empQual = new HashMap<String,Object>();
					empQual.put("EMP_NO",params.get("EMP_NO"));
					for(int i =0; i<QUAL_NO.length; i++) {		
						empQual.put("QUAL_NO",QUAL_NO[i]);
						cnt+= iempdtlser.uptEmpQual(empQual);
						
		
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
	
}
