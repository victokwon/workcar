<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources\css\ca\join.css">

<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources\script\ca\join.js"></script>
<script type="text/javascript">
 $(function () {
	 
	$("#joinBtn").on("click",function(){
		check()
	})
})

/* 유효성 검사 함수*/
 function check(){
	 /* 값 유효범우 지정 */
	 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/) 
	 var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/)
	 var getName= RegExp(/^[가-힣]+$/)
	 var fmt = RegExp(/^\d{6}[1234]\d{6}$/)
	 var buf = new Array(13)
		
	if($("#id").val() == ""){ 
	 alert("아이디 입력바람"); 
	 $("#id").focus(); 
	 return false; 
	 }
	
	if (!getCheck.test($("#id").val())) {
	  alert("형식에 맞게 입력해주세요");
	  $("#id").val("");
	  $("#id").focus();
	  return false;
	}
	
	if (!getCheck.test($("#id").val())) {
	  alert("형식에 맞게 입력해주세요");
	  $("#id").val("");
	  $("#id").focus();
	  return false;
	}
	
	if ($("#password").val() == "") {
	  alert("패스워드 입력바람");
	  $("#password").focus();
	  return false;
	}
	
	if ($("#id").val() == $("#pw").val()) {
	  alert("아이디와 비밀번호가 같습니다");
	  $("#pw").val("");
	  $("#pw").focus();
	  return false;
	}
	
	if (!getCheck.test($("#pw").val())) {
	  alert("형식에 맞게 입력해주세요");
	  $("#pw").val("");
	  $("#pw").focus();
	  return false;
	}
	
	if ($("#pw").val() != $("#pwc").val()) {
	  alert("비밀번호가 상이합니다");
	  $("#pw").val("");
	  $("#pwc").val("");
	  $("#pw").focus();
	  return false;
	}
	
	if ($("#em").val() == "") {
	  alert("이메일을 입력해주세요");
	  $("#em").focus();
	  return false;
	}
	
	if (!getMail.test($("#em").val())) {
	  alert("이메일형식에 맞게 입력해주세요");
	  $("#em").val("");
	  $("#em").focus();
	  return false;
	}
	
	if (!getCheck.test($("#nm").val())) {
	  alert("이름형식에 맞게 입력해주세요");
	  $("#nm").val("");
	  $("#nm").focus();
	  return false;
	}
 
 }
 </script>
</head>
<body>
	<div class="container">
		<div class="out-container">
			<div class="in-container">
				<div class="text-header">
					<h1>회원가입</h1>
				</div>
				<form class="user" id="joinForm" action="#">
					<div class="input-member">
						<input type="checkbox" name="mt" id="iM" value="0"><label
							for="iM" id="iML">개인</label> <input type="checkbox" name="mt"
							id="cM" value="1"><label for="cM" id="cML">기업</label>
					</div>
					<div class="input">
						<input type="text" placeholder="Name" id="nm" name="nm"><div class="check"></div>
					</div>
					<div class="input">
						<input type="text" placeholder="ID" id="id" name="id"><div class="check"></div>
					</div>
					<div class="input">
						<input type="password" placeholder="Password" id="pw" name="pw"><div class="check"></div>
					</div>
					<div class="input">
						<input type="password" placeholder="Password confirm" id="pwc"><div class="check"></div>
					</div>
					<div class="input">
						<input type="text" placeholder="E-mail" id="em" name="em"><div class="check"></div>
					</div>
					<div class="input">
						<input type="text" placeholder="Phone Number" id="ph" name="ph"><div class="check"></div>
					</div>
					<div class="form-group">
						<div>
							관심내역 수신동의 <input type="radio" name="custom1" id="custom1Y"
								value="0" checked="checked"><label for="custom1Y">동의</label>
							<input type="radio" name="custom1" id="custom1N" value="1"><label
								for="custom1N">비동의</label>
						</div>
						<div>
							활동내역 수신동의 <input type="radio" name="custom2" id="custom2Y"
								value="0" checked="checked"><label for="custom2Y">동의</label>
							<input type="radio" name="custom2" id="custom2N" value="1"><label
								for="custom2N">비동의</label>
						</div>
					</div>
					<a id="joinBtn" href="#"> 회원가입 </a>
				</form>
				<hr>
				<div class="text">
					<a class="small" href="pwf">비밀번호 찾기</a>
				</div>
				<div class="text">
					<a class="small" href="login">로그인</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>