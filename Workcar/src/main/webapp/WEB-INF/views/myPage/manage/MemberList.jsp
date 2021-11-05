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
   href="resources\css\manage\MemberList.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\manage\pop.css">
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>
<script type="text/javascript"
	src="resources\script\manage\MemberList.js"></script>

<script type="text/javascript">
$(function () {
	$(".imember").on("click","#updateBtn",function(){
		$("#mNo").val($(this).attr("mNo"))
		$("#goForm").attr("action","iMemDtlUpdate")
		$("#goForm").submit()
	})
	$(".cmember").on("click","#updateBtn",function(){
		$("#mNo").val($(this).attr("mNo"))
		$("#cNo").val($(this).attr("cNo"))
		$("#goForm").attr("action","cMemDtlUpdate")
		$("#goForm").submit()
	})
})

function linkGo(url){
	location.href = url
}
</script>
</head>
<body>
<!-- 팝업 -->
<div class="pop_wrap">
	<div class="pop-container"></div> 
</div>
<!-- 헤더 --><%@include file="/resources/jsp/header.jsp"%>
<input type="hidden" id="userNo" no=${sMNo }>
	<main>
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
						<table class="imember">
							<tr>
								<td>
									<div class="zero">회원이 없습니다.</div>
								</td>
							</tr>
						</table>
	                    <table class="cmember">
	                    
	                    </table>
					</div>
					
					
					<form action="#" method="post" id="goForm">
						<input type="hidden" id="mNo" name="mNo" value="">
						<input type="hidden" id="cNo" name="cNo" value="">
					</form>
					
					
					<form action="iMemDtlUpdate" method="get" id="imemberForm">
						<input type="hidden" id="prcss" name="view" value="iMem">
						<input type="hidden" id="Ipage" name="page" value="${page }">
						
					</form>
					<div id="imember_paging_wrap"></div>
					
					<form action="cMemDtlUpdate" method="get" id="cmemberForm">
						<input type="hidden" id="prcss" name="view" value="cMem">
						<input type="hidden" id="Cpage" name="page" value="${page }">
					</form>
					<div id="cmember_paging_wrap"></div>
					
				</div>
			</div>

		</div>

	</main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>