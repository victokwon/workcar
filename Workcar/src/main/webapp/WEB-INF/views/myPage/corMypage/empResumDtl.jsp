<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
   href="resources\css\common\default.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\common\footer.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\common\header.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\common\sidebar.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\resume\resumeDtl.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\resume\floatRightNav.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\Mypage\corMypage\empResumeDtl.css"> 

<script type="text/javascript"
   src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
   $(function() {
	   
      $("#empResumeList").on("click","div",function(){
         let resumeNo = $(this).attr("resumeNo")
         $("#resumeNo").val(resumeNo)
         $("#empResumeGo").attr("action", "empResumDtl")
         $("#empResumeGo").submit()
      })
      
		$("select").each(function (idx) {
			$(this).val($(this).attr("selValue"))
		})
		
	$("#prePage").on("click",function(){
		if($("#page").val() =="1"){
			alert("첫 페이지 입니다.")
		}else{
			let page = Number($("#page").val()) - 1
			$("#page").val(page)
			$("#empResumeGo").attr("action", "empResumDtl")
			$("#empResumeGo").submit()
		}	
	})
	
	$("#nextPage").on("click",function(){
		if($("#page").val() < "${pb.maxPcount}"){
			let page = Number($("#page").val()) + 1
			$("#page").val(page)
			$("#empResumeGo").attr("action", "empResumDtl")
			$("#empResumeGo").submit()
		}else{
			alert("마지막 페이지 입니다.")
		}	
	})
	
	$("#prcssBtn").on("click",function(){
		$("#prcssState").val($("#prcssStateVal").val())
		$("#empResumeGo").attr("action", "empResumDtl")
		$("#empResumeGo").submit()
		location.reload()
	})
		
   })
   function linkGo(url) {
      location.href = url
   }
   function linkBack() {
		history.back()   
	}
</script>
</head>

