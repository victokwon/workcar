<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#att {
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
	CKEDITOR.replace("con", {
		resize_enabled : false,  // 사이즈 조절 금지
		language : "ko",
		enterMode : "2"
	});
	
	// 취소버튼
	$("#cancelBtn").on("click", function() {
		$("#backForm").submit();
	});
	
	// 엔터키 폼실행 막기
	$("#addForm").on("keypress", "input", function(event) {
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
	
	// 저장 버튼
	$("#addBtn").on("click", function() {
		// ck에디터 중에 con과 관련된 객체에서 데이터를 취득하여  textarea인 con에 값을 넣는다
		$("#con").val(CKEDITOR.instances['con'].getData());
		
		if(checkVal("#title")) { //입력체크
			alert("제목을 입력해 주세요.");
			$("#title").focus();
		} else if (checkVal("#con")) {
			alert("내용을 입력해 주세요.");
		} else {
			var fileForm = $("#fileForm");
			
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
						// 업로드 파일명 적용
						if(res.fileName.length > 0) { //업로드한 파일이 있는 경우
							$("#bFile").val(res.fileName[0]);
						}
						
						//글 저장
						var params = $("#addForm").serialize();  //데이터를 문자열화
						
						$.ajax({
							url: "testABAdds",   //이 주소로 데이터 주고받을거야
							type: "post",
							dataType: "json",  
							data: params,
							success: function(res) { 
								if(res.result == "success") { // 성공시 그냥 로케이션 이동
									location.href = "testABList";
								} else if(res.result == "failed") {
									alert("작성에 실패하였습니다.");
								} else {
									alert("작성중 문제가 발생했습니다.");
								}
							},
							error: function(request, status, error) {
								console.log(error);
							}
						});
						
					} else {
						alert("파일 업로드에 실패하였습니다.");
					}
				},
				error : function(req, status, error) {
					console.log(error);
					alert("파일 업로드중 문제가 발생하였습니다.");
				}
				
			});
			
			fileForm.submit();
		}
	});
});

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
</form>
<form action="testABList" id="backForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="page" value="${param.page}" />
</form>
<form action="#" id="addForm" method="post">
	제목 <input type="text" id="title" name="title" /><br/>
	작성자 : ${sMNm}<input type="hidden" name="mno" value="${sMNo}" /><br/>
	<textarea rows="5" cols="5" id="con" name="con"></textarea> 
	첨부파일 : <input type="button" value="첨부파일선택" id="fileBtn" />
	<span id="fileName"></span>
	<input type="hidden" name="bFile" id="bFile" /><!-- DB저장용 -->
</form>
<input type="button" value="저장" id="addBtn" />
<input type="button" value="취소" id="cancelBtn" />
</body>
</html>