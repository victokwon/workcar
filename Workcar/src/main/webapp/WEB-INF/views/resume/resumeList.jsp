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
   href="resources\css\resume\resume.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\resume\floatRightNav.css">

<script type="text/javascript"
   src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources\script\resume\resume.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
   $(function() {
      if("${msg}"!=""){
         alert(${msg})
      }
      
      $("tr").on("click","#delBtn",function(){
         let resumeNo = $(this).parent().parent().attr("resumeNo")
         $("#resumeNo").val(resumeNo)
         $("#actGbn").val(0)
         $("#resumeGo").attr("action", "applyResume")
         $("#resumeGo").submit()
      })
      
      $("tr").on("click","#applyBtn",function(){
         let resumeNo = $(this).parent().parent().attr("resumeNo")
         $("#resumeNo").val(resumeNo)
         $("#actGbn").val(1)
         $("#openYN").val($(this).parent().children("select").val())
         $("#resumeGo").attr("action", "applyResume")
         $("#resumeGo").submit()
      })
      
      $("tr").on("click","#resumeDtlBtn",function(){
         let resumeNo = $(this).parent().parent().attr("resumeNo")
         $("#resumeNo").val(resumeNo)
         $("#actGbn").val("Dtl")
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
   <div id="mySidenav" class="sidenav">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
      <div id="sdienav_ul">
         <!-- 링크작업 -->
         <ul>
            <div onclick="linkGo()">채용정보</div>
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
      <div class="main_button_box">
         <button type="button" class="main_button">계정관리</button>
         <button type="button" class="main_button" id="defaultOpen">이력서관리</button>
         <button type="button" class="main_button">활동내역</button>
         <button type="button" class="main_button">관심정보</button>
      </div>
      <div class="main_info">

         <div id="main_apply" class="main_content">
            <div class="vertical_menu">
               <form action="#" id="resumeGo" method="post">
                  <input type="hidden" id="memNo" name="memNo" value="${sMNo}">
                  <input type="hidden" id="resumeNo" name="resumeNo">
                  <input type="hidden" id="openYN" name="openYN"> 
                  <input type="hidden" id="actGbn" name="actGbn" >
               </form>
               <table>
                  <!-- 이력서 리스트 출력 -->
                  <c:forEach var="data" items="${list}">
                     <tr class="apply_content" resumeNo="${data.RESUM_NO}">
                        <td>${data.RESUM_NAME }</td>
                        <td class="apply_btn">최종 수정일 | ${data.CHN_DATE} 
                           <c:choose>
                              <c:when test="${data.OPN_CHK eq 1}">
                                 <select id="opencase" class="opencase">
                                    <option value="1" selected="selected">공개</option>
                                    <option value="0">비공개</option>
                                 </select>
                              </c:when>
                              <c:otherwise>
                                 <select id="opencase" class="opencase">
                                    <option value="1">공개</option>
                                    <option value="0" selected="selected">비공개</option>
                                 </select>
                              </c:otherwise>
                           </c:choose>
                           <button type="button" id="applyBtn">적용</button>
                           <button type="button" id="delBtn">삭제</button>
                           <button type="button" id="resumeDtlBtn">상세보기</button>
                        </td>
                     </tr>
                  </c:forEach>
               </table>
               <c:if test="${cnt < 5 }">
                  <div class="apply_add">
                     <a href="resumeDtlAdd" id="addBtn"> 추가 </a>
                  </div>
               </c:if>
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
            <div class="footer_dtl_contents_2">등록일자 2021년 9월 ?일 | 발행
               (주)일력거 | 편집 (주)일력거</div>
            <div class="footer_dtl_contents_3">발행소 서울시 금천구 가산디지털2로 구디아카데미
               | 전화번호 02-1234-5678</div>
            <div class="copyright">©WorkRickshaw. All rights reserved.</div>
         </div>
      </div>
</footer>
</html>