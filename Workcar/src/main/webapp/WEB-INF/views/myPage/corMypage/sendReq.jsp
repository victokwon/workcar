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
   href="resources\css\cmemAct\req\req.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>
<script type="text/javascript"
	src="resources\script\cmemAct\req\reqListNPrcss.js"></script>

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
<%@include file="/resources/jsp/header.jsp"%>
<input type="hidden" id="userNo" no=${sMNo }>

<!-- 헤더 -->
	<main>
		<div id="test"></div>
		<div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('mngancpage')">채용공고</button>
			<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
			<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
		</div>
		
		<div class="main_info">
			<div id="main_inter" class="main_content">
				<div class="vertical_menu">
					<span onclick="linkGo('sendReq')" ><a href="#" id="sendReq">보낸 입사요청</a></span> 
					<span onclick="linkGo('cmemStar')" ><a href="#" id="imemStar">기업평점</a></span>
				</div>
				
				<div class="main_box">
					<div class="inner_wrap">
						<table class="sendReq">
							<tr>
								<td>
									<div class="zero">처리할 내용이 없습니다.</div>
								</td>
							</tr>
						</table>
					</div>
					
					<form action="#" id="sendReqForm">
						<input type="hidden" id="goMemNo" name="memNo" value="">
						<input type="hidden" id="goEmpNo" name="empNo" value="">
						<input type="hidden" id="goEmpMemNo" name="empMemNo" value="${sMNo }">
						<input type="hidden" id="page" name="page" value="${page }">
					</form>
					<div id="sendReq_paging_wrap"></div>
					
				</div>
			</div>

		</div>

	</main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>