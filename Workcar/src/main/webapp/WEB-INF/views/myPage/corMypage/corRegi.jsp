<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/default.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css">
<link rel="stylesheet" type="text/css" href="resources/css/cormypage/corinfo/Mypage_regi_cor.css">
<link rel="stylesheet" type="text/css" href="resources/css/cormypage/corinfo/csch.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/script/Mypage/header.js"></script>
<script src="resources/script/Mypage/Mypage_main_dp.js"></script>
<script src="resources/script/cormypage/corinfo/Mypage_regi_cor.js"></script>
<script src="resources/script/cormypage/corinfo/csch.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
function linkGo(url){
	location.href = url;
}
</script>

<body>
<%@include file="/resources/jsp/header.jsp"%>
	<main>
		<!-- Tab 버튼 태그 -->
			<div class="main_button_box">
				<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
				<button type="button" class="main_button" onclick="linkGo('mngancpage')">채용공고</button>
				<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
				<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
			</div>
			<!-- 메인 -->
			<div class="main_info">
				<div id="main_regi" class="main_content">
					<!-- 메인 메뉴 -->
					<div class="vertical_menu">
						<a href="#" class="regi_info">개인정보 설정</a> <a href="#"
							class="regi_corpoation">기업정보 설정</a> <a href="#"
							class="regi_update">비밀번호 변경</a>
					</div>
					<!-- 메인메뉴 종료 -->

					<!-- 받은 입사요청 -->
					<div class="main_box main_box_regi1">
						<div class="main_box_title_position">
							<h3 class="main_box_title main_box_title1">개인정보 설정</h3>
						</div>
						<div class="main_box_texts">
							<div>
								<div class="main_box_text">
									<p class="main_box_text1">아이디</p>
									<p class="main_box_text2">이름</p>
									<p class="main_box_text3">연락처</p>
									<p class="main_box_text4">이메일 주소</p>
									<p class="main_box_text5">소속</p>
									<p class="main_box_text6">직책</p>
									<p class="main_box_text7">이메일 수신 설정</p>
								</div>
							</div>
							<form action="#" method="post" id="uptinfoc">
								<div class="main_box_text_grid main_box_text_grid1">
									<input type="text" name ="C_ID"  id="C_ID" value="${data.ID}" readonly><Br>
									<input type="text" name ="C_NAME" id="C_NAME" value="${data.NAME}"> 
									<input type="text" name ="C_PHONE" id="C_PHONE" value="${data.PHONE}"> 
									<input type="text" name ="C_EMAIL" id="C_EMAIL" value="${data.EMAIL}">
									<input type="text" name ="C_CNAME"  value="${data.C_NAME}" readonly >
									<Br>
									<input type="text" name ="C_POS" id="C_POS" value="${data.POS}">
									<div class="email_permission">
										<div class="form-group">
											<div>
											
												관심내역 수신동의
													<input type="radio" name="INFOR_AGR" id="c1Y" value="0" <c:if test="${data.INFOR_AGR eq 0}">checked="checked"</c:if>/>
													<label for="custom1Y">동의</label>
													<input type="radio" name="INFOR_AGR" id="c1N" value="1" <c:if test="${data.INFOR_AGR eq 1}">checked="checked"</c:if>/>
													<label for="custom1N">비동의</label>
											</div>
											<div>
													활동내역 수신동의 
													<input type="radio" name="ACT_AGR" id="c2Y" value="0" <c:if test="${data.ACT_AGR eq 0}">checked="checked"</c:if>/>
													<label for="custom2Y">동의</label> 
													<input type="radio"name="ACT_AGR" id="c2N" value="1" <c:if test="${data.ACT_AGR eq 1}">checked="checked"</c:if>/>
													<label for="custom2N">비동의</label>
											</div>
										</div>
									</div>
								</div>
							</form>
							<div class="main_box_text_grid">
								<div class="main_content_button">
									<div class="main_content_button_div main_regi_secession_button">
										<button class="main_regi_secession btn btn-primary"
											data-toggle="modal" data-target=".secession_process">회원탈퇴</button>
										<button id="uptinfo">수정</button>
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="main_box main_box_regi2">
						<div class="main_box_title_position">
							<h3 class="main_box_title main_box_title1">기업정보 설정</h3>
						</div>
						<form action="#" id="uptCpInfoForm" method="post">
							<div>
								<div class="content ">
									<div class="dtl">
										<button type="button" id="uptcpinfo">저장</button>
										<div class="con">
											<div class="company">
												<div class="text">기업로고</div>
													<div class="input">
														<img class="logo" id ="logo" name ="logo" src="">
													</div>
												<div>	
													<button type="button" id="picuptbtn">사진올리기</button>
													<button type="button" id="delpictbtn">파일삭제</button>
												</div>
											</div>

											<div class="company">
												<div class="text">기업명</div>
												<div class="input">
													<input type="text" name="C_CNAME" id ="C_CNAME" value="${data.C_NAME}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">법인등록번호</div>
												<div class="input">
													<input type="text" name="CORP_NO" id="CORP_NO" value="${data.CORP_NO}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">사업자등록번호</div>
												<div class="input">
													<input type="text" name="C_BIZNO" id="C_BIZNO" value="${data.C_BIZNO}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">대표자명</div>
												<div class="input">
													<input type="text" name="C_BOSS" id="C_BOSS" value="${data.C_BOSS}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">대표 연락처</div>
												<div class="input">
													<input type="text" id="CP_TEL" name="CP_TEL"  value="${data.C_TEL}" placeholder="대표 연락처">
												</div>
											</div>
											
											<div class="company">
												<div class="text">대표 이메일</div>
												<div class="input">
													<input type="text" id="CP_EMAIL" name="CP_EMAIL" value="${data.C_EMAIL}"  placeholder="대표 이메일">
												</div>
											</div>
											<div class="company">				
												<div class="text">주소검색</div>									
												<div class="input">
												<button type="button" id="schaddr">주소검색</button>	
												</div>		
											</div>
											<div class="company">
												<div class="text">우편번호</div>
												<div class="input">
													<input type="text" id="ZIP" name ="ZIP" value="${data.ZIP}" readonly placeholder="우편번호">
												</div>
											</div>
											<div class="company">
												<div class="text">주소</div>
												<div class="input">
													<input type="text" id="ADDR" name="ADDR" readonly placeholder="주소" value="${data.ADDR}">
												</div>
											</div>
											<div class="company">
												<div class="text">상세주소</div>
												<div class="input">
													<input type="text" id="ADDR_DTL" name ="ADDR_DTL" placeholder="상세주소" value="${data.ADDR_DTL}">
												</div>
											</div>

											<div class="company">
												<div class="text">홈페이지 주소</div>
												<div class="input">
													<input type="text" name="C_HPAGE" id="C_HPAGE" value="${data.C_HPAGE}" placeholder="홈페이지 주소">
												</div>
											</div>
											<input type ="hidden" name ="CORP_IMG" id="CORP_IMG" value ="${data.CORP_IMG}">

										</div>
										

										
									</div>
								</div>

							</div>
						</form>
			
		<div id="fileFormh">	
			<form id="cprofileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
				<input type="file" name="cprofile" id="cprofile" >
			</form>	
		</div>
				
				


