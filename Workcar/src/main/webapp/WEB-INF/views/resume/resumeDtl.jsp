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

<script type="text/javascript"
   src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
   $(function() {
      if("${msg}"!=""){
         alert(${msg})
      }
      console.log()
	    if("${DATA.PROF_PIC}"!=""){
	    	$("#profile").attr("style", "background-image: url(resources/upload/${DATA.PROF_PIC }")
	    }
	    
      $("#resumeList").on("click","div",function(){
         let resumeNo = $(this).attr("resumeNo")
         $("#resumeNo").val(resumeNo)
         $("#actGbn").val("Dtl")
         $("#resumeGo").attr("action", "resumeDtl")
         $("#resumeGo").submit()
      })
      
      $("#updateBtn").on("click",function(){
         $("#actGbn").val("Up")
         $("#resumeGo").attr("action", "resumeDtl")
         $("#resumeGo").submit()
      })
      

   })

   function linkGo(url) {
      location.href = url
   }
</script>
</head>
<body>
<%@include file="/resources/jsp/header.jsp"%>
   <form action="#" id="resumeGo" method="post">
      <input type="hidden" id="memNo" name="memNo" value="${sMNo}">
      <input type="hidden" id="resumeNo" name="resumeNo" value="${DATA.RESUM_NO }">
      <input type="hidden" id="actGbn" name="actGbn" >
   </form>


   <main>
      <div id="test"></div>
      <div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('')">????????????</button>
			<button type="button" class="main_button" onclick="linkGo('resumeList')">???????????????</button>
			<button type="button" class="main_button" onclick="linkGo('recepReq')">????????????</button>
			<button type="button" class="main_button" onclick="linkGo('empsugget')">????????????</button>
      </div>
      <div class="main_info">

         <div id="main_apply" class="main_content">
            <div class="vertical_menu">
               <table id="resumeList">
                  <c:forEach var="data" items="${LIST }">
                     <tr>
                        <td>
                           <div resumeNo="${data.RESUM_NO }">
                              <a href="#">${data.RESUM_NAME }</a>
                           </div>
                        </td>
                     </tr>
                  </c:forEach>
                  <c:if test="${CNT < 5  }">
                     <tr>
                        <td>
                           <div class="apply_list">
                              <a href="resumeDtlAdd" id="addBtn"> ?????? </a>
                           </div>
                        </td>
                     </tr>
                  </c:if>
               </table>
            </div>
            <!-- form ????????? button ?????? ?????? -->
            <div class="main_box">
               <div class="content apply_dtl_header" id="resumeName">
                  <div class="apply_dtl">
                     <span class="apply_dtl_name">${DATA.RESUM_NAME}</span><br> 
                     <span class="apply_dtl_date">??????????????? | ${DATA.CHN_DATE}</span>
                     <span class="apply_dtl_date">&nbsp;[${DATA.OPN_CHK_NAME}]</span>
                  </div>
                  <div class="apply_btn">
                     <button type="button" id="updateBtn">??????</button>
                     <button type="button" id="listBtn" onclick="linkGo('resumeList')">??????</button>
                  </div>
               </div>
               <!-- form ?????? -->
               <div class="content apply_dtl_user" id="resumeUser">
                  <div class="dtl">
                     <div class="header">???????????????</div>
                     <div class="con">
                        <div class="profile" id="profile"></div>
                        <div class="input_box">
                           <div class="name">
                              <div class="text">??????</div>
                              <div class="input">${DATA.NAME }</div>
                           </div>
                           <div class="gender">
                              <div class="text">??????</div>
                              <div class="input">${DATA.GENDER_NAME}</div>
                           </div>
                           <div class="birth">
                              <div class="text">????????????</div>
                              <div class="input">${DATA.BIRTH}</div>
                           </div>
                           <div class="phone">
                              <div class="text">?????????</div>
                              <div class="input">${DATA.PHONE}</div>
                           </div>
                           <div class="email">
                              <div class="text">?????????</div>
                              <div class="input">${DATA.EMAIL}</div>
                           </div>
                           <div class="location">
                              <div class="text">????????????</div>
                              <div class="input">${DATA.CITY_NAME}&nbsp;/&nbsp;${DATA.REGION_NAME}</div>
                           </div>
                           <div class="edu">
                              <div class="text">????????????</div>
                              <div class="input">${DATA.GRADU_NAME}</div>
                           </div>
                           <div class="carr">
                            <div class="text">??????</div>
                            <div class="input"> ${DATA.CARR_NAME}&nbsp;/&nbsp;${DATA.CARR_PER} </div>
                        </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- form ?????? -->
               <div class="content apply_dtl_hope" id="resumeHope">
                  <div class="dtl">
                     <div class="header">??????????????????</div>
                     <div class="con">
                        <div class="input_box">
                           <div class="job">
                              <div class="text">????????????</div>
                              <div class="input">${DATA.SECTOR_NAME}</div>
                           </div>
                           <div class="hope_loc">
                              <div class="text">????????????</div>
                              <div class="input">
                                <c:forEach var="data" items="${LOC }">
                                 [&nbsp;${data.CITY_NAME}&nbsp;/&nbsp;${data.REGION_NAME}&nbsp;]
                                 </c:forEach>
                                <c:if test="${empty LOC }">
                                 		????????? ??????????????? ????????????.
                                 </c:if>
                              </div>
                           </div>
                           <div class="work_format">
                              <div class="text">????????????</div>
                              <div class="input">
	                                 <c:forEach var="data" items="${WORK}">
	                                    [&nbsp;${data.WORK_TYPE_NAME }&nbsp;]&nbsp;
	                                 </c:forEach>
                                 <c:if test="${empty WORK }">
                                 		????????? ??????????????? ????????????.
                                 </c:if>
                              </div>
                           </div>
                           <div class="sal">
                              <div class="text">????????????</div>
                              <div class="input"> 
                              	<c:choose>
                              		<c:when test="${DATA.PAY_GBN eq 0 }">
                              			??????
                              		</c:when>
                              		<c:when test="${DATA.PAY_GBN eq 1 }">
                              			??????
                              		</c:when>
                              	</c:choose>
									<c:if test="${DATA.PAY_GBN eq 1 }">
										<div class="input">?????? ${DATA.PAY_MIN}?????? ~ ${DATA.PAY_MAX}??????</div>
									</c:if>
							   </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               <c:if test="${!empty QUAL}">
                  <div class="content apply_dtl_lisence" id="resumeLisence">
                     <div class="dtl">
                        <div class="header">?????????</div>
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
                        <div class="header">???????????????</div>
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
                        <div class="header">????????????</div>
                        <div class="con add_box">
                        <c:forEach var="data" items="${CARR }">
                           <div class="input_box more">
                              <div class="data_container ">
                                    <div class="detail">
                                       ?????? <input type="text" disabled="disabled" value="${data.C_NAME }">
                                    </div>
                                    <div class="detail">
                                       ?????? <input type="text" disabled="disabled" value="${data.DPART }"> 
                                       ?????? <input type="text" disabled="disabled" value="${data.POS }">
                                    </div>
                                    <div class="detail">
                                       ???????????? <input type="text" disabled="disabled" value="${data.ST_DATE }">
                                        ~ <input type="text" disabled="disabled" value="${data.END_DATE }">
                                        ???????????? <input type="text" disabled="disabled" value="${data.TURE_CHK }">
                                    </div>
                                    <div class="detail">
                                       ????????????
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
                        <div class="header">????????????</div>
                        <div class="con add_box">
                           <c:forEach var="data" items="${EDU }">
                           <div class="input_box more">
                              <div class="data_container ">
                                    <div class="detail">
                                       ?????? <input type="text" disabled="disabled" value="${data.SCH_NAME }">
                                    </div>
                                    <div class="detail">
                                       ?????? <input type="text" disabled="disabled" value="${data.SOL }"> ?????? <input
                                          type="text" disabled="disabled" value="${data.MAJOR }">
                                    </div>
                                    <div class="detail">
                                       ???????????? <input type="text" disabled="disabled" value="${data.ST_DATE }">~ <input
                                          type="text" disabled="disabled" value="${data.END_DATE }">
                                    </div>
                                    <div class="detail">
                                       ????????????
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
                        <div class="header">????????????</div>
                        <div class="con add_box ">
                           <div class="input_box more">
                              <div class="data_container ">
                                 <c:forEach var="data" items="${IEDU }">
                                    <div class="detail">
                                       ?????? <input type="text" disabled="disabled" value="${data.IEDU_NAME }">
                                    </div>
                                    <div class="detail">
                                       ???????????? <input type="text" disabled="disabled" value="${data.COSE_NAME }">
                                    </div>
                                    <div class="detail">
                                       ???????????? <input type="text" disabled="disabled" value="${data.ST_DATE }">~ <input
                                          type="text" disabled="disabled" value="${data.END_DATE }">
                                    </div>
                                    <div class="detail">
                                       ????????????
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
                        <div class="header">???????????????</div>
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
                        <div class="header">????????????</div>
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
               <a href="#resumeName">???????????????</a>
            </div>
            <div>
               <a href="#resumeUser">???????????????</a>
            </div>
            <div>
               <a href="#resumeHope">??????????????????</a>
            </div>
            <div>
               <a href="#resumeLisence">?????????</a>
            </div>
            <div>
               <a href="#resumeForei">???????????????</a>
            </div>
            <div>
               <a href="#resumeHistory">????????????</a>
            </div>
            <div>
               <a href="#resumeEdu">????????????</a>
            </div>
            <div>
               <a href="#resumeJobEdu">????????????</a>
            </div>
            <div>
               <a href="#resumeIntro">???????????????</a>
            </div>
            <div>
               <a href="#resumeAttach">????????????</a>
            </div>
         </div>
      </div>
   </main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>