<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources\css\ca\login.css" >
 
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
 	$(function () {
		$("#loginBtn").on("click",function(){
			if(check()){
				$("#loginForm").submit()
			}
		})
	})
	
	/* 전체 유효성 */
	function check() {
	  if (idCheck() && pwCheck() ) {
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
 </script>
</head>
<body>
 <div class="container">
        <div class="out-container">
            <div class="in-container">
                <div class="text-header">
                    <h1>Log-in</h1>
                </div>
                <form class="user" action="logins" method="post" id="loginForm">
                    <div class="input">
                        <input type="text" placeholder="ID" name="ID" id="ID">
                    </div>
                    <div class="input">
                        <input type="password" placeholder="Password" name="PW" id="PW" >
                    </div>
                    <a href="#" id="loginBtn">
                        Login
                    </a>
                </form>
                <hr>
                <div class="text">
                    <a class="small" href="pwf">비밀번호 찾기</a>
                </div>
                <div class="text">
                    <a class="small" href="join">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>