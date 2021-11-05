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
	href="resources\css\mainpage\searchbar.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\cmemAttnd\hrsuggest.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\cmemAttnd\pop.css">
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>
<script type="text/javascript"
	src="resources\script\cmemAttnd\hrsuggest1.js"></script>
<script type="text/javascript"
	src="resources\script\cmemAttnd\hrsuggest2.js"></script>
<script type="text/javascript"
	src="resources\script\cmemAttnd\hrsuggest3.js"></script>
	
<script type="text/javascript">
$(function () {
	$(function () {
		  $("#empAttention").on("click", function () {
		    $(".emp_attention").css("display", "table");
		    $(".emp_suggest").css("display", "none");
		  });
		  
		  $("#empSuggest").on("click", function () {
		    $(".emp_attention").css("display", "none");
		    $(".emp_suggest").css("display", "table");
		  });
		});
	



}) 

function linkGo(url){
	location.href = url
}
</script>
</head>
<body>
<!-- 헤더 --><%@include file="/resources/jsp/header.jsp"%>
<input type="hidden" id="userNo" no=${sMNo }>

	<main>
		<div id="test"></div>
		<div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('mngancpage')">채용공고</button>
			<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
			<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
		</div>
		
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
                            <tr eNo="다시 선택">
                                <th class='td_no'>번호</th>
                                <th class='td_name'>내용</th>
                                <th class='td_date'>마감일</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" >
                        	<tr eNo="1">
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
                    <input type="button" class="sch-btn" id="selectBtn" rNo="" value="요청하기">
                </div>
            </div>
        </div>
    </div>
    
		<div class="main_info">
			<div id="main_inter" class="main_content">
				<div class="vertical_menu">
	<!-- 				<form action="#" id="resumeGo">
						<input type="hidden" id="userNO" name="userNO">
						 <input type="hidden" id="resumeNO" name="resumeNO">
					</form> -->
					<!-- 이력서 리스트 메뉴 출력 -->
					<a href="#" id="empAttention">관심인재</a> <a href="#" id="empSuggest">인재추천</a>
				</div>
				
				<div class="main_box">
					<!-- <table class="please_apply"> -->
					<table class="emp_attention">
					</table>
					<!-- <table class="company_grade"> -->
					<form action="#" id="suggetResumeForm">
					</form>
					<table class="emp_suggest">
							<tr>
								<td class="job_post_add">
									<button type="button" class="" id="addEmpBtn">인재 더보기</button>
								</td>
							</tr>
					</table>
				</div>
			</div>

		</div>

	</main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>