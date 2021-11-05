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
   href="resources\css\manage\Star.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\manage\pop.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>
<script type="text/javascript"
	src="resources\script\manage\StarListNPrcss.js"></script>
<script type="text/javascript"
	src="resources\script\manage\StarPop.js"></script> 

<script type="text/javascript">
function linkGo(url){
	location.href = url
}
function linkBack() {
    history.back()
}
</script>
</head>
<body>

<div class="pop_wrap">
	<div class="pop-container"></div> 
</div>
<!-- 헤더 --><%@include file="/resources/jsp/header.jsp"%>
<input type="hidden" id="userNo" no=${sMNo }>
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
			<button type="button" class="main_button" onclick="linkGo('manageRegist')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('manageMemberList')">회원관리</button>
			<button type="button" class="main_button" onclick="linkGo('manageReport')">신고관리</button>
			<button type="button" class="main_button" onclick="linkGo('manageStar')">평점관리</button>
		</div>
		
		<div class="main_info">
			<div id="main_inter" class="main_content">
				<div class="vertical_menu">
					<a href="#" id="imember">개인회원</a> 
					<a href="#" id="cmember">기업회원</a>
				</div>
				
				<div class="main_box">
					<div class="inner_wrap">
					
					</div>
				</div>
			</div>

		</div>
		
	<form action="#" method="post">
		<input type="hidden" id="page" name="page" value="${param.page }">
	</form>
	
	</main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>