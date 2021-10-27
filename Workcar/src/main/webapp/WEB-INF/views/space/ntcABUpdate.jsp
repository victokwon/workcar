<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/mainbox.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/space.css" />
<style type="text/css">
#att {
	display: none;
}
main{
	height: calc(100% - 170px);
}
.main_content{
	display: flex;
   	height: 90%;
}
.vertical_menu {
   width: 100%;
}

.hide_btn {
	display: none;
}
</style>
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js">
</script>
<script type="text/javascript" 
		src="resources/script/ckeditor/ckeditor.js">
</script> <!-- ckeditor 도 jquery를 기반으로 만들어져서 먼저 문서에 jquery부터 넣고 에디터를 넣어야 작동한다. -->
<script>
$(document).ready(function() {
	CKEDITOR.replace("cntt", {
		resize_enabled : false,  // 사이즈 조절 금지
		language : "ko",
		enterMode : "2"
	});
	
	//상단 메뉴바 클릭시 해당 페이지로 이동
	$("#personalSpaceBtn").on("click", function() {
		location.href = "personalSpace";
	});
	
	$("#mainSpaceBtn").on("click", function() {
		location.href = "mainSpace";
	});
	
	$("#ntcSpaceBtn").on("click", function() {
		location.href = "ntcSpaceABList";
	});
	
	$("#quesSpaceBtn").on("click", function() {
		location.href = "quesSpace";
	});
	
	// 취소버튼
	$("#cancelBtn").on("click", function() {
		$("#backForm").submit();
	});
	
	// 엔터키 폼실행 막기
	$("#updateForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) { //엔터키가 눌러졌을 때
			return false; //form실행 이벤트를 하지 않음 (기본할당 동작키 작동 막음)
		}
	});
	
	//첨부파일 버튼 (attach를 줄여서 att)
	$("#fileBtn").on("click", function() {
		$("#att").click();
	});
	
	//첨부파일 선택 시 (파일첨부하면 파일명이 버튼옆에 뜬다. \\는 \를 문자로 인식시키기 위해 두번 쓴 것.)
	$("#att").on("change", function() {
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
	});
	
	//첨부파일 삭제버튼
	$("#fileDelBtn").on("click", function() {
		$("#fileName").html(""); //사용자에게 보여지는 파일명.파일명 안보여주려고 html에 공백으로 넣음
		$("#nFile").val(""); //DB에 올라갈 파일명
		$("#fileBtn").attr("class", ""); //첨부파일 선택 버튼
		$(this).remove(); //첨부파일 삭제버튼 제거
	});
	
	
	// 수정 버튼
	$("#updateBtn").on("click", function() {
		// ck에디터 중에 con과 관련된 객체에서 데이터를 취득하여  textarea인 con에 값을 넣는다
		$("#cntt").val(CKEDITOR.instances['cntt'].getData());
		
		if(checkVal("#title")) { //입력체크
			alert("제목을 입력해 주세요.");
			$("#title").focus();
		} else if (checkVal("#cntt")) {
			alert("내용을 입력해 주세요.");
		} else {
			var fileForm = $("#fileForm");
			
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
						// 업로드 파일명 적용
						if(res.fileName.length > 0) { //업로드한 파일이 있는 경우
							$("#nFile").val(res.fileName[0]);
						}
						
						//글 수정
						var params = $("#updateForm").serialize();  //데이터를 문자열화
						
						$.ajax({
							url: "ntcABUpdates",   //이 주소로 데이터 주고받을거야
							type: "post",
							dataType: "json",  
							data: params,
							success: function(res) { 
								if(res.result == "success") { // 성공시 그냥 로케이션 이동
									location.href = "ntcSpaceABList";
								} else if(res.result == "failed") {
									alert("수정에 실패하였습니다.");
								} else {
									alert("수정중 문제가 발생했습니다.");
								}
							},
							error: function(request, status, error) {
								console.log(error);
							} 
						});
					}else {
						alert("파일업로드에 실패하였습니다.");
					}
				},
				error: function(req, status, error) {
					console.log(error);
					alert("파일 업로드중 문제가 발생하였습니다.");	
				} 
			});
			fileForm.submit();
		} //else end
	}); //updateBtn click end
}); //document ready end

function checkVal(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" />
	<!-- <input type="file" name="att2" id="att2" />
	<input type="file" name="att3" id="att3" />
	<input type="file" name="att4" id="att4" />
	<input type="file" name="att5" id="att5" /> --> <!-- <= 첨부파일 갯수를 늘리고 싶으면 이것을 더 만들고 부가작업하면 됨. -->
</form> <!-- 파일을 올리거나 있던 파일을 교체하기 위한 장치 -->
<form action="ntcAB" id="backForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="no" value="${param.no}" />
</form>
<form action="#" id="updateForm" method="post">
	번호 : ${data.NOTICE_NO}<input type="hidden" name="no" value="${data.NOTICE_NO}" /><br/>
	제목 <input type="text" id="title" name="title" value="${data.NOTICE_TITLE}" /><br/>
	작성자 : ${data.NAME}<input type="hidden" name="memNo" value="${sMNo}" /><br/>
	<textarea rows="5" cols="5" id="cntt" name="cntt">${data.NOTICE_CNTT}</textarea> 
	첨부파일 :  
	<c:choose>
		<c:when test="${!empty data.ATTCH_NAME}">
		<!-- 첨부파일이 있는 경우 버튼을 숨긴다. -->
			<input type="button" value="첨부파일선택" id="fileBtn" class="hide_btn" />
		</c:when>
		<c:otherwise>
			<input type="button" value="첨부파일선택" id="fileBtn" />
		</c:otherwise>
	</c:choose>
	<c:set var="len" value="${fn:length(data.ATTCH_NAME)}"></c:set>
	<span id="fileName">${fn:substring(data.ATTCH_NAME, 20, len)}</span><!-- 현재 등록되어있는 파일명 -->
	<c:if test="${!empty data.ATTCH_NAME}">
		<input type="button" value="첨부파일삭제" id="fileDelBtn" />
	</c:if>
	<input type="hidden" name="nFile" id="nFile" value="${data.ATTCH_NAME}" /><!-- DB저장용 -->
</form>
<input type="button" value="수정" id="updateBtn" />
<input type="button" value="취소" id="cancelBtn" />
</body>
</html>