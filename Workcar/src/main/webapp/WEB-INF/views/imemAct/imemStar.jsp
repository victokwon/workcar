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
   href="resources\css\imemAct\star\Star.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\imemAct\star\pop.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>
<script type="text/javascript"
	src="resources\script\imemAct\star\StarListNPrcss.js"></script>
<script type="text/javascript"
	src="resources\script\imemAct\star\StarPop.js"></script> 

<script type="text/javascript">
function linkGo(url){
	location.href = url
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
<!-- 		<div class="main_wrap">
			<div class="user_wrap">
				<div class="user_box">
					<div class="user_profile"></div>
					<div class="user">
						<div class="user_name"></div>
						<div class="user_status"></div>
					</div>
				</div>
			</div>
		</div> -->
		<div id="test"></div>
		<div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('resumeList')">이력서관리</button>
			<button type="button" class="main_button" onclick="linkGo('recepReq')">활동내역</button>
			<button type="button" class="main_button" onclick="linkGo('empsugget')">관심정보</button>
		</div>
		
		<div class="main_info">
			<div id="main_inter" class="main_content">
				<div class="vertical_menu">
					<span onclick="linkGo('recepReq')" ><a href="#" id="recepReq">받은 입사요청</a></span> 
					<span onclick="linkGo('submitResum')" ><a href="#" id="submitResum">보낸 이력서</a></span>
					<span onclick="linkGo('imemStar')" ><a href="#" id="imemStar">평점관리</a></span>
				</div>
				
				<div class="main_box">
					<div class="inner_wrap">
						<table class="staring">
							<tr>
								<td>
									<div class="zero">처리할 내용이 없습니다.</div>
								</td>
							</tr>
						</table>
					</div>
					
					<form action="#" id="staringForm">
						<input type="hidden" id="aplmenNo" name="aplmenNo" value="${sMNo }">
						<input type="hidden" id="page" name="page" value="${page }">
					</form>
					<div id="staring_paging_wrap"></div>
				</div>
			</div>

		</div>

	</main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>