<body>
   <form action="#" id="empResumeGo" method="post">
      <input type="hidden" id="memNo" name="memNo" value="${sMNo}">
      <input type="hidden" id="resumeNo" name="resumeNo" value="${DATA.RESUM_NO }">
      <input type="hidden" id="empNo" name="empNo" value="${DATA.EMP_NO }">
      <input type="hidden" id="page" name="page" value="${page }">
      <input type="hidden" id="prcssState" name="prcssState" value="${DATA.PRCSS_STATE }">
      <input type="hidden" id="actGbn" name="empResume" >
   </form>

   <%@include file="/resources/jsp/header.jsp"%>

   <main>
      <div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('mngancpage')">채용공고</button>
			<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
			<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
      </div>
      <div class="main_info">
	      
         <div id="main_apply" class="main_content">
            <div class="vertical_menu">
               <table id="empResumeList">
               		<c:forEach var="data" items="${LIST }">
	                     <tr>
	                        <td>
	                           <div class="apply_list" resumeNo=${data.RESUM_NO }>
	                           		<a href="javascript:void(0)">${data.NAME } / 
	                           		<c:set var="prcssState1" value="${fn:replace(data.PRCSS_STATE,'0','미처리') }"/>
	                           		<c:set var="prcssState2" value="${fn:replace(prcssState1,'1','서류합격') }"/>
	                           		<c:set var="prcssState3" value="${fn:replace(prcssState2,'2','불합격') }"/>
	                           		${prcssState3 } 
	                           		<%-- <br> ${data.RESUM_NAME }  --%>
	                           		</a>
	                           </div>
	                        </td>
	                     </tr>
                     </c:forEach>
                     <tr class="paging">
                     	<td id="prePage">이전</td>
                     	<td id="nextPage">다음</td>
                     </tr>
               </table>
            </div>
            <!-- form 내부의 button 동작 막기 -->
            <div class="main_box">
            	<div class="content apply_dtl_header emp_header" id="resumeName">
                    <span class="apply_dtl_name">${DATA.EMP_TITLE }</span><br>
                    <span class="apply_dtl_date">마감일 | ${DATA.DLINE}</span>
            	</div>
               <div class="content apply_dtl_header" id="resumeName">
                  <div class="apply_dtl">
                     <span class="apply_dtl_name">${DATA.RESUM_NAME}</span><br> 
                     <span class="apply_dtl_date">지원일 | ${DATA.APPLY_DATE}</span>
                  </div>
                  <div class="apply_btn">
                  		<select id="prcssStateVal" selValue="${ DATA.PRCSS_STATE}">
                  			<option value="0">미처리</option>
                  			<option value="1">서류합격</option>
                  			<option value="2">불합격</option>
                  		</select>
                     <button type="button" id="prcssBtn">처리</button>
                     <button type="button" id="listBtn" onclick="linkGo('mngancpage')">목록</button>
                  </div>
               </div>
               <!-- form 설정 -->
               <div class="content apply_dtl_user" id="resumeUser">
                  <div class="dtl">
                     <div class="header">지원자정보</div>
                     <div class="con">
                        <div class="profile" id="profile"></div>
                        <div class="input_box">
                           <div class="name">
                              <div class="text">성명</div>
                              <div class="input">${DATA.NAME }</div>
                           </div>
                           <div class="gender">
                              <div class="text">성별</div>
                              <div class="input">${DATA.GENDER_NAME}</div>
                           </div>
                           <div class="birth">
                              <div class="text">출생년도</div>
                              <div class="input">${DATA.BIRTH}</div>
                           </div>
                           <div class="phone">
                              <div class="text">연락처</div>
                              <div class="input">${DATA.PHONE}</div>
                           </div>
                           <div class="email">
                              <div class="text">이메일</div>
                              <div class="input">${DATA.EMAIL}</div>
                           </div>
                           <div class="location">
                              <div class="text">거주지역</div>
                              <div class="input">${DATA.CITY_NAME}&nbsp;/&nbsp;${DATA.REGION_NAME}</div>
                           </div>
                           <div class="edu">
                              <div class="text">최종학력</div>
                              <div class="input">${DATA.GRADU_NAME}</div>
                           </div>
                           <div class="carr">
                            <div class="text">경력</div>
                            <div class="input"> ${DATA.CARR_NAME}&nbsp;/&nbsp;${DATA.CARR_PER} </div>
                        </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- form 설정 -->
              <%--  <div class="content apply_dtl_hope" id="resumeHope">
                  <div class="dtl">
                     <div class="header">구직희망사항</div>
                     <div class="con">
                        <div class="input_box">
                           <div class="job">
                              <div class="text">희망직종</div>
                              <div class="input">${DATA.SECTOR_NAME}</div>
                           </div>
                           <div class="hope_loc">
                              <div class="text">근무지역</div>
                              <div class="input">
                                <c:forEach var="data" items="${LOC }">
                                 [&nbsp;${data.CITY_NAME}&nbsp;/&nbsp;${data.REGION_NAME}&nbsp;]
                                 </c:forEach>
                                <c:if test="${empty LOC }">
                                 		선택된 근무지역이 없습니다.
                                 </c:if>
                              </div>
                           </div>
                           <div class="work_format">
                              <div class="text">근무형태</div>
                              <div class="input">
	                                 <c:forEach var="data" items="${WORK}">
	                                    [&nbsp;${data.WORK_TYPE_NAME }&nbsp;]&nbsp;
	                                 </c:forEach>
                                 <c:if test="${empty WORK }">
                                 		선택된 근무형태가 없습니다.
                                 </c:if>
                              </div>
                           </div>
                           <div class="sal">
                              <div class="text">희망연봉</div>
                              <div class="input"> 
                              	<c:choose>
                              		<c:when test="${DATA.PAY_GBN eq 0 }">
                              			내규
                              		</c:when>
                              		<c:when test="${DATA.PAY_GBN eq 1 }">
                              			일반
                              		</c:when>
                              	</c:choose>
									<c:if test="${DATA.PAY_GBN eq 1 }">
										<div class="input">최대 ${DATA.PAY_MIN}만원 ~ ${DATA.PAY_MAX}만원</div>
									</c:if>
							   </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div> --%>
               
               <c:if test="${!empty QUAL}">
                  <div class="content apply_dtl_lisence" id="resumeLisence">
                     <div class="dtl">
                        <div class="header">자격증</div>
                        <c:forEach var="data" items="${QUAL }">
                        <div class="con add_box">
                           
                              <div class="input_box ">
                                 <div class="data_container">
                                    <input type="text" disabled="disabled" value="${data.QUAL_NAME }">
                                    <input type="text" disabled="disabled" value="${data.ISSU_AGCY }"> 
                                    <input type="text" disabled="disabled" value="${data.PASS_DATE }"> 
                                 </div>
                              </div>
                           
                        </div>
                        </c:forEach>
                     </div>
                  </div>
               </c:if>
               
               <c:if test="${!empty FLANG}">
                  <div class="content apply_dtl_forei" id="resumeForeign">
                     <div class="dtl">
                        <div class="header">외국어능력</div>
                        <c:forEach var="data" items="${FLANG }">
                           <div class="con add_box">
                                 <div class="input_box ">
                                    <div class="data_container">
                                       <input type="text" disabled="disabled" value="${data.FLANG_NAME }"> 
                                       <input type="text" disabled="disabled" value="${data.FLANG_TYPE }">
                                       <input type="text" disabled="disabled" value="${data.FLANG_GRADE }">
                                    </div>
                                 </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
               </c:if>
               
               <c:if test="${!empty CARR}">
                  <div class="content apply_dtl_history" id="resumeHistory">
                     <div class="dtl">
                        <div class="header">경력사항</div>
                        <div class="con add_box">
                        <c:forEach var="data" items="${CARR }">
                           <div class="input_box more">
                              <div class="data_container ">
                                    <div class="detail">
                                       기업 <input type="text" disabled="disabled" value="${data.C_NAME }">
                                    </div>
                                    <div class="detail">
                                       부서 <input type="text" disabled="disabled" value="${data.DPART }"> 
                                       직책 <input type="text" disabled="disabled" value="${data.POS }">
                                    </div>
                                    <div class="detail">
                                       재직기간 <input type="text" disabled="disabled" value="${data.ST_DATE }">
                                        ~ <input type="text" disabled="disabled" value="${data.END_DATE }">
                                        재직여부 <input type="text" disabled="disabled" value="${data.TURE_CHK }">
                                    </div>
                                    <div class="detail">
                                       직무내용
                                       <textarea name="" spellcheck="false" disabled="disabled">${data.CARR_CNTT }</textarea>
                                    </div>
                              </div>
                           </div>
                           </c:forEach>
                        </div>
                     </div>
                  </div>
               </c:if>
               
               <c:if test="${!empty EDU}">
                  <div class="content apply_dtl_Edu" id="resumeEdu">
                     <div class="dtl">
                        <div class="header">학력사항</div>
                        <div class="con add_box">
                           <c:forEach var="data" items="${EDU }">
                           <div class="input_box more">
                              <div class="data_container ">
                                    <div class="detail">
                                       학교 <input type="text" disabled="disabled" value="${data.SCH_NAME }">
                                    </div>
                                    <div class="detail">
                                       학부 <input type="text" disabled="disabled" value="${data.SOL }"> 학과 <input
                                          type="text" disabled="disabled" value="${data.MAJOR }">
                                    </div>
                                    <div class="detail">
                                       재학기간 <input type="text" disabled="disabled" value="${data.ST_DATE }">~ <input
                                          type="text" disabled="disabled" value="${data.END_DATE }">
                                    </div>
                                    <div class="detail">
                                       특이사항
                                       <textarea name="" spellcheck="false" disabled="disabled" >${data.EDU_ETC }</textarea>
                                    </div>
                               </div>
                           </div>
                           </c:forEach>
                        </div>
                     </div>
                  </div>
               </c:if>
               
               <c:if test="${!empty IEDU}">
                  <div class="content apply_dtl_job_edu" id="resumeJobEdu">
                     <div class="dtl">
                        <div class="header">직무교육</div>
                        <div class="con add_box ">
                           <div class="input_box more">
                              <div class="data_container ">
                                 <c:forEach var="data" items="${IEDU }">
                                    <div class="detail">
                                       기관 <input type="text" disabled="disabled" value="${data.IEDU_NAME }">
                                    </div>
                                    <div class="detail">
                                       훈련과정 <input type="text" disabled="disabled" value="${data.COSE_NAME }">
                                    </div>
                                    <div class="detail">
                                       교육기관 <input type="text" disabled="disabled" value="${data.ST_DATE }">~ <input
                                          type="text" disabled="disabled" value="${data.END_DATE }">
                                    </div>
                                    <div class="detail">
                                       교육내용
                                       <textarea name="" spellcheck="false" disabled="disabled" >${data.CNTT }</textarea>
                                    </div>
                                 </c:forEach>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:if>
               
               <c:if test="${!empty SINTRO}">
                  <div class="content apply_dtl_intro" id="resumeIntro">
                     <div class="dtl">
                        <div class="header">자기소개서</div>
                        <div class="con add_box">
                           <div class="input_box text_box">
                              <c:forEach var="data" items="${SINTRO }">
                                 <input type="text" disabled="disabled" value="${data.SINTRO_NAME }">
                                 <div class="data_container">
                                    <textarea name="" spellcheck="false" disabled="disabled" >${data.SINTRO_CNTT }</textarea>
                                 </div>
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:if>
               
               <c:if test="${!empty ATTACH}">
                  <div class="content apply_dtl_attch" id="resumeAttach">
                     <div class="dtl">
                        <div class="header">첨부파일</div>
                        <div class="con add_box">
                           <div class="input_box ">
                              <div class="data_container file_container">
                                 <c:forEach var="data" items="${ATTACH }">
                                 	<c:set var="len" value="${fn:length(data.ATTCH_NAME) }"></c:set>
                                    <div id="fileSNm">
                                    <a href="resources/upload/${fn:replace(fn:replace(data.ATTCH_NAME, '[','%5B'),']', '%5d')}" download="${fn:substring(data.ATTCH_NAME, 20, len) }">
   									 ${fn:substring(data.ATTCH_NAME, 20, len) }
									</a></div>
                                 </c:forEach>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:if>
            </div>
         </div>

      </div>
      <div class="float_right_nav_wrap" id="floatRightNavWrap">
         <div class="float_right_nav">
            <div>
               <a href="#resumeName">이력서제목</a>
            </div>
            <div>
               <a href="#resumeUser">지원자정보</a>
            </div>
            <div>
               <a href="#resumeHope">구직희망사항</a>
            </div>
            <div>
               <a href="#resumeLisence">자격증</a>
            </div>
            <div>
               <a href="#resumeForei">외국어능력</a>
            </div>
            <div>
               <a href="#resumeHistory">경력사항</a>
            </div>
            <div>
               <a href="#resumeEdu">학력사항</a>
            </div>
            <div>
               <a href="#resumeJobEdu">직무교육</a>
            </div>
            <div>
               <a href="#resumeIntro">자기소개서</a>
            </div>
            <div>
               <a href="#resumeAttach">첨부파일</a>
            </div>
         </div>
      </div>
   </main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>