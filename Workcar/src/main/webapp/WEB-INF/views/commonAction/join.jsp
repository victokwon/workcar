<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources\css\commonAction\join.css" >
 
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
 <script type="text/javascript" src="resources\script\commonAction\join.js"></script>
</head>
<body>
<div class="container">
        <div class="out-container">
            <div class="in-container">
                <div class="text-header">
                    <h1>회원가입</h1>
                </div>
                <form class="user">
                    <input type="hidden" name="type" id="type">
                    <div class="input-member">
                        <input type="checkbox" name="iM" id="iM"><label for="iM" id="iML">개인</label>
                        <input type="checkbox" name="cM" id="cM"><label for="cM" id="cML">기업</label>
                    </div>
                    <div class="input">
                        <input type="text" placeholder="Name">
                    </div>
                    <div class="input">
                        <input type="text" placeholder="ID">
                    </div>
                    <div class="input">
                        <input type="password" placeholder="Password">
                    </div>
                    <div class="input">
                        <input type="password" placeholder="Password confirm">
                    </div>
                    <div class="input">
                        <input type="text" placeholder="E-mail">
                    </div>
                    <div class="input">
                        <input type="text" placeholder="Phone Number">
                    </div>
                    <div class="form-group">
                        <div>
                            관심내역 수신동의
                            <input type="radio" name="custom1" id="custom1Y" checked="checked"><label for="custom1Y">동의</label>
                            <input type="radio" name="custom1" id="custom1N"><label for="custom1N">비동의</label>
                        </div>
                        <div>
                            활동내역 수신동의
                            <input type="radio" name="custom2" id="custom2Y" checked="checked"><label for="custom2Y">동의</label>
                            <input type="radio" name="custom2" id="custom2N"><label for="custom2N">비동의</label>
                        </div>
                    </div>
                    <a href="cmJoin">
                        회원가입
                    </a>
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