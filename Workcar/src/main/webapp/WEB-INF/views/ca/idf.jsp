<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources\css\ca\findIDPW.css" >
 <link rel="stylesheet" type="text/css" href="resources\css\ca\popup.css">
 
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="resources\script\ca\popup.js"></script>
	<script type="text/javascript">
	$(function() {
		$(".pop-container").on('keydown', function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		})

		$("#mailSubmitBtn").on("click", function() {
			if (check()) {
				mailAjax()
			}
		});
		$("#popConfBtn").on("click", function() {
			$(".pop-container").hide();
		});
	})
	
	function mailAjax() {
		let params = $("#findForm").serialize();

		$.ajax({
			type : "POST",
			data : params,
			url : "mailAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					$(".pop-container").show();
					$("#popConfBtn").attr("href", "login")
				} else if (res.result == "FAILED") {
					$(".pop-text-header").children("h1").html("발송실패")
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
	}
	
	function check() {
	  if (
	 	nmCheck() &&
	    emCheck() 
	  ) {
	    return true;
	  } else {
	    return false;
	  }
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
	</script>
</head>
<body>
	<div class="pop-container">
        <div class="pop-out-container">
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1>발송완료</h1>
                   	<a href='javascript:void(0);' id="popConfBtn">확인</a>
                </div>
                <hr>
            </div>
        </div>
    </div>

<div class="container">
        <div class="out-container">
            <div class="in-container">
                <div class="text-header">
                    <h1>아이디 찾기</h1>
                    <h2>이메일로 아이디를 전송합니다.</h2>
                </div>
                <form class="user" action="#" method="post" id="pwfForm">
                    <div class="input">
                   		<input type="text" id="NM" name="NM" placeholder="Name">
                        <input type="text" id="EM" name="EM" placeholder="E-mail">
                        <input type="hidden" id="mailGbn" name="mailGbn" value="idf">
                    </div>
                    <a href='javascript:void(0);' id="mailSubmitBtn" >
                        전송
                    </a>
                </form>
                <hr>
                <div class="text">
                    <a class="small" href="join">회원가입</a>
                </div>
                <div class="text">
                    <a class="small" href="login">로그인</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>