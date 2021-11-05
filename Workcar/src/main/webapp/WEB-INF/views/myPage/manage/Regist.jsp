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
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>

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
					<a href="#" id="staring">개인정보 설정</a> 
					<a href="#" id="stared">비밀번호 변경</a>
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
	                    <table class="stared">
	                    
	                    </table>
					</div>
					
					<form action="#" id="staringForm">
						<input type="hidden" id="prcss" name="prcss" value="ing">
						<input type="hidden" id="Ipage" name="page" value="${page }">
					</form>
					<div id="staring_paging_wrap"></div>
					
					<form action="#" id="staredForm">
						<input type="hidden" id="prcss" name="prcss" value="ed">
						<input type="hidden" id="Dpage" name="page" value="${page }">
					</form>
					<div id="stared_paging_wrap"></div>
					
				</div>
			</div>

		</div>

	</main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>