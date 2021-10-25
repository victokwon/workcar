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
<script type="text/javascript"
   src="resources\script\resume\resumeInsert.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
   $(function() {
      if("${msg}"!=""){
         alert(${msg})
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

   <form action="#" id="resumeGo" method="post">
      <input type="hidden" id="memNo" name="memNo" value="${sMNo}">
      <input type="hidden" id="resumeNo" name="resumeNo" value="${DATA.RESUM_NO }">
      <input type="hidden" id="actGbn" name="actGbn" >
   </form>

   <div id="mySidenav" class="sidenav">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
      <div id="sdienav_ul">
         <!-- 링크작업 -->
         <ul>
            <div >채용정보</div>
            <li id="">통합검색</li>
            <li id="">조회수 100</li>
            <li id="">평점 100</li>
         </ul>
         <ul>
            <div id="">기업정보</div>
            <li id="">통합검색</li>
         </ul>
         <ul>
            <div id="">인재정보</div>
            <li id="">통합검색</li>
         </ul>
         <ul>
            <div id="">참여공간</div>
            <li id="">공지사항</li>
            <li id="">자주하는 질문</li>
         </ul>
         <c:choose>
            <c:when test="${sMTy eq 0}">
               <ul>
                  <div id="">마이페이지</div>
                  <li id="">계정관리</li>
                  <li id="">이력서관리</li>
                  <li id="">활동내역</li>
                  <li id="">관심정보</li>
               </ul>
            </c:when>
            <c:when test="${sMTy eq 1 || sMTy eq 2}">
               <ul>
                  <div id="">마이페이지</div>
                  <li id="">계정관리</li>
                  <li id="">채용공고</li>
                  <li id="">활동내역</li>
                  <li id="">관심정보</li>
               </ul>
            </c:when>
            <c:when test="${sMTy eq 3}">
               <ul>
                  <div id="">마이페이지</div>
                  <li id="">계정관리</li>
                  <li id="">회원관리</li>
                  <li id="">신고관리</li>
                  <li id="">평점관리</li>
               </ul>
            </c:when>
         </c:choose>
      </div>
   </div>
   <div class="side_bcc" id="side_bcc" onclick="closeNav()"></div>

   <header>
      <!-- 네비게이션바 -->
      <div class="topnav">

         <!-- 로고 -->
         <div class="topnav-centered">
            <div class="logo_img"></div>
         </div>

         <!-- 왼쪽 -->
         <div class="hambuger" onclick="openNav()" id="hambuger_left">
            <div></div>
            <div></div>
            <div></div>
         </div>
         <c:choose>
            <c:when test="${sMTy eq 0}">
               <div class="topnav-right">
                  <div class="alarm"></div>
                  <a href="#iMemMypage"><strong>마이페이지</strong></a>
                  <div class="profile"></div>
                  <strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
               </div>
            </c:when>
            <c:when test="${sMTy eq 1 || sMTy eq 2}">
               <div class="topnav-right">
                  <div class="alarm"></div>
                  <a href="#cMemMypage"><strong>마이페이지</strong></a>
                  <div class="profile"></div>
                  <strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
               </div>
            </c:when>
            <c:when test="${sMTy eq 3}">
               <div class="topnav-right">
                  <div class="alarm"></div>
                  <a href="#mngMypage"><strong>마이페이지</strong></a>
                  <div class="profile"></div>
                  <strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
               </div>
            </c:when>
            <c:otherwise>
               <div class="topnav-right">
                  <a href="login"><strong>로그인</strong></a> <a href="join"><strong>회원가입</strong></a>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
   </header>

   <main>
      <div class="main_wrap">
         <div class="user_wrap">
            <div class="user_box">
               <div class="user_profile"></div>
               <div class="user">
                  <div class="user_name"></div>
                  <div class="user_status"></div>
               </div>
            </div>
         </div>
      </div>
      <div id="test"></div>
      <div class="main_button_box">
         <button type="button" class="main_button">계정관리</button>
         <button type="button" class="main_button" id="defaultOpen" onclick="linkGo('resumeList')">이력서관리</button>
         <button type="button" class="main_button">활동내역</button>
         <button type="button" class="main_button">관심정보</button>
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
                              <a href="resumeDtl" id="addBtn"> 추가 </a>
                           </div>
                        </td>
                     </tr>
                  </c:if>
               </table>
            </div>
            <!-- form 내부의 button 동작 막기 -->
            <div class="main_box">
               <div class="content apply_dtl_header" id="resumeName">
                  <div class="apply_dtl">
                     <span class="apply_dtl_name">${DATA.RESUM_NAME}</span><br> 
                     <span class="apply_dtl_date">최종수정일 | ${DATA.CHN_DATE}</span>
                     <span class="apply_dtl_date">&nbsp;[${DATA.OPN_CHK_NAME}]</span>
                  </div>
                  <div class="apply_btn">
                     <button type="button" id="updateBtn">수정</button>
                     <button type="button" id="listBtn" onclick="linkGo('resumeList')">목록</button>
                  </div>
               </div>
               <!-- form 설정 -->
               <div class="content apply_dtl_user" id="resumeUser">
                  <div class="dtl">
                     <div class="header">지원자정보</div>
                     <div class="con">
                        <div class="profile"></div>
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
                              <div class="input">${DATA.GRADU}</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- form 설정 -->
               <div class="content apply_dtl_hope" id="resumeHope">
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
                                 <c:if test="${!empty LOC1 }"> 
                                    [&nbsp;${LOC1.CITY_NAME }&nbsp;/&nbsp;${LOC1.REGION_NAME}&nbsp;]&nbsp;
                                 </c:if>
                                 <c:if test="${!empty LOC2 }"> 
                                    [&nbsp;${LOC2.CITY_NAME }&nbsp;/&nbsp;${LOC2.REGION_NAME}&nbsp;]&nbsp;
                                 </c:if>
                                 <c:if test="${!empty LOC1 }"> 
                                    [&nbsp;${LOC3.CITY_NAME }&nbsp;/&nbsp;${LOC3.REGION_NAME}&nbsp;]&nbsp;
                                 </c:if>
                              </div>
                           </div>
                           <div class="work_format">
                              <div class="text">근무형태</div>
                              <div class="input">
                                 <c:forEach var="data" items="${WORK}">
                                    [&nbsp;${data.WORK_TYPE_NAME }&nbsp;]&nbsp;
                                 </c:forEach>
                              </div>
                           </div>
                           <div class="sal">
                              <div class="text">희망연봉</div>
                              <div class="input">${DATA.PAY_GBN }</div>
                              <c:if test="${DATA.PAY_GBN eq 1 }">
                                 <div class="input">최대 ${DATA.PAY_MIN}만원 ~ ${DATA.PAY_MAX}만원</div>
                              </c:if>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               <c:if test="${!empty QUAL}">
                  <div class="content apply_dtl_lisence" id="resumeLisence">
                     <div class="dtl">
                        <div class="header">자격증</div>
                        <c:forEach var="data" items="${QUAL }">
                        <div class="con add_box">
                           
                              <div class="input_box ">
                                 <div class="data_container">
                                    <input type="text" disabled="disabled" value="${data.QUAL_NAME }"> <input
                                       type="text" disabled="disabled" value="${data.PASS_DATE }"> <input type="text"
                                       disabled="disabled" value="${data.ISSU_AGCY }">
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
               
               <c:if test="${!empty iedu}">
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
                                    <div id="fileSNm">${data.ATTCH_NAME }</div>
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
<footer>
   <!-- 링크작업 -->
   <div class="inner_content">
      <div id="ntc">공지사항</div>
      <div id="paticp">참여마당</div>
      <div id="pvc">개인정보처리방침</div>
      <div id="tou">이용약관</div>
   </div>
   <div class="footer_dtl_wrap">
      <div class="footer_dtl_contents">
         <div class="footer_logo"></div>
         <div class="footer_dtl_contents_1">명칭 (주)일력거 | 사업자등록번호
            123-456-7891011</div>
         <div class="footer_dtl_contents_2">등록일자 2021년 9월 ?일 | 발행 (주)일력거
            | 편집 (주)일력거</div>
         <div class="footer_dtl_contents_3">발행소 서울시 금천구 가산디지털2로 구디아카데미 |
            전화번호 02-1234-5678</div>
         <div class="copyright">©WorkRickshaw. All rights reserved.</div>
      </div>
   </div>
</footer>
</html>