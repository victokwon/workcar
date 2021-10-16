<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources/css/ca/imjoin.css" >
 
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript" src="resources/script/ca/imjoin.js"></script>
 <script type="text/javascript">
 
 
 function changeCheck(flag, target) {
	  $(target).next().attr("style", "background-image: url(resources/images/ca/check.png)");
	  /* 	 if($(this).attr("name")=="id"){
				 idOverlapCheck()
			 return;
		 } */
	  if (flag) {
		  console.log($(target))
	    $(target).next().attr("style", "background-image: url(resources/images/ca/ccheck.png)");
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
                <form id="regiForm" class="user" method="get">
                    <input type="hidden" name="type" id="type">
                    <div class="input-member">
                        <input type="checkbox" name="iM" id="iM" readonly>
                        <label for="iM" id="iML">개인회원 세부입력</label>
                        <!-- <input type="checkbox" name="cM" id="cM"><label for="cM" id="cML">기업</label> -->
                    </div>

                    <div class="input">
                        <input type="text" placeholder="생년월일">
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="form-group">
                        <div>
                            성별
                            <input type="radio" name="gender" id="custom1Y"><label for="custom1Y">남성</label>
                            <input type="radio" name="gender" id="custom1N"><label for="custom1N">여성</label>
                        </div>
                    </div>
                    <div class="input">
                        <input type="button" onclick="execDaumPostcode()" value="주소검색" id="locationSchBtn">
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="dtl">
                        <div class="input">
                            <input type="text" name="postcode" id="postcode" placeholder="우편번호" value="" readonly>
                        </div>
                        <div class="input">
                            <input type="text" name="address" id="address" placeholder="주소" value="" readonly>
                        </div>
                    </div>
                    <div class="input">
                        <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="" readonly>
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <input type="hidden" id="extraAddress">
                    
                    <!-- 회원가입 넘기기 -->
                    
                    <a href="#" id="regi">
                        회원가입
                    </a>
                </form>
                <hr>
            </div>
        </div>
    </div>
</body>
</html>