</div>					

					<div class="main_box main_box_regi3">
						<div class="main_box_title_position">
							<h3 class="main_box_title main_box_title1">비밀번호 변경</h3>
						</div>
						<form action="#" id="changePass" method="post">
							<input type="hidden" name="ID" id="ID" value="${data.ID}">
							<div class="main_box_text_grid">
								<p>현재 비밀번호</p>
								<input type="password" id ="nowpass" name ="nowpass">
								<input class="chkpassbtn" type="button" id ="chkPassBtn" value="비밀번호확인">
							
								<p>새 비밀번호</p>
								<input type="password" id ="newpass" name ="newpass" placeholder="새로운 비밀번호"> 
								<input type="password" id="newpasschk" name="newpasschk" placeholder="비밀번호 확인">
							</div>
						</form>
						<div class="main_box_text_grid">
							<div class="main_content_button">
								<div class="main_content_button_div main_content_button_div1">
									<button id ="chgePassBtn">비밀번호 변경</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 -->
		</div>
		<div class="secession_process modal fade bd-example-modal-xl"
			tabindex="-1" role="dialog" aria-labelledby="process_title"
			aria-hidden="true" id ="modal">
			<div class="modal-dialog .modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="process_title">회원 탈퇴</h3>
					</div>
					<div class="modal-body">
					<form id ="outpassform">
						<div class="modal_last_pw">
						   <input class="form-control" type="hidden" name="ID" id="ID" value="${data.ID}">
							<div class="modal_subject" aria-placeholder="현재 비밀번호 입력">비밀번호확인</div>
							<input type="password" name="outpasschk" id="outpasschk"  class="form-control">
						</div>
					</form>
						<div class="modal_last_notification">
							<div class="modal_subject modal_notification">탈퇴 안내 사항</div>
							<div>
								<p>
									<strong>탈퇴 후 회원정보가 모두 삭제됩니다.</strong><br/> 메일주소, 핸드폰 번호/기타 연락처
									등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
								</p>
								<p>
									<strong>탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.</strong><br/> 각 게시판에 등록한
									게시물 및 댓글은 탈퇴 후에도 남아있습니다. 삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다. (탈퇴
									후에는 게시글 임의 삭제 요청을 받지 않습니다.)
								</p>
							</div>
						</div>
						<div class="modal_button">
							<button id ="outmember" class="btn btn-primary submit modal-btn">처리</button>
							<button class="btn btn-primary modal-btn" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	
	<div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
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

                            </tr>
                        </thead>
                        <tbody>
                            <!-- ㅇ -->
                            <tr>

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
	
	
</body>
<%@include file="/resources/jsp/footer.jsp"%>

<script>

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

</script>

</html>