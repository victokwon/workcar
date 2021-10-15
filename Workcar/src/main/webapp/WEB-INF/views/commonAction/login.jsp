<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources\css\commonAction\login.css" >
 
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
 <script type="text/javascript"></script>
</head>
<body>
 <div class="container">
        <div class="out-container">
            <div class="in-container">
                <div class="text-header">
                    <h1>Log-in</h1>
                </div>
                <form class="user">
                    <div class="input">
                        <input type="text" placeholder="ID">
                    </div>
                    <div class="input">
                        <input type="password" placeholder="Password">
                    </div>
                    <a href="#">
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