package com.gdj37.workcar.web.resume.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.resume.service.IResumeService;

@Controller
public class ResumeController {
	@Autowired
	IResumeService iResumeService;
	@Autowired
	IPagingService iPagingService;

	@RequestMapping(value = "/resumeList")
	public ModelAndView mypageResume(ModelAndView mav, @RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
		System.out.println(params);
		if (String.valueOf(session.getAttribute("sMTy")).equals("0")) {
			try {
				String memNo = String.valueOf(session.getAttribute("sMNo"));
				params.put("memNo", memNo);

				int cnt = iResumeService.getResumeCnt(params);
				List<HashMap<String, String>> list = iResumeService.resumeList(params);

				mav.addObject("cnt", cnt);
				mav.addObject("list", list);
				mav.setViewName("/resume/resumeList");
			} catch (Exception e) {
				mav.setViewName("redirect:login");
				e.printStackTrace();
			}
		} else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}

	@RequestMapping(value = "/applyResume")
	public ModelAndView applyResume(ModelAndView mav, @RequestParam HashMap<String, String> params,HttpSession session) throws Throwable {
		if (session.getAttribute("sMTy") != null ) {
			try {
				int cnt = iResumeService.applyResume(params);
				if (cnt == 0) {
					mav.addObject("mag", "삭제실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.setViewName("redirect:resumeList");
		} else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}

	@RequestMapping(value = "/resumeDtl")
	public ModelAndView resumeDtl(ModelAndView mav, @RequestParam HashMap<String, String> params,HttpSession session) throws Throwable {
		System.out.println(params);
		if (String.valueOf(session.getAttribute("sMTy")).equals("0")) {
			try {
//					이력서 리스트
				List<HashMap<String, String>> list = iResumeService.resumeList(params);
//					이력서 숫자 카운트
				int cnt = iResumeService.getResumeCnt(params);
				HashMap<String, String> data = iResumeService.getResumeDtl(params);
				List<HashMap<String, String>> work = iResumeService.resumeDtlWork(params);
				List<HashMap<String, String>> qual = iResumeService.resumeDtlQual(params);
				List<HashMap<String, String>> flang = iResumeService.resumeDtlFlang(params);
				List<HashMap<String, String>> CARR = iResumeService.resumeDtlCarr(params);
				List<HashMap<String, String>> edu = iResumeService.resumeDtlEdu(params);
				List<HashMap<String, String>> iedu = iResumeService.resumeDtlIedu(params);
				List<HashMap<String, String>> sintro = iResumeService.resumeDtlSintro(params);
				List<HashMap<String, String>> attach = iResumeService.resumeDtlAttach(params);
				List<HashMap<String, String>> loc = iResumeService.resumeDtlLoc(params);

				mav.addObject("CNT", cnt);
				mav.addObject("LIST", list);
				mav.addObject("DATA", data);
				
				mav.addObject("WORK", work);
				mav.addObject("LOC", loc);
				
				mav.addObject("QUAL", qual);
				mav.addObject("FLANG", flang);
				mav.addObject("CARR", CARR);
				mav.addObject("EDU", edu);
				mav.addObject("IEDU", iedu);
				mav.addObject("SINTRO", sintro);
				mav.addObject("ATTACH", attach);
				
				if(params.get("dtlGbn").equals("U") ) {
					mav.setViewName("/resume/resumeDtlUpdate");
				}else {
					mav.setViewName("/resume/resumeDtl");
				}
			} catch (Exception e) {
				mav.setViewName("redirect:mainpage");
				e.printStackTrace();
			}
		} else {
			System.out.println(params);
			mav.setViewName("redirect:mainpage");
		}
		return mav;
	}
}
