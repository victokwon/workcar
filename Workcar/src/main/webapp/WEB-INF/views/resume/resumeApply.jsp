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
   href="resources\css\change\pop.css">

<script type="text/javascript"
   src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources\script\resume\resumeApply.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
   function linkGo(url) {
      location.href = url
   }
</script>
</head>

<body>
   <form action="#" id="resumeGo" method="post">
   													<!-- 바꿔줘야함 -->
      <input type="hidden" id="memNo" name="memNo" value="1">
      <input type="hidden" id="page" name="page" value="">
      <input type="hidden" id="empNo" name="empNo" value="">
   </form>
   
   <button type="button" id="popOpen">열러라참깨</button>
   
	<div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1></h1>
                </div>
                <!-- 5개 리스트 -->
                <div class="list_wrap">
                    <table>
                        <thead>
                            <tr rNo="다시 선택">
                                <th class='td_no'>번호</th>
                                <th class='td_name'>내용</th>
                                <th class='td_date'>최종수정일</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" >
                        	<tr rNo="1">
                        		<td class='td_no'></td>
                        		<td class='td_name'></td>
                        		<td class='td_date'></td>
                        	</tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="page">
                </div>
                <hr>
                <div class="paging_wrap"></div>
                <div class="pop-input">
               		<div class="text_box"></div>
                    <input type="button" class="sch-btn" id="applyBtn" rNo="" eNo="1" value="요청하기">
                </div>
            </div>
        </div>
    </div>

</body>
</html>