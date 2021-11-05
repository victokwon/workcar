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
<%@include file="/resources/jsp/header.jsp"%>
  

   <main>
      <div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('resumeList')">이력서관리</button>
			<button type="button" class="main_button" onclick="linkGo('recepReq')">활동내역</button>
			<button type="button" class="main_button" onclick="linkGo('empsugget')">관심정보</button>
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
<%@include file="/resources/jsp/footer.jsp"%>
</html>