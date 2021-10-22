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
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.util.Utils;
import com.gdj37.workcar.web.login.service.IMyCorpService;

@Controller
public class MyPageCorp {

	@Autowired
	IMyCorpService imycorpser;
	@Autowired
	IPagingService iPagingService;
	
	//계정관리 -> 개인정보 설정페이지
	@RequestMapping(value="/corRegi")
	ModelAndView CorRegi(ModelAndView mav, HttpSession session) throws Throwable {
		
		if(session.getAttribute("sMNo") != null) {
		String memberNo = String.valueOf(session.getAttribute("sMNo"));
		
		
		
		HashMap<String,String> data = imycorpser.cMemberDtl(memberNo);
		
		mav.addObject("data",data);
		mav.setViewName("myPage/corMypage/corRegi");
		
		} else {
			
			mav.setViewName("redirect:mainpage");
		}
		
		return mav;
	}
	
	
	
	//계정관리 -> 기업회원 개인정보 설정 수정 AJax
	@ResponseBody
	@RequestMapping(value="/uptInfoAjax", method= RequestMethod.POST, produces ="text/json; charset=UTF-8")
	public String uptInfoAjax(@RequestParam HashMap<String,String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		String result = "success";
		
		try {
			int cnt = imycorpser.uptinfor(params);
			if(cnt == 0) {
				
				result = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result="error";
		}
		
		
		modelMap.put("result", result);
		
	
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//계정관리 -> 기업정보 수정 Ajax
	@ResponseBody
	@RequestMapping(value="/uptCpInfoAjax", method= RequestMethod.POST, produces="text/json; charset=UTF-8")
	public String uptCpInfoAjax(@RequestParam HashMap<String,String>params)throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		String result = "success";
		

		
		try {
		
			int cnt = imycorpser.uptcpinfor(params);
			
			if(cnt == 0) {
				result ="failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result="error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);		
	}
	
	
	
	//회원관리 페이지
	@RequestMapping(value="/manageMember")
	ModelAndView manageMember(ModelAndView mav, @RequestParam HashMap<String,String> params) {
		
	//	String page="1";	
		//if(params.get("page")!= null) {		
	//		page = params.get("page");
	//	}
	//	mav.addObject("page",page);
		
		
		mav.setViewName("myPage/manageMypage/manageMember");
		return mav;
	}
	
	//회원관리 - 일반회원 리스트
	@ResponseBody
	@RequestMapping(value="/listImember", method=RequestMethod.POST, produces="text/json; charset=UTF-8")
	public String listImember(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		
		
	ObjectMapper mapper = new ObjectMapper();
	Map<String,Object> modelMap = new HashMap<String,Object>();
	
	int ipage = 1;
	
	
	try {
		//ipage = Integer.parseInt(params.get("ipage"));
		
		int icnt = imycorpser.imemCnt(params);
		
		
		PagingBean ipb = iPagingService.getPagingBean(ipage, icnt);

		params.put("StartCnt", Integer.toString(ipb.getStartCount()));
		params.put("endCnt", Integer.toString(ipb.getEndCount()));
		
		List<HashMap<String,String>> ilist = imycorpser.imemList(params);
		//List<HashMap<String,String>> clist = imycorpser.cmemList(params);
		
		modelMap.put("ilist", ilist);
		//modelMap.put("clist", clist);
		modelMap.put("ipb", ipb);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
		return mapper.writeValueAsString(modelMap);
	}
		
	
	//현재비밀번호 확인 Ajax
	@ResponseBody
	@RequestMapping(value="/ChnPassAJax",method=RequestMethod.POST, produces="text/json; charset=UTF-8")
	public String ChnPassAJax (@RequestParam HashMap<String,String> params) throws Throwable {
	
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		String result = "success";
		
		String nowpass = Utils.encryptAES128(params.get("nowpass"));
		params.put("nowpass", nowpass);
		
		try {
			int cnt = imycorpser.chkNowPass(params);
			
			if(cnt == 0) {
				result ="failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	//비밀번호 수정 Ajax
	@ResponseBody
	@RequestMapping(value="/uptNewPassAjax", method=RequestMethod.POST,produces="text/json; charset=UTF-8")
	public String uptNewPassAjax (@RequestParam HashMap<String,String> params ) throws Throwable {
		
	
		ObjectMapper mapper = new ObjectMapper();
		
		Map <String,Object> modelMap = new HashMap<String,Object>();
	
		String result = "success";
		

		String newpass = Utils.encryptAES128(params.get("newpass"));
		
		
		
		params.put("newpass", newpass);
		
		try {
			int cnt = imycorpser.uptNewPass(params);
			
			if(cnt == 0) {
				
				result ="falied";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "error";
		}
		modelMap.put("result",result);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	//회원 탈퇴 Ajax
	@ResponseBody
	@RequestMapping(value ="/outMemberAjax", method =RequestMethod.POST, produces="text/json; charset=UTF-8")
	public String outMemberAjax (@RequestParam HashMap<String,String> params, HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map <String,Object> modelMap = new HashMap<String,Object>();
	
		String result = "success";
		

		String newpass = Utils.encryptAES128(params.get("outpasschk"));
		
		
		
		params.put("newpass", newpass);
		
		try {
			int cnt = imycorpser.uptNewPass(params);
			
			session.invalidate();
			
			if(cnt == 0) {
				
				result ="falied";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "error";
		}
		modelMap.put("result",result);
		
		
		return mapper.writeValueAsString(modelMap);
		
	
	}
	
	@RequestMapping(value="/manageRegi")
	ModelAndView manageRegi(ModelAndView mav) {
		
		
		mav.setViewName("myPage/manageMypage/manageRegi");
		return mav;
	}
	
	
	//신고처리
	@RequestMapping(value="/manageReport")
	ModelAndView manageReport(ModelAndView mav) {
		
		
		mav.setViewName("myPage/manageMypage/manageReport");
		return mav;
	}


	//평점관리
	@RequestMapping(value="/manageStar")
	ModelAndView manageStar(ModelAndView mav) {
		
		
		mav.setViewName("myPage/manageMypage/manageStar");
		return mav;
	}
	
	//관심정보
	@RequestMapping(value="/personAct")
	ModelAndView personAct(ModelAndView mav) {
		
		
		mav.setViewName("myPage/personMypage/personAct");
		return mav;
	}
	
	
	//관심채용공고
	@RequestMapping(value="/personInter")
	ModelAndView personInter(ModelAndView mav) {
		
		
		mav.setViewName("myPage/personMypage/personInter");
		return mav;
	}
	
	
	
	@RequestMapping(value="/personRegi")
	ModelAndView personRegi(ModelAndView mav) {
		
		
		mav.setViewName("myPage/personMypage/personRegi");
		return mav;
	}
	
	
	
	
	
	
	
	
	
}
