<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources/css/ca/imjoin.css" >
 
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript" src="resources/script/ca/imemjoin.js"></script>
 <script type="text/javascript">
 $(function () {
	if($("#memNO").val()==""){
		location.href = "join"
	}
	  $("#iMemJoinBtn").on("click", function () {
	    if (check()) {
	    	formSubmit()
	    }
	  });
	});
 
	/* 회원가입 비동기*/
function formSubmit(){
		 var params = $("#iMemJoinForm").serialize();
		 
		 	$.ajax({
			    data: params,
			    type: "post",
			    dataType: "json",
			    url: "joins",
			    success: function (res) {
			    	if(res.result == "success"){
			    		alert("회원가입 성공! 로그인 화면으로 이동합니다")
			    		location.href = "login"
			    	}else if(res.result == "failed"){
			    		alert("회원가입에 실패했습니다.")
			    	}
			    },
			    error: function (request, status, error) {
			      console.log(error);
			    }
			  });
	}
	

/* 입력 변화 감지 -> 체크 이미지 변경 */
 function changeCheck(flag, target) {
	  $(target).next().attr("style", "background-image: url(resources/images/ca/check.png)");
	  if (flag) {
		  /* console.log($(target)) */
	    $(target).next().attr("style", "background-image: url(resources/images/ca/ccheck.png)");
	  }
	  return
	}
	
 /* 전체 유효성 */
 function check() {
	  if (
	  birthCheck() &&
	  genderCheck() &&
	  addrCheck()&&
	  dtlAddrCheck() 
	  ) {
	    return true;
	  } else {
	    return false;
	  }
	}
 
 /* 주소검색 여부 확인 */
 function addrCheck(){
	  if ($("#zip").val() == "") {
		    alert("주소검색을 해주세요");
		    $("#addrSchBtn").focus();
		    return false;
		  }
	  return true;
 }
 /* 상세주소 유효성 */
 function dtlAddrCheck() {
  if ($("#dtlAddr").val() == "") {
	    alert("상세주소를 입력해주세요");
	    $("#dtlAddr").focus();
	    return false;
	  }
  return true;
}
 /* 생년월일 유효성 */
 function birthCheck() {
	 /* 정규식 또는 유효성 검사 규칙 재정의 필요 */
	 var getCheck = RegExp(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/);
	  if ($("#birth").val() == "") {
	    alert("생년월일을 입력해주세요");
	    $("#birth").focus();
	    return false;
	  }
	  if (!getCheck.test($("#birth").val())) {
	    alert("생년월일형식에 맞게 입력해주세요");
	    $("#birth").focus();
	    return false;
	  }
	  return true;
}
 /* 성별 체크 여부확인 */
 function genderCheck(){
	if($("input:radio[name=gender]").is(":checked")){
		return true
	}else{
		alert("성별을 선택해주세요");
	    $("#form-group").focus();
		return false
	}
}

 </script>
</head>
<body>
 	<div class="container">
        <div class="out-container">
            <div class="in-container">
                <div class="text-header">
                    <h1>일력거 회원가입</h1>
                </div>
                <form class="user" id="iMemJoinForm" action="joins" method="post">
                	<input type="hidden" name="memNo" value="${param.memNo}">
                    <input type="hidden" name="joinType" value="iMem">
                    <div class="input-member">
                        <input type="checkbox" name="iM" id="iM" readonly>
                        <label for="iM" id="iML">개인회원 세부입력</label>
                        <!-- <input type="checkbox" name="cM" id="cM"><label for="cM" id="cML">기업</label> -->
                    </div>

                    <div class="input">
                        <input type="text" placeholder="생년월일(6자리)" id="birth" name="birth" onchange="changeCheck(birthCheck(), birth)">
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="form-group" onchange="changeCheck(genderCheck(), genderBox)">
                        <div id="genderBox">
                            성별
                            <input type="radio" name="gender" id="men" value="0"><label for="men">남성</label>
                            <input type="radio" name="gender" id="women" value="1"><label for="women">여성</label>
                        </div>
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="input">
                        <input type="button" onclick="execDaumPostcode()" value="주소검색" id="addrSchBtn" >
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="dtl">
                        <div class="input zip">
                            <input type="text" name="zip" id="zip" placeholder="우편번호" readonly>
                        </div>
                        <div class="input addr">
                            <input type="text" name="addr" id="addr" placeholder="주소" readonly>
                        </div>
                    </div>
                    <div class="input">
                        <input type="text" name="dtlAddr" id="dtlAddr" placeholder="상세주소" readonly onchange="changeCheck(dtlAddrCheck(), dtlAddr)">
                        <div class="check" style="background-image: url(resources/images/ca/check.png)" ></div>
                    </div>
                    <input type="hidden" id="extraAddress">
        			 <a id="iMemJoinBtn" href='javascript:void(0);'> 회원가입 </a>
                </form>
                <hr>
            </div>
        </div>
    </div>
</body>
</html>