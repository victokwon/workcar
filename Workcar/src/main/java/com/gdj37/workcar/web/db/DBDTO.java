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



	public String getCrno() {
		return crno;
	}



	public void setCrno(String crno) {
		this.crno = crno;
	}



	public String getEnpPbanCmpyNm() {
		return enpPbanCmpyNm;
	}



	public void setEnpPbanCmpyNm(String enpPbanCmpyNm) {
		this.enpPbanCmpyNm = enpPbanCmpyNm;
	}



	public String getEnpEmpeCnt() {
		return enpEmpeCnt;
	}



	public void setEnpEmpeCnt(String enpEmpeCnt) {
		this.enpEmpeCnt = enpEmpeCnt;
	}



	public String getEnpOzpno() {
		return enpOzpno;
	}



	public void setEnpOzpno(String enpOzpno) {
		this.enpOzpno = enpOzpno;
	}



	public String getEnpBsadr() {
		return enpBsadr;
	}



	public void setEnpBsadr(String enpBsadr) {
		this.enpBsadr = enpBsadr;
	}



	public String getEnpDtadr() {
		return enpDtadr;
	}



	public void setEnpDtadr(String enpDtadr) {
		this.enpDtadr = enpDtadr;
	}



	public String getEnpRprFnm() {
		return enpRprFnm;
	}



	public void setEnpRprFnm(String enpRprFnm) {
		this.enpRprFnm = enpRprFnm;
	}



	public String getBzno() {
		return bzno;
	}



	public void setBzno(String bzno) {
		this.bzno = bzno;
	}



	public String getEnpTlno() {
		return enpTlno;
	}



	public void setEnpTlno(String enpTlno) {
		this.enpTlno = enpTlno;
	}



	public String getEnpEstbDt() {
		return enpEstbDt;
	}



	public void setEnpEstbDt(String enpEstbDt) {
		this.enpEstbDt = enpEstbDt;
	}



	public String getEnpPn1AvgSlryAmt() {
		return enpPn1AvgSlryAmt;
	}



	public void setEnpPn1AvgSlryAmt(String enpPn1AvgSlryAmt) {
		this.enpPn1AvgSlryAmt = enpPn1AvgSlryAmt;
	}



	public String getEnpMainBizNm() {
		return enpMainBizNm;
	}



	public void setEnpMainBizNm(String enpMainBizNm) {
		this.enpMainBizNm = enpMainBizNm;
	}



	public String getEnpHmpgUrl() {
		return enpHmpgUrl;
	}



	public void setEnpHmpgUrl(String enpHmpgUrl) {
		this.enpHmpgUrl = enpHmpgUrl;
	}



	public String getCorpNm() {
		return corpNm;
	}



	public void setCorpNm(String corpNm) {
		this.corpNm = corpNm;
	}



	public String getEmpeAvgCnwkTermCtt() {
		return empeAvgCnwkTermCtt;
	}



	public void setEmpeAvgCnwkTermCtt(String empeAvgCnwkTermCtt) {
		this.empeAvgCnwkTermCtt = empeAvgCnwkTermCtt;
	}



	public String getSmenpYn() {
		return smenpYn;
	}



	public void setSmenpYn(String smenpYn) {
		this.smenpYn = smenpYn;
	}
	
	
	
}