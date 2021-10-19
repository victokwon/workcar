<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources/css/ca/cmjoin.css" >
 <link rel="stylesheet" type="text/css" href="resources/css/ca/csch.css" >
 
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 

<script type="text/javascript" src="resources/script/ca/cmemjoin.js"></script>
<script type="text/javascript" src="resources/script/ca/csch.js"></script> 
<script type="text/javascript">
$(function () {
	if($("#memNO").val()==""){
		location.href = "join"
	}
	  $("#cMemJoinBtn").on("click", function () {
	    if (check()) {
	    	formSubmit()
	    }
	  });
	});
	
function formSubmit(){
	 var params = $("#cMemJoinForm").serialize();
	 
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
	  cNameCheck()&&
	  posCheck()&&
	  addrCheck()&&
	  dtlAddrCheck() 
	  ) {
	    return true;
	  } else {
	    return false;
	  }
	}
/* 기업검색 여부 확인 */	
function cNameCheck(){
	  if ($("#cName").val() == "") {
		    alert("기업검색을 해주세요");
		    $("#cSchBtn").focus();
		    return false;
		  }
	  return true;
}
/* 직책 유효성 */
function posCheck(){
	var getCheck = RegExp(/^[a-zA-Z0-9가-힣]{1,10}$/);
	  if ($("#pos").val() == "") {
		    alert("직책을 입력해주세요");
		    $("#pos").focus();
		    return false;
		  }
	  if (!getCheck.test($("#pos").val())) {
		    alert("직책혁식에 맞게 입력해주세요");
		    $("#pos").focus();
		    return false;
		  }
	  return true;
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
</script>
</head>
<body>
 <div class="pop-container">
        <div class="pop-out-container">
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1>기업검색</h1>
                </div>

                <form class="pop-user" id="companySchForm">
                	<input type="hidden" name="page" id="page" value="1">
                	<input type="hidden" name="itemCnt" id="itemCnt">
                    <div class="pop-input">
                        <input type="button" id="schBtn" value="검색">
                        <input type="text" name="schCName" id="schCName" placeholder="기업명">
                    </div>
                </form>

                <!-- 5개 리스트 -->
                <div class="company_wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>기업명</th>
                                <th>법인번호</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- ㅇ -->
                            <tr>
                                <td>기업</td>
                                <td>번호</td>
                            </tr>
                            <!-- ㅇ -->
                        </tbody>
                    </table>
                </div>
                <div class="paging_wrap"></div>
                <hr>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="out-container">
            <div class="in-container">
                <div class="text-header">
                    <h1>일력거 회원가입</h1>
                </div>
                <form id="cMemJoinForm" class="user" method="get">
               		<input type="hidden" name="memNo" id="memNO" value="${param.memNo}">
                    <input type="hidden" name="joinType" value="cMem">
                    <div class="input-member">
                        <input type="checkbox" name="cM" id="cM" readonly>
                        <label for="cM" id="cML">기업회원 세부입력</label>
                    </div>
                    <div class="input">
                        <input type="button" id="cSchBtn" value="기업검색" >
                       <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="dtl">
                        <div class="input">
                            <input type="text" placeholder="기업명" name="cName" id="cName" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="법인등록번호" name="corpNo" id="corpNo" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="상장여부" name="listChk" id="listChk" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="근로자수" name="wrkCnt" id="wrkCnt" readonly>
                        </div>
                        <input type="hidden" name="bzno" id="bzno">
                    </div>
                    <div class="dtl">
                        <div class="input">
                            <input type="text" placeholder="홈페이지주소" name="enpHmpgUrl" id="enpHmpgUrl" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="중소기업여부" name="smenpYn" id="smenpYn" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="대표자성명" name="enpRprFnm" id="enpRprFnm" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="업종코드" name="sicNm" id="sicNm" readonly>
                        </div>
                    </div>
                    <div class="input">
                        <input type="text" placeholder="직책" name="pos" id="pos" onchange="changeCheck(posCheck(), pos)">
                       <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="input">
                        <input type="button" onclick="execDaumPostcode()" value="주소검색" id="addrSchBtn">
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <div class="dtl">
                        <div class="input zip">
                            <input type="text" name="zip" id="zip" placeholder="우편번호" value="" readonly>
                        </div>
                        <div class="input addr">
                            <input type="text" name="addr" id="addr" placeholder="주소" value="" readonly>
                        </div>
                    </div>
                    <div class="input">
                        <input type="text" name="dtlAddr" id="dtlAddr" placeholder="상세주소" value="" readonly onchange="changeCheck(dtlAddrCheck(), dtlAddr)">
                        <div class="check" style="background-image: url(resources/images/ca/check.png)"></div>
                    </div>
                    <input type="hidden" id="extraAddress">
                    
                    <!-- 회원가입 넘기기 -->
                    
                    <a href="#" id="cMemJoinBtn">
                        회원가입
                    </a>
                </form>
                <hr>
            </div>
        </div>
    </div>
</body>
</html>