package com.gdj37.workcar.web.db;

public class DBDTO {
	
	String crno;
	String enpPbanCmpyNm;
	String enpEmpeCnt;
	String enpOzpno;
	String enpBsadr;
	String enpDtadr;
	String enpRprFnm;
	String bzno;
	String enpTlno;
	String enpEstbDt;
	String enpPn1AvgSlryAmt;
	String enpMainBizNm;
	String enpHmpgUrl;
	String corpNm;
	String empeAvgCnwkTermCtt;
	String smenpYn;
	
	
	
	public DBDTO(String crno, String enpPbanCmpyNm, String enpEmpeCnt, String enpOzpno, String enpBsadr, String enpDtadr, String enpRprFnm, String bzno
			, String enpTlno, String enpEstbDt, String enpPn1AvgSlryAmt, String enpMainBizNm, String enpHmpgUrl, String corpNm, String empeAvgCnwkTermCtt, String smenpYn) {
		
		this.crno = crno;  // 법인등록번호
		this.enpPbanCmpyNm = enpPbanCmpyNm;  // 공시된 회사이름
		this.enpEmpeCnt = enpEmpeCnt; //직원수
		this.enpOzpno = enpOzpno;  //우편번호
		this.enpBsadr = enpBsadr;  //주소
		this.enpDtadr = enpDtadr; //상세주소
		this.enpRprFnm = enpRprFnm; //기업 대표자
		this.bzno = bzno; //사업자 등록번호
		this.enpTlno = enpTlno; //전화번호
		this.enpEstbDt =enpEstbDt; //설립일자
		this.enpPn1AvgSlryAmt = enpPn1AvgSlryAmt; //1인 평균급여액
		this.enpMainBizNm = enpMainBizNm; //기업의 영위사업
		this.enpHmpgUrl = enpHmpgUrl; // 홈페이지 주소
		this.corpNm = corpNm; // 법인 이름 
		this.empeAvgCnwkTermCtt = empeAvgCnwkTermCtt;  // 1인 평균 근속년수
		this.smenpYn = smenpYn; // 중소기업여부
		
		
 	}
	
	
	
}