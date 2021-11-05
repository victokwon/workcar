$(document).ready(function(){
	
	// 파일폼 숨김처리
	$("#fileFormh").hide();
	//프로필사진 삭제버튼 숨김처리
	$("#delpictbtn").hide();
	// 현재 비밀번호 확인 체크
	var chkpass = 0;
	// 파일업로드 체크
	var chkfileupt = 0;
	
	
	//이미지 파일 체크
	(function(){
		var img = "${data.CORP_IMG}";
	if(img != "") {
		$("#logo").attr("src","resources/upload/"+img);
	} else {
		$("#logo").attr("src","resources/images/cmypage/profile.png");
	}
	})();
	
	
	
	//기본메뉴 설정
	 $("#cmyinfopage").click(); 

	
	
	if($("#CORP_IMG").val() != "") {
		chkfileupt = 1;
		$("#picuptbtn").html("수정하기");
		$("#delpictbtn").show();
	}
	
	
	$("#empannc").on("click",function(){
		location.href="/empannc";
	});
	$("#defaultmenu").on("click",function(){
	location.href="/cmyinfopage";
	});
	
	
	// 프로필사진 업로드 버튼 이벤트 처리
	$("#picuptbtn").on("click",function(e){
		
		e.preventDefault();
		
		$("#cprofile").click(); 
		

		
	});
	
	
	// 파일을 선택하면 수정 여부에 관계없이 업로드실행
	$("#cprofile").on("change",function(){
		
		var fileForm = $("#cprofileForm");
		
		
		fileForm.ajaxForm({
			
			success: function(res){
				if(res.result == "SUCCESS"){
					
					if(res.fileName.length>0){
						
						$("#CORP_IMG").val(res.fileName[0]);
						chkfileupt = 1;
						
						$("#logo").attr("src","resources/upload/"+res.fileName[0]);
						
						$("#picuptbtn").html("수정하기");
						$("#delpictbtn").show();
						

					}
				}else {
					alert("저장실패");
				}
			},
			error : function(req,status,error) {
				alert("에러발생");
			}
			
		});
		
			fileForm.submit();
		
	});
	
	
	//파일삭제 버튼 누르면 원상복구하기
	$("#delpictbtn").on("click",function(){
		
		$("#CORP_IMG").val("");
		$("#delpictbtn").hide();
		chkfileupt = 0;
		$("#picuptbtn").html("사진올리기");
		alert("삭제가 완료되었습니다.")
		$("#logo").attr("src","resources/images/cmypage/profile.png");
	});
	



// 탈퇴처리

 $("#outmember").on("click",function(){
	 
	 
	 var param = $("#outpassform").serialize();
	 

	 if($("#outpasschk").val() == "") {
		 alert("비밀번호를 입력하세요");
		 return false;
	 }
	 
		
	 $.ajax({
		 
		 url : "outMemberAjax",
		 data: param,
		 dataType : "json",
		 type : "post",
		 success : function(res) {
			 
			 if(res.result == "success") {
				 alert("회원탈퇴가 완료되었습니다. 메인페이지로 이동합니다.");
				 $("#modal").modal("hide");
				 sessionStorage.clear();
				 location.href="/mainpage";
				 
			 }else {
				 alert("비밀번호가 틀립니다.");
			 }
		 },
		 error : function(request,status,error) {
			 alert("오류발생");
		 }
		
		 
		 
	 });
	 
 });



//비밀번호 변경 저장

$("#chgePassBtn").on("click",function(e){
 	
	e.preventDefault();
	
	if(chkpass != 1 ) {
		alert("현재 비밀번호 확인을 해주세요");
		return false;
	}
	

	newpasschk();
	uptNewPass();
	
});

//비밀번호 수정 Ajax

function uptNewPass() {
	
	var param = $("#changePass").serialize();
	
	$.ajax({
		
		url : "uptNewPassAjax",
		data : param,
		dataType : "json",
		type : "post",
		success : function(res) {
			
			if(res.result =="success") {
				alert("비밀번호가 수정되었습니다");
				location.href="corRegi";
			}else {
				alert("비밀번호 수정 실패");
			}
		},
		error : function(request,status,error) {
			console.log(error);
			alert("비밀번호가 틀립니다");
		}
		
	});
	
	
	
}



//비밀번호 수정 전 확인버튼 check

$("#chkPassBtn").on("click",function(e){
	
	e.preventDefault();
	
	if($("#nowpass").val() == ""){
		alert("비밀번호를 입력해주세요");
		$("#nowpass").focus();
		return false;
	} else {
		passchk();
	}
	
	
});




//현재 비밀번호 확인 Ajax
function passchk() {
	
	var param = $("#changePass").serialize();
		
	$.ajax({
		
		url : "ChnPassAJax",
		data : param,
		dataType: "json",
		type : "post",
		success : function(res) {
			if(res.result =="success") {
				alert("현재 비밀번호가 확인되었습니다.");
				chkpass = 1;
				$("#chkPassBtn").attr("disabled", true);
				$("#chkPassBtn").val("확인완료");
				$("#nowpass").hide();
				return true;
			}else {
				alert("비밀번호가 틀립니다1");
				$("#nowpass").val("");
				$("#nowpass").focus();
				return false;
			}
		},
		error:function(request,status,error) {
			console.log(error);
			alert("비밀번호가 틀립니다0");
		}
		
	});
	}
	

//비밀번호 수정시 유효성체크

function newpasschk() {
	
	if($("#newpass").val()=="" || $("#newpasschk").val()==""){
		
		alert("비밀번호 또는 확인란을 입력해주세요");	
		return false;
	} 
	
	
if($("#newpass").val() == $("#newpasschk").val()) {
		return true
	}else{
		alert("비밀번호 확인을 해주세요");
		$("#newpass").val("");
		$("#newpasschk").val("");
		$("#newpass").focus();
		return false;
	}
	
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	
	if(!getCheck.test($("#newpass").val())){
		alert("비밀번호 형식이 올바르지 않습니다.");
		$("#newpass").val("");
		$("#newpasschk").val("");
		$("#newpass").focus();
		return false;
	}
	
		return true;
	
}

	
//기업정보설정 저장
$("#uptcpinfo").on("click",function(){
	
	if(!chkUptCpInfoChk()){
		return false;
	}else {
	
		if(confirm("수정하시겠습니까?"))
			uptCpInfoAjax();
		
	}
		

	
	
});


//기업정보 수정 Ajax

function uptCpInfoAjax() {
	
	var params = $("#uptCpInfoForm").serialize();
	
	$.ajax({
		
		url :"uptCpInfoAjax",
		data : params,
		type: "post",
		dataType:"json",
		success:function(res){
			if(res.result =="success") {
				alert("수정완료되었습니다").
				location.href="cmyinfopage";
			}else if(res.result =="failed") {
				alert("수정오류");
			}
		},
		error:function(request,status,error) {
			console.log(error);
		}
	});
	
}


//기업정보수정 유효성 검사
function chkUptCpInfoChk(){
	
	if(chkCpTel() && chkCpEmail() ) {	
		return true;
	}else {
		return false;
	}
	
	
}
	

//기업전화번호 유효성 검사
function chkCpTel(){
	
	var getCheck = RegExp(/^[0-9]{8,13}$/);
	
	if($("#CP_TEL").val() == "") {
		alert("대표번호를 입력해 주세요");
		$("#CP_TEL").focus();
		return false;
	}
	
	if(!getCheck.test($("#CP_TEL").val())){
		alert("전화번호는 숫자만 입력 가능합니다.")
		$("#CP_TEL").val("");
		$("#CP_TEL").focus();
		return false;
	}
	
	return true;
}


//기업이메일 유효성 검사
function chkCpEmail() {
	
	var getCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	if($("#CP_EMAIL").val() == ""){
		alert("이메일을 입력해 주세요");
		$("#CP_EMAIL").focus();
		return false;
	}
	
	if(!getCheck.test($("#CP_EMAIL").val())){
		alert("이메일 형식에 맞게 입력해주세요");
		$("#CP_EMAIL").val("");
		$("#CP_EMAIL").focus();
		return false;
	}
	return true;
}




// 개인정보 설정 저장
$("#uptinfo").on("click",function(){
	
	if(!chkUptInfoChk())
		return false;
	
	if(confirm("수정하시겠습니까?"))
		uptInfoAjax();
	
});

//유효성검사 개인정보설정
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

//휴대폰 유효성 검사
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
		 	location.href="cmyinfopage";
		 
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



});