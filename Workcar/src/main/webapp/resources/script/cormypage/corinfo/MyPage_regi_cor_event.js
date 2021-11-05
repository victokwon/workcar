	// 수정버튼 클릭 이벤트
	$("#uptinfo").on("click",function(){
		
		if(!chkUptInfoChk())
			return false;
		
		if(confirm("수정하시겠습니까?")){
			uptInfoAjax();
		}else{
			return false;
		}
	});
	
	//유효성검사 합치기
	function chkUptInfoChk() {
		
		if(chkName() && chkEmail() && chkPhone()){
			return true;
		} else {
			return false;
		}
		
	}
	
	
	
	// 이름 유효성 검사
	function chkName() {
	
		var getCheck = RegExp(/^[a-zA-Z0-9가-힣]{3,12}$/);
		
		if($("#C_NAME").val() == ""){
			alert("이름을 입력해 주세요");
			$("#C_NAME").focus();
			return false;
		}
		
		if(!getCheck.test($("#C_NAME").val())){
			alert("이름형식에 맞게 입력해주세요");
			$("#C_NAME").val("");
			$("#C_NAME").focus();
			return false;
		}
		
		return true;
	}
	
	//전화번호 유효성 검사
	function chkPhone() {
		
		var getCheck = RegExp(/^[0-9]{10,11}$/);
		
		if($("#C_PHONE").val() == ""){
			alert("전화번호를 입력해 주세요");
			$("#C_PHONE").focus();
			return false;
		}
		
		if(!getCheck.test($("#C_PHONE").val())){
			alert("전화번호 형식에 맞게 입력해주세요");
			$("#C_PHONE").val("");
			$("#C_PHONE").focus();
			return false;
		}
		
		return true;
	}
		
	
	// 이메일 유효성 검사
	function chkEmail() {
		
		var getCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
		if($("#C_EMAIL").val() == ""){
			alert("이메일을 입력해 주세요");
			$("#C_EMAIL").focus();
			return false;
		}
		
		if(!getCheck.test($("#C_EMAIL").val())){
			alert("이메일 형식에 맞게 입력해주세요");
			$("#C_EMAIL").val("");
			$("#C_EMAIL").focus();
			return false;
		}
		
		return true;
	}
		

	// 개인정보 수정 Ajax
	function uptInfoAjax() {
	var params = $("#uptinfoc").serialize();
	 $.ajax({
		 data : params,
		 type : "post",
		 dataType : "json",
		 url : "uptInfoAjax",
		 success : function(res) {
			 if(res.result =="success") {
			 	alert("수정완료되었습니다.");
			 	location.href="corRegi";
			 
			 }else if (res.result =="failed"){
				alert("수정오류")
			 }
		 },
		error : function (request,status,error) {
			console.log(error);
			} 
	 });
 }

	$("#schaddr").on("click",function(){
		execDaumPostcode();
		
	});
	
// 주소검색

function execDaumPostcode() {
	
    new daum.Postcode({

        oncomplete: function(data) {

        	 var addr = ''; // 주소 변수

        	 var extraAddr = ''; // 참고항목 변수
        	 
             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }
        	 
             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 document.getElementById("ADDR_DTL").value = extraAddr;
             
             } else {
                 document.getElementById("extraAddress").value = '';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById("ZIP").value = data.zonecode;
             document.getElementById("ADDR").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("ADDR_DTL").focus();
        }

    }).open();
}