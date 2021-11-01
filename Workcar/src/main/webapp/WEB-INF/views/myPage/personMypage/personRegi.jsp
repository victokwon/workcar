<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/common/main.css">
    <link rel="stylesheet" href="resources/css/common/default.css">
    <link rel="stylesheet" href="resources/css/common/footer.css">
    <link rel="stylesheet" href="resources/css/Mypage/personMypage/Mypage_regi.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <style type="text/css">
    .main_content{
		height:1000px;
	} 
	.main_info {
		height:auto;
	} 
	.pic {
		width: 50px;
		/* position: absolute;
        right: 800px; */
         
	} 
	.fileForm {
		display: none;
	} 
    </style>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="resources/script/Mypage/header.js"></script>
    <script src="resources/script/Mypage/Mypage_main_dp.js"></script>
    <script src="resources/script/Mypage/personMypage/Mypage_regi.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#PerIntBtn").on("click", function() {
			location.href = "personInter";
		});
	
		$("#PerResBtn").on("click", function() {
			location.href = "resumeList";
		});
	
		$("#PerActBtn").on("click", function() {
			location.href = "personAct";
		});
		
		$("#cancelBtn").on("click",function(){
			   history.back();
		});
			   
		//첨부파일 버튼 (attach를 줄여서 att)
		$("#fileBtn").on("click", function() {
			$("#att").click();
		});
				
		//첨부파일 선택 시 (파일첨부하면 파일명이 버튼옆에 뜬다. \\는 \를 문자로 인식시키기 위해 두번 쓴 것.)
		$("#att").on("change", function() {
			$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
			$("#fileDelBtn").show();
			uploadAjax();
		});
				
		//첨부파일 삭제버튼
		$("#fileDelBtn").on("click", function(){
			$("#fileName").html(""); //사용자에게 보여지는 파일명.파일명 안보여주려고 html에 공백으로 넣음
			$("#profPic").val(""); //DB에 올라갈 파일명
			$("#profile").attr("src","resources/images/profile.png");
			$("#fileDelBtn").hide();
			/* $(this).remove(); */ //첨부파일 삭제버튼 제거
		});
		
		// 정보수정 버튼 클릭시
		$("#updateBtn").on("click", function() {
			if(checkVal("#phone")) { //입력체크
				alert("휴대폰 번호를 입력해 주세요.");
				$("#phone").focus();
			} else if (checkVal("zip")) {
				alert("우편번호를 입력해 주세요.");
				$("#zip").focus();
			} else if (checkVal("addr")) {
				alert("주소를 입력해 주세요.");
				$("#addr").focus();
			}else if (checkVal("addrDtl")) {
				alert("상세주소를 입력해 주세요.");
				$("#addrDtl").focus();
			}else if (checkVal("email")) {
				alert("이메일 주소를 입력해 주세요.");
				$("#email").focus();
			}else {
				var fileForm = $("#fileForm");
				
				fileForm.ajaxForm({
					success : function(res) {
						if(res.result == "SUCCESS") {
							// 업로드 파일명 적용
							if(res.fileName.length > 0) { //업로드한 파일이 있는 경우
								$("#profPic").val(res.fileName[0]);
							}
							
							//글 수정
							var params = $("#updateForm").serialize();  //데이터를 문자열화
							
							$.ajax({
								url: "updateInfoAjax",   //이 주소로 데이터 주고받을거야
								type: "post",
								dataType: "json",  
								data: params,
								success: function(res) { 
									if(res.result == "success") { // 성공시 그냥 로케이션 이동
										location.href = "testABList";
									} else if(res.result == "failed") {
										alert("수정에 실패하였습니다.");
									} else {
										alert("수정중 문제가 발생했습니다.");
									}
								},
								error: function(request, status, error) {
									console.log(error);
								} 
							});
						}else {
							alert("파일업로드에 실패하였습니다.");
						}
					},
					error: function(req, status, error) {
						console.log(error);
						alert("파일 업로드중 문제가 발생하였습니다.");	
					} 
				});
				fileForm.submit();
			} //else end
		}); //updateBtn click end
		
		//비밀번호 변경 버튼 클릭시
		$("#updatePassBtn").on("click", function(){
			if($("#pw").val() != "") { // 비밀번호를 변경할 경우
				if(checkVal("#ocpw")) { // 현재비밀번호 입력여부
					alert("현재 비밀번호를 입력해 주세요.");
					$("#ocpw").focus();
				} else if($("#opw").val() == $("#ocpw").val()) { // 실 비밀번호와 입력된 현재비밀번호 비교
					if(checkVal("#repw")) {
						alert("비밀번호 확인을 입력해 주세요.");
						$("#repw").focus();
					} else if($("#pw").val() != $("#repw").val()) {
						alert("비밀번호 확인이 일치하지 않습니다.");
						$("#pw").val("");
						$("#repw").val("");
						$("#pw").focus(); 
					} else {
						updatePassAjax();
					}
				} else { // 비교 결과 같지 않은 경우
					alert("기존 비밀번호가 일치하지 않습니다.");
						$("#ocpw").val("");
						$("#ocpw").focus();
				}
			} /* else if(checkVal("#nm")) {
				alert("이름을 입력해 주세요.");
				$("#nm").focus(); 
			} */else {
				updatePassAjax();								
			} 
		});
	});
	//개인정보 변경 Ajax
	function updateInfoAjax() {
		
		var params = $("#updateForm").serialize();  //데이터를 문자열화
		$.ajax({
			url: "updateInfoAjax",   //이 주소로 데이터 주고받음
			type: "post",
			dataType: "json",  
			data: params,
			success: function(res) { 
				if(res.result == "success") { // 성공시 그냥 로케이션 이동
					alert("수정완료되었습니다");
					location.href="personRegi";
				} else if(res.result == "failed") {
					alert("수정에 실패하였습니다.");
				}  else {
					alert("수정중 문제가 발생했습니다.");
				} 
			},
			error: function(request, status, error) {
				console.log(error);
			}
		});	

	}
	
	
	//파일 업로드 ajax
	function Ajax() {
		var fileForm = $("#fileForm");	
		fileForm.ajaxForm({
			success : function(res) {
				if(res.result == "SUCCESS") {
					// 업로드 파일명 적용
					if(res.fileName.length > 0) { //업로드한 파일이 있는 경우
						$("#profPic").val(res.fileName[0]);
						//상세보기화면으로 넘어가기 전에 업로드하는 사진을 전송
						$("#profile").attr("src","resources/upload/"+res.fileName[0]); 
						
					}
				
				}else {
					alert("파일업로드에 실패하였습니다.");
				}
		},
		error: function(req, status, error) {
			console.log(error);
			alert("파일 업로드중 문제가 발생하였습니다.");	
		} 
	});
		fileForm.submit();
	} 
	
	//비밀번호 변경 Ajax
	function updatePassAjax() {
		//
		var params = $("#updateForm").serialize();  //데이터를 문자열화
		$.ajax({
			url: "updatePassAjax",   //이 주소로 데이터 주고받음
			type: "post",
			dataType: "json",  
			data: params,
			success: function(res) { 
				if(res.result == "success") { // 성공시 그냥 로케이션 이동
					alert("수정완료되었습니다");
					location.href="personRegi";
				} else if(res.result == "failed") {
					alert("수정에 실패하였습니다.");
				} else {
					alert("수정중 문제가 발생했습니다.");
				}
			},
			error: function(request, status, error) {
				console.log(error);
			}
		});	

	}
				
	function checkVal(sel){
		if($.trim($(sel).val()) == ""){
			return true;
		}else {
			return false;
		}   
	}
	</script>
</head>
<body>
<!-- 헤더 -->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div onclick="linkGo()">채용정보</div>
				<li id="">통합검색</li>
				<li id="">조회수 100</li>
				<li id="">평점 100</li>
			</ul>
			<ul>
				<div id="">기업정보</div>
				<li id="">통합검색</li>
			</ul>
			<ul>
				<div id="">인재정보</div>
				<li id="">통합검색</li>
			</ul>
			<ul>
				<div id="">참여공간</div>
				<li id="">공지사항</li>
				<li id="">자주하는 질문</li>
			</ul>
			<c:choose>
				<c:when test="${sMTy eq 0}">
					<ul>
						<div id="">마이페이지</div>
						<li id="">계정관리</li>
						<li id="">이력서관리</li>
						<li id="">활동내역</li>
						<li id="">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<ul>
						<div id="">마이페이지</div>
						<li id="">계정관리</li>
						<li id="">채용공고</li>
						<li id="">활동내역</li>
						<li id="">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<ul>
						<div id="">마이페이지</div>
						<li id="">계정관리</li>
						<li id="">회원관리</li>
						<li id="">신고관리</li>
						<li id="">평점관리</li>
					</ul>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="side_bcc" id="side_bcc" onclick="closeNav()"></div>

	<header>
		<!-- 네비게이션바 -->
		<div class="topnav">

			<!-- 로고 -->
			<div class="topnav-centered">
				<div class="logo_img"></div>
			</div>

			<!-- 왼쪽 -->
			<div class="hambuger" onclick="openNav()" id="hambuger_left">
				<div></div>
				<div></div>
				<div></div>
			</div>

			<!-- 오른쪽 -->
			<!-- 링크작업 -->
			<c:choose>
				<c:when test="${sMTy eq 0}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#iMemMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#cMemMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#mngMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="topnav-right">
						<a href="login"><strong>로그인</strong></a> <a href="join"><strong>회원가입</strong></a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
    <main>
        <div class="main_wrap">
            <div class="user_wrap">
                <div class="user_box">
                    <div class="user_profile"></div>
                    <div class="user">
                        <div class="user_name"></div>
                        <div class="user_status"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tab 버튼 태그 -->
        <div class="main_button_box">
        	<input type="button" class="main_button" onclick="openPage('main_regi', this)" value="계정관리" id="defaultOpen" />
            <input type="button" class="main_button" onclick="openPage('main_apply', this)" value="이력서관리" id="PerResBtn" />
            <input type="button" class="main_button" onclick="openPage('main_act', this)" value="활동내역" id="PerActBtn" />
            <input type="button" class="main_button" onclick="openPage('main_inter', this)" value="관심정보" id="PerIntBtn" />
        </div>
            <!-- 메인 -->
            <div class="main_info">
                <div id="main_regi" class="main_content">
                    <!-- 메인 메뉴 -->
                    <div class="vertical_menu">
                        <a href="#" class="regi_info">개인정보 설정</a>
                        <a href="#" class="regi_update">비밀번호 변경</a>
                    </div>
                    <!-- 메인메뉴 종료 -->

                    <!-- 받은 입사요청 -->
                    <div class="main_box main_box_regi1">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">개인정보 설정</h3>
                        </div>
                        <div class="main_box_texts">
                            
                                <div class="main_box_text">
                                    <p class="main_box_text1">프로필 사진</p>
                                    <p class="main_box_text2">아이디</p>
                                    <p class="main_box_text3">이름</p>
                                    <p class="main_box_text4">생년월일</p>
                                    <p class="main_box_text5">성별</p>
                                    <p class="main_box_text6">연락처</p>
                                    <p class="main_box_text7">우편번호</p>
                                    <p class="main_box_text8">주소</p>
                                    <p class="main_box_text9">상세주소</p>
                                    <p class="main_box_text10">이메일 주소</p>
                                    <p class="main_box_text11">이메일 수신 설정</p>
                                </div>
                            <div class="fileForm">
                            <form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
								<input type="file" name="att" id="att" /> <!-- <= 첨부파일 갯수를 늘리고 싶으면 이것을 더 만들고 부가작업하면 됨. -->
							</form>
							</div>
                            <form action="#" id="updateForm" method="post">
                            	<input type="hidden" name="gbn" value="u" />
								<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
								<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
								<input type="hidden" name="page" value="${param.page}" />
								<input type="hidden" name="no" value="${param.no}" />
                                <div class="main_box_text_grid">
                                    <div class="proPic">
										<c:choose>
											<c:when test="${!empty data.PROF_PIC}">
												<img alt="img" src="resources/upload/${fn:replace(fn:replace(data.PROF_PIC, '[','%5B'),']', '%5d')}" id="profile">
											</c:when>
											<c:otherwise>
												<img alt="img" src="resources/images/profile.png" id="profile">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="pic">
									
									<c:choose>
										<c:when test="${!empty data.PROF_PIC}">
											<input type="button" value="사진변경" id="fileBtn" />
											<input type="button" value="첨부파일삭제" id="fileDelBtn" />
										</c:when>
										<c:otherwise>
											<input type="button" value="사진추가" id="fileBtn" />
											<input type="button" value="첨부파일삭제" id="fileDelBtn" class="hide_btn" />
										</c:otherwise>
									</c:choose>
									<c:set var="len" value="${fn:length(data.PROF_PIC)}"></c:set>
									<span id="fileName">${fn:substring(data.ATTCH_NAME, 20, len)}</span><!-- 현재 등록되어있는 파일명 -->
									</div>
									<input type="hidden" name="profPic" id="profPic" value="${data.PROF_PIC}" /><!-- DB저장용 -->
                                    <input type="text" id="id" name="id" value="${data.ID }" readonly/> 
                                   	<input type="text" id="name" name="name" value="${data.NAME}" readonly/>
                                    <input type="text" id="birth" name="birth" value="${data.BIRTH }" readonly/>
                                    <input type="text" id="gender" name="gender" value="${data.CAT_NAME}" readonly/>
                                    <input type="text" id="phone" name="phone" value="${data.PHONE}"/>
                                    <input type="text" id="sample3_postcode" name="zip" placeholder="우편번호" value="${data.ZIP }">
									<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="sample3_address" name="addr" placeholder="주소" value="${data.ADDR }"><br>
									<input type="text" id="sample3_detailAddress" name="addrDtl" placeholder="상세주소" value="${data.ADDR_DTL }">
									<!-- <input type="text" id="sample3_extraAddress" placeholder="참고항목"> -->
									<input type="text" id="email" name="email" value="${data.EMAIL }" readonly />
									<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
									</div>

									<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
    									// 우편번호 찾기 찾기 화면을 넣을 element
    									var element_wrap = document.getElementById('wrap');

    									function foldDaumPostcode() {
        								// iframe을 넣은 element를 안보이게 한다.
       									 element_wrap.style.display = 'none';
    									}

    									function sample3_execDaumPostcode() {
       									 // 현재 scroll 위치를 저장해놓는다.
       									 var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
       									 new daum.Postcode({
           									 oncomplete: function(data) {
               							 // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
                    						document.getElementById("sample3_extraAddress").value = extraAddr;
                
							                } else {
                    						document.getElementById("sample3_extraAddress").value = '';
                							}
	
    	            						// 우편번호와 주소 정보를 해당 필드에 넣는다.
                							document.getElementById('sample3_postcode').value = data.zonecode;
                							document.getElementById("sample3_address").value = addr;
                							// 커서를 상세주소 필드로 이동한다.
                							document.getElementById("sample3_detailAddress").focus();

                							// iframe을 넣은 element를 안보이게 한다.
                							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                							element_wrap.style.display = 'none';

                							// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                							document.body.scrollTop = currentScroll;
            								},
            								// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            								onresize : function(size) {
                							element_wrap.style.height = size.height+'px';
            								},
            								width : '100%',
            								height : '100%'
									        }).embed(element_wrap);

									        // iframe을 넣은 element를 보이게 한다.
        									element_wrap.style.display = 'block';
										    }
											
    									</script>                        		
                                    <div class="email_permission">
                                        <div class="form-group">
                                            <div>
                                                관심내역 수신동의
                                                <input type="radio" name="custom1" id="custom1Y" value="0"><label
                                                    for="custom1Y">동의</label>
                                                <input type="radio" name="custom1" id="custom1N" value="1"><label
                                                    for="custom1N">비동의</label>
                                            </div>
                                            <div>
                                                활동내역 수신동의
                                                <input type="radio" name="custom2" id="custom2Y" value="0"><label
                                                    for="custom2Y">동의</label>
                                                <input type="radio" name="custom2" id="custom2N" value="1"><label
                                                    for="custom2N">비동의</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="main_box_text_grid">
                                <div class="main_content_button">
                                    <div class="main_content_button_div">
                                        <button class="main_regi_secession btn btn-primary" data-toggle="modal"
                                            data-target=".secession_process">회원탈퇴</button>
                                        <input type="button" value="수정" id="updateInfoBtn" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_box main_box_regi2">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">비밀번호 변경</h3>
                        </div>
                        <form action="">
                            <div class="main_box_text_grid">
                                <input type="hidden" id="opw" value="${data.PASS}" />
                                <p>현재 비밀번호</p>
                                <input type="password" id="ocpw" />
                                <p>새 비밀번호</p>
                                <input type="password" id="pw" name="pw" placeholder="비밀번호 (10자리이상)">
                                <input type="password" id="repw" placeholder="비밀번호 확인">
                            </div>
                        </form>
                        <div class="main_box_text_grid">
                            <div class="main_content_button">
                                <div class="main_content_button_div">
                                    <input type="button" value="비밀번호 변경" id="updatePassBtn" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 -->
            <div class="secession_process modal fade bd-example-modal-xl" tabindex="-1" role="dialog"
            aria-labelledby="process_title" aria-hidden="true">
            <div class="modal-dialog .modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="process_title">회원 탈퇴</h3>
                    </div>
                    <div class="modal-body">
                        <div class="modal_last_pw">
                            <div class="modal_subject" aria-placeholder="현재 비밀번호 입력">비밀번호 확인</div>
                            <textarea name="" id="" cols="60" rows="1" class="modal_text_area"></textarea>
                        </div>
                            <div class="modal_last_notification">
                                <div class="modal_subject modal_notification">탈퇴 안내 사항</div>
                                <div>
                                <p> <strong>탈퇴 후 회원정보가 모두 삭제됩니다.</strong><br/>
                                    메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
                                </p>
                                <p>
                                <strong>탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.</strong><br/>
                                    각 게시판에 등록한 게시물 및 댓글은 탈퇴 후에도 남아있습니다.
                                    삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다.
                                    (탈퇴 후에는 게시글 임의 삭제 요청을 받지 않습니다.)
                                </p>
                            </div>
                            </div>
                            <div class="modal_button">
                                <button class="btn btn-primary submit modal-btn">처리</button>
                                <button class="btn btn-primary modal-btn" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                        </div>
                </div>
            </div>
    </main>
    <footer>
		<!-- 링크작업 -->
		<div class="inner_content">
			<div id="regi">계정관리</div>
			<div id="">이력서관리</div>
			<div id="act">활동내역</div>
			<div id="inter">관심정보</div>
		</div>
		<div class="footer_dtl_wrap">
			<div class="footer_dtl_contents">
				<div class="footer_logo"></div>
				<div class="footer_dtl_contents_1">명칭 (주)일력거 | 사업자등록번호
					123-456-7891011</div>
				<div class="footer_dtl_contents_2">등록일자 2021년 9월 ?일 | 발행
					(주)일력거 | 편집 (주)일력거</div>
				<div class="footer_dtl_contents_3">발행소 서울시 금천구 가산디지털2로 구디아카데미
					| 전화번호 02-1234-5678</div>
				<div class="copyright">©WorkRickshaw. All rights reserved.</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript" src="resources/script/Mypage/personMypage/mainbox.js"></script>
</body>
</html>