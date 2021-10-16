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
	  $("#joinBtn").on("click", function () {
	    if (check()) {
	      $("#joinForm").submit();
	    }
	  });
	});

	/* 체크변경 */
	function changeCheck(flag, target) {
	  $(target).next().attr("style", "background-image: url(resources/images/ca/check.png)");
  	 if($(this).attr("name")=="ID"){
				 idOverlapCheck()
			 return;
  	 }
  	 if (flag) {
		  console.log($(target))
	    $(target).next().attr("style", "background-image: url(resources/images/ca/ccheck.png)");
	  }
	}

	/* 중복아이디  */
	function idOverlapCheck() {
	  var params = $("#joinForm").serialize();

	  $.ajax({
	    data: params,
	    type: "post",
	    dataType: "json",
	    url: "idCheckAjax",
	    success: function (res) {
		      if (res.idCnt > 0) {
	    	  	alert("중복된 아이디");
		  	    $("#ID").focus();
		        $(this).next().attr("style","background-image: url(resources/images/ca/fcheck.png)");
		      } 
	    },
	    error: function (request, status, error) {
	      console.log(error);
	    },
	  });
	}
	/* 유효성 검사 함수*/
	/* 전체 유효성 */
	function check() {
	  if (
	 	nmCheck() &&
	    idCheck() &&
	    pwCheck() &&
	    pwcCheck() &&
	    emCheck() &&
	    phCheck() &&
	    typeCheck()
	  ) {
	    return true;
	  } else {
	    return false;
	  }
	}
	/* 아이디 유효성 */
	function idCheck() {
	  var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	  if ($("#ID").val() == "") {
	    alert("아이디 입력바람");
	    $("#ID").focus();
	    return false;
	  }
	  if (!getCheck.test($("#ID").val())) {
	    alert("형식에 맞게 입력해주세요");
	    $("#ID").val("");
	    $("#ID").focus();
	    return false;
	  }
	  return true;
	}
	/* 비밀번호 유효성 */
	function pwCheck() {
	  var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	  if ($("#PW").val() == "") {
	    alert("패스워드 입력바람");
	    $("#PW").focus();
	    return false;
	  }
	  if ($("#ID").val() == $("#PW").val()) {
	    alert("아이디와 비밀번호가 같습니다");
	    $("#PW").val("");
	    $("#PW").focus();
	    return false;
	  }
	  if (!getCheck.test($("#PW").val())) {
	    alert("형식에 맞게 입력해주세요");
	    $("#PW").val("");
	    $("#PW").focus();
	    return false;
	  }
	  return true;
	}
	/* 비밀번호 확인 */
	function pwcCheck() {
	  if ($("#PW").val() != $("#PWC").val()) {
	    alert("비밀번호가 상이합니다");
	    $("#PW").val("");
	    $("#PWC").val("");
	    $("#PW").focus();
	    return false;
	  }
	  return true;
	}
	/* 이름 유효성 */
	function nmCheck() {
	  var getCheck = RegExp(/^[a-zA-Z0-9가-힣]{3,12}$/);
	  if ($("#NM").val() == "") {
	    alert("이름을 입력해주세요");
	    $("#NM").focus();
	    return false;
	  }
	  if (!getCheck.test($("#NM").val())) {
	    alert("이름형식에 맞게 입력해주세요");
	    $("#NM").val("");
	    $("#NM").focus();
	    return false;
	  }
	  return true;
	}
	/* 이메일 유효성 */
	function emCheck() {
	  var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	  if ($("#EM").val() == "") {
	    alert("이메일을 입력해주세요");
	    $("#EM").focus();
	    return false;
	  }
	  if (!getMail.test($("#EM").val())) {
	    alert("이메일형식에 맞게 입력해주세요");
	    $("#EM").val("");
	    $("#EM").focus();
	    return false;
	  }
	  return true;
	}
	/* 전화번호 */
	function phCheck() {
	  var getCheck = RegExp(/^[0-9]{10,11}$/);
	  if ($("#PH").val() == "") {
	    alert("전화번호를 입력해주세요");
	    $("#PH").focus();
	    return false;
	  }
	  if (!getCheck.test($("#PH").val())) {
	    alert("전화번호형식에 맞게 입력해주세요");
	    $("#PH").val("");
	    $("#PH").focus();
	    return false;
	  }
	  return true;
	}
	/* 회원선택 */
	function typeCheck(){
	 	if($("#IM").is(":checked")) {
			return true;
		}else if($("#CM").is(":checked")){
			return true;
		}else {
			alert("회원종류를 선택하지 않았습니다.");
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
				<form class="user" id="joinForm" action="joins" method="post">
					<div class="input-member">
						<input type="checkbox" name="MT" id="IM" value="0">
						<label for="IM" id="IML">개인</label>
						<input type="checkbox" name="MT" id="CM" value="1">
						<label for="CM" id="CML">기업</label>
					</div>
					<div class="input">
						<input type="text" placeholder="Name" id="NM" name="NM" onchange="changeCheck(nmCheck(), NM)">
						<div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
					</div>
					<div class="input">
						<input type="text" placeholder="ID" id="ID" name="ID" onchange="changeCheck(idCheck(), ID)">
						<div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
					</div>
					<div class="input">
						<input type="password" placeholder="Password" id="PW" name="PW" onchange="changeCheck(pwCheck(), PW)">
						<div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
					</div>
					<div class="input">
						<input type="password" placeholder="Password confirm" id="PWC" onchange="changeCheck(pwcCheck(), PWC)">
						<div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
					</div>
					<div class="input">
						<input type="text" placeholder="E-mail" id="EM" name="EM" onchange="changeCheck(emCheck(), EM)">
						<div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
					</div>
					<div class="input">
						<input type="text" placeholder="Phone Number" id="PH" name="PH" onchange="changeCheck(phCheck(), PH)">
						<div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
					</div>
					<div class="form-group">
						<div>
							관심내역 수신동의 
							<input type="radio" name="inforAgr" id="c1Y" value="0" checked="checked">
							<label for="c1Y">동의</label>
							<input type="radio" name="inforAgr" id="c1N" value="1">
							<label for="c1N">비동의</label>
						</div>
						<div>
							활동내역 수신동의
							<input type="radio" name="actAgr" id="c2Y" value="0" checked="checked">
							<label for="c2Y">동의</label>
							<input type="radio" name="actAgr" id="c2N" value="1">
							<label for="c2N">비동의</label>
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