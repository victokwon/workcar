package com.gdj37.workcar.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Component
@Aspect
public class CommonAOP {
	//Pointcut -> 적용범위
	//@Pointcut(범위설정)
	/*
	 * 범위
	 * execution -> include필터
	 * !execution -> exclude필터
	 * * -> 모든것
	 * *(..) -> 모든 메소드
	 * .. -> 모든 경로
	 * && -> 필터 추가
	 */
	@Pointcut("execution(* com.gdj37.workcar..ResumeController.resumeList(..))"
	/* + "&& execution(* com.gdj37.workcar..mypPersonController.personRegi(..))" */ 
	/* + "&& !execution(* com.gdj37.workcar..corpmp.*Ajax(..))" */
			)
	public void imem() {}
	
	@Pointcut("execution(* com.gdj37.workcar..corpmp.corpAttndInfo(..))"
			+ "&& !execution(* com.gdj37.workcar..corpmp.*Ajax(..))"
 
			)
	public void cmem() {}
	
	@Pointcut("execution(* com.gdj37.workcar..ManageController.*(..))"
	 + "&& !execution(* com.gdj37.workcar..ManageController.*Ajax(..))" 
			)
	public void mng() {}
	
	//ProceedingJoinPoint -> 대상 적용 이벤트 필터
	/*
	 * @Before -> 메소드 실행 전
	 * @After -> 메소드 실행 후
	 * @After-returning -> 메소드 정상실행 후
	 * @After-throwing -> 메소드 예외 발생 후
	 * @Around -> 모든 동작시점
	 */

	@Around("imem()") 
	public ModelAndView imem(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		
		 if(String.valueOf(session.getAttribute("sMTy")).equals("0")) {
			 mav = (ModelAndView)joinPoint.proceed(); 
		  }else {
			  if(session.getAttribute("sMNo")!=null) {
				  mav.addObject("msg","개인회원이 아닙니다.");
				  mav.setViewName("mainpage/mainpage");  
			  }else {
				  mav.addObject("msg","로그인이 필요합니다.");
				  mav.setViewName("ca/login");
			  }
		  }
		return mav;
	}

	@Around("cmem()") 
	public ModelAndView cmem(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		
		 if(String.valueOf(session.getAttribute("sMTy")).equals("1")||String.valueOf(session.getAttribute("sMTy")).equals("2")) {
			 mav = (ModelAndView)joinPoint.proceed();
		  }else {
			  if(session.getAttribute("sMNo")!=null) {
				  mav.addObject("msg","기업회원이 아닙니다.");
				  mav.setViewName("mainpage/mainpage");  
			  }else {
				  mav.addObject("msg","로그인이 필요합니다.");
				  mav.setViewName("ca/login");
			  }
		  }
		return mav;
	}
	
	@Around("mng()") 
	public ModelAndView mng(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		
		 if(String.valueOf(session.getAttribute("sMTy")).equals("3")) {
			 mav = (ModelAndView)joinPoint.proceed(); 
		  }else {
			  if(session.getAttribute("sMNo")!=null) {
				  mav.addObject("msg","관리자 회원이 아닙니다.");
				  mav.setViewName("mainpage/mainpage");  
			  }else {
				  mav.addObject("msg","로그인이 필요합니다.");
				  mav.setViewName("ca/login");
			  }
		  }
		return mav;
	}

}







