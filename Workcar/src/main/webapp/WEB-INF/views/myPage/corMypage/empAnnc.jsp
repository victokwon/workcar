<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="resources/css/cormypage/empannc/default.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css">
    <link rel="stylesheet" href="resources/css/empannc/empannc.css">
    <link rel="stylesheet" type="text/css" href="resources/css/resume/pop.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="resources/script/cormypage/empannc/header.js"></script>
    <script src="resources/script/cormypage/empannc/mainbox.js"></script>
    <script src="resources/script/cormypage/empannc/empannc.js"></script>
    <script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="resources/script/cormypage/empannc/sector.js"></script>
    <script type="text/javascript" src="resources/script/cormypage/empannc/qual.js"></script>
    
</head>

<body>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div id="sdienav_ul">
            <ul>
                <div>채용정보</div>
                <li>통합검색</li>
                <li>조회수 100</li>
                <li>평점 100</li>
            </ul>
            <ul>
                <div>기업정보</div>
                <li>통합검색</li>
            </ul>
            <ul>
                <div>인재정보</div>
                <li>통합검색</li>
            </ul>
            <ul>
                <div>참여공간</div>
                <li>공지사항</li>
                <li>자주하는 질문</li>
            </ul>
        </div>
    </div>
    <div class="side_bcc" id="side_bcc"></div>

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

		<div class="main_button_box">
			<div class="main_button_box">
				<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
				<button type="button" class="main_button" onclick="linkGo('empannc')">이력서관리</button>
				<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
				<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
			</div>

			<div class="main_info">
				<input type="hidden" name="MEM_NO" value="${data.MEM_NO}">

				<div id="main_apply" class="main_content">

					         <div class="vertical_menu">

                 
                    <a href="#" id="jobPost">채용공고 관리</a>
                    
                    <a href="#" id="jobResume">받은 이력서</a>
                </div>

					<div class="main_box">
					<form action="#" id="uptForm1" method="post" class="form1" >
						<input type="hidden" name="MEM_NO" value="${data.MEM_NO}">
						<div class="tilte">
							<div class="header">
								<div class="job_post_title">
									<input type="text" placeholder="공고이름을 입력하세요" class="headline" NAME="EMP_TITLE" id="EMP_TITLE" >
								</div>
<!-- 								<div class="button_box">
									<input type="button" id="saveBtn" value="임시저장"> <input
										type="button" id="openBtn" value="공고개시">
								</div -->
								<!-- <div class="main_button_box">
                                    <input type="button" id="updateBtn" value="수정">
                                    <input type="button" id="delBtn" value="삭제">
                                </div> -->
							</div>
						</div>
	
							<div class="content " id="recru_info">
								<div class="dtl">
									<div class="header">채용정보</div>
									<div class="con">
										<div class="input_box">
											<div class="name">
												<div class="text">업종</div>
												<div class="input">
													<input type="hidden" id="SECTOR_NO" name="SECTOR_NO" readonly />
													<input type="text" id="SECTOR_NAME" name="SECTOR_NAME" readonly />
													<button type="button" id="sectorBtn" btn="s">업종 검색</button>
												</div>
											</div>
											<div class="count">
												<div class="text">모집인원</div>
												<div class="input">
													<input type="text" placeholder="모집인원" name="EMP_PER"  id="EMP_PER">명
												</div>
											</div>
											<div class="type">
												<div class="text">모집조건</div>
												<div class="input">
													<input type="radio" name="EMP_GBN" value="0" id="type0">
													<label for="type0">정규직</label> 
													<input type="radio"name="EMP_GBN" value="1" id="type1"> 
													<label for="type1">계약직</label>
													<input type="radio" name="EMP_GBN" value="2" id="type2">
													<label for="type2">시간제</label>
													<input type="radio" name="EMP_GBN" value="3" id="type3">
													<label for="type3">기타</label>
												</div>
											</div>
											<div class="sal">
												<div class="text">급여(월)</div>
												<div class="input">
													<input type="radio" name="PAY_GBN" value="0" id="sal0">
													<label for="sal0">내규</label> 
													<input type="radio" name="PAY_GBN" value="1" id="sal1"> 
													<label for="sal1">일반</label>
													<input type="text" placeholder="최저금액" id="minSal" name="PAY_MIN" disabled>만 원
													~ 
													<input type="text" placeholder="최대금액" id="maxSal" name="PAY_MAX" disabled>만 원
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="#" id="uptForm2" method="post" class="form1">
							<div class="content" id="recru_condition">
								<div class="dtl">
									<div class="header">자격요건</div>
									<div class="con">
										<div class="profile0"></div>
										<div class="input_box">
											<div class="edu">
												<div class="text">최종학력</div>
												<div class="input">
													<input type="radio" name="GRADU" id="edu0"  value="0">
													<label for="edu0">무관</label> 
													<input type="radio"name="GRADU" id="edu1"  value="1"> 
													<label for="edu1">고등학교</label> 
													<input type="radio" name="GRADU" id="edu2" value="2"> 
													<label for="edu2">전문대학</label>
													<input type="radio" name="GRADU" id="edu3" value="3">
													<label for="edu3">대학교</label> 
													<input type="radio" name="GRADU" id="edu4" value="4"> 
													<label for="edu4">석사</label>
													<input type="radio" name="GRADU" id="edu5" value="5">
													<label for="edu5">박사</label>
												</div>
											</div>
											<div class="major">
												<div class="text">전공</div>
												<div class="input">
													<input name="MAJOR" type="text" placeholder="전공">
												</div>
											</div>
											<div class="career">
												<div class="text">경력</div>
												<div class="input">
													<input type="radio" name="CARR" id="career0" value="0">
													<label for="career0">무관</label> 
													<input type="radio"name="CARR" id="career1" value="1">
													<label for="career1">신입</label>
													<input type="radio" name="CARR" id="career2" value="2">
													<label for="career2">경력</label>
												
											
													<input type="text" id="CARR_Y" NAME="CARR_Y" style="width:20px; height:20px;" disabled> 년
												<!-- 	~ <input type="text" placeholder="0" id="maxCareer"
														disabled>년 -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="#" id="uptForm3" method="post">
							<div class="content apply_dtl_lisence" id="resumeLisence">
								<div class="dtl">
									<div class="header">자격증</div>
									<div class="con add_box">
										<!-- js를 통해 추가되는 내용 -->
<!-- 										<div class="input_box ">
											<input type="button" class="minus_btn" id="delBtn" value="－">
											<div class="data_container">
												자격증 검색 api 팝업창
												<input type="button" class="" id="lisenceSchBtn"
													value="자격증 검색"> <input type="text"
													value="데이터 / 자격증명" readonly>
											</div>
										</div> -->
										<input type="button" class="plus_btn" id="addBtn1" value="＋">
									</div>
								</div>
							</div>
						</form>

<!-- 						<form action="fileUploadAjax" id="fileForm" method="post"
							enctype="multi/form-data">
							<input type="file" accept="image/*" name="att" id="att">
						</form> -->
						<form id="empFileForm" action="empFileAploadAjax" method="post">
							<div class="content apply_dtl_attch" id="resumeAttach">
								<div class="dtl">
									<div class="header">첨부파일</div>
									<div class="con add_box">
										<!-- js를 통해 추가되는 내용 -->
										<div class="input_box ">
											<!-- <input type="button" class="minus_btn" id="delBtn" value="－"> -->
											<div class="data_container file_container">
												파일이름 : <input type ="text" id="showName" name="showName" disabled>
												<input type="hidden" id="ATTCH_NAME" name="ATTCH_NAME">
												<button type="button" id="empFileUploadBtn">파일업로드</button>
												<button type="button" id="empFileUpDelBtn">파일삭제</button>
											</div>
										</div>

										<!-- <input type="button" class="plus_btn" id="addBtn7" value="＋"> -->
									</div>
								</div>
							</div>
						</form>
						
						
						<form action="#" id="uptForm4" method="post">
							<div class="content " id="">
								<div class="dtl">
									<div class="header">채용정보 세부 사항</div>
									<div class="con add_box">
										<!-- js를 통해 추가되는 내용 -->
										<div class="input_box text_box">
											<div class="data_container">
												<textarea name="DTL" id="DTL" placeholder="채용정보 세부 사항" 
													spellcheck="false"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="content " id="showImgFileDiv">
							<div class="dtl">
								<div class="header">파일 이미지 미리보기</div>
								<div class="con add_box">
									<!-- js를 통해 추가되는 내용 -->
									<div class="input_box text_box">
										<div class="data_container">
											<img src="" name="empFileShow" id="empFileShow">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="right">
						<form action="#" id="uptForm5" method="post">
							<div class="content " id="recru_info">
								<div class="dtl">
									<div class="header">채용정보</div>
									<div class="con">
										<div class="input_box">
											<div class="name">
												<div class="text">성명</div>
												<div class="input">
													<input type="text" value="${data.NAME}"  readonly>
												</div>
											</div>
											<div class="dept">
												<div class="text">부서</div>
												<div class="input">
													<input type="text" value="${data.POS}" readonly>
												</div>
											</div>
											<div class="phone">
												<div class="text">연락처</div>
												<div class="input">
													<input type="text" value="${data.PHONE}" readonly>
												</div>
											</div>
											<div class="email">
												<div class="text">이메일</div>
												<div class="input">
													<input type="text" value="${data.EMAIL}" readonly>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="uptempannc" id="uptForm6" method="post">
							<div class="content " id="">
								<div class="dtl">
									<div class="header">진행사항</div>
									<div class="con ">
										<div class="input_box">
											<div class="start">
												<div class="text">공고일</div>
												<div class="input">
													<input type="date" name="REG_DATE" id="REG_DATE" size="5" placeholder="공고일">
												</div>
											</div>
											<div class="end">
												<div class="text">마감일</div>
												<div class="input">
													<input type="date" name="DLINE" id="DLINE" placeholder="마감일">
												</div>
											</div>
											<div class="method">
												<div class="text">서류</div>
												<div class="input">
													<input type="checkbox" name="EMP_DOC" value="0" > 
													<label for="method0">이력서</label> <br>
													<input type="checkbox" name="EMP_DOC" value="1"  > 
													<label for="method1">경력기술서</label> <br>
													<input type="checkbox" name="EMP_DOC" value="2" > 
													<label for="method2">포트폴리오</label> <br>
													<input type="checkbox" name="EMP_DOC" value="3" >
													<label for="method3">기타</label>
												</div>
											</div>
											<div class="apply">
												<div class="text">전형</div>
												<div class="input">
													<input type="checkbox" name="EMP_PRCS" value="0" >
													<label for="apply0">서류전형</label> <br> <input
														type="checkbox" name="EMP_PRCS" value="1" >
													<label for="apply1">면접</label> <br> <input
														type="checkbox" name="EMP_PRCS" value="2" >
													<label for="apply2">인적성검사</label> <br> <input
														type="checkbox" name="EMP_PRCS" value="3" >
													<label for="apply3">기타</label>
												</div>
											</div>
											<!--                                         <div class="apply">
                                            <div class="text">서류</div>
                                            <div class="input">
                                                <input type="text" placeholder="제출서류">
                                            </div>
                                        </div> -->
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="#" id="findregionAjax" method="post">
							<div class="content " id="">
								<div class="dtl">
									<div class="header">근무지</div>
									<div class="con ">
										<div class="input_box">
											<div class="location">
												<div class="input">
													<select name="CITY" id="CITY">
														<option value="-1">도/광역시 선택</option>
														<option value="0">강원</option>
														<option value="1">경기</option>
														<option value="2">경남</option>
														<option value="3">경북</option>
														<option value="4">광주</option>
														<option value="5">대구</option>
														<option value="6">대전</option>
														<option value="7">부산</option>
														<option value="8">서울</option>
														<option value="9">울산</option>
														<option value="10">인천</option>
														<option value="11">전남</option>
														<option value="12">전북</option>
														<option value="13">제주</option>
														<option value="14">충남</option>
														<option value="15">충북</option>
													</select> 
													<select name="REGION" id="REGION">
											<!-- 			<option value="-1">시/군/구 선택</option> -->
													</select>
													<!-- <div class="location_dtl">세부주소 검색</div> -->
													<!--   <button type="button">근무지 검색</button> -->
												</div>
											</div>
											<!-- 위치 api -->
											<!-- 지도 검색 api -->
										</div>
									</div>
								</div>
							</div>
						</form>

							<form class="content " id="uptForm7" method="post">
								<div class="dtl">
									<div class="header">저장</div>
									<div class="con ">
										<div class="input_box">
											<div class="location">
												<div class="input">
													<select name="RECRUIT_GBN" id="RECRUIT_GBN">
														<option value="-1">공개 여부 선택</option>
														<option value="0">공개</option>
														<option value="1">비공개</option>
													</select>
												 <button type="button" id="uptBtn">저장</button> 
												</div>
											</div>
											<!-- 위치 api -->
											<!-- 지도 검색 api -->
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>

		<div id="empfile">	
			<form id="empfileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
				<input type="file" name="empanncfile" id="empanncfile" >
			</form>	
		</div>


	<div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1></h1>
                </div>
                <form class="pop-user" id="schForm">
                    <input type="hidden" name="page" id="page" value="${page}">
                    <div class="pop-input">
                        <input type="button" class="sch-btn" id="schSectorBtn" value="검색">
                        <input type="button" class="sch-btn" id="schQualBtn" value="검색">
                        <input type="text" name="schDataName" id="schName" placeholder="검색어">
                    </div>
                </form>
                <!-- 5개 리스트 -->
                <div class="list_wrap">
                    <table>
                        <thead>
                            <tr>
                                <th class='td_no'>번호</th>
                                <th class='td_name'>내용</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" no="">
                        </tbody>
                    </table>
                </div>
                <div class="paging_wrap"></div>
                <hr>
            </div>
        </div>
    </div>
    
    



	</main>

   <footer>
		<!-- 링크작업 -->
		<div class="inner_content">
			<div id="ntc">공지사항</div>
			<div id="paticp">참여마당</div>
			<div id="pvc">개인정보처리방침</div>
			<div id="tou">이용약관</div>
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




<script>
	$(document).ready(function(){
		
		//파일 업로드 체크
	   var chkfileupt = 0;

		//자격증 개수 체크
	   var cnt = 1;
	   
		
		
		
		//자격증 
	$("#addBtn1").on("click", function () {
	  
	    
	    if(cnt <4){
	    
        let html = "";
        html += '<div class="input_box " id="qualInput'+cnt+'" no="'+cnt+'" noName="qualNo">';
        html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
        html += '<div class="data_container">';
        html += '<button type="button" id="qualBtn" no="'+cnt+'" >자격증검색</button>';
        html += '<input class="qual_input" name="QUAL_NO" id="QUAL_NO'+cnt+'" type="hidden" readonly>';
        html += '<input class="qual_input" name="QUAL_NAME" id="QUAL_NAME'+cnt+'" value="자격증 명" type="text" disabled style="width:200px; text-align: center; margin-left: 30px;">';
        html += " </div>";
        html += " </div>";
	
	  $(this).parent().prepend(html);
	  cnt += 1
	  
	  }else{
	  alert("자격증은 3개 이상 등록이 불가능합니다.")
	  }
	});
		
	//삭제버튼	
	  $(".add_box").on("click", ".minus_btn", function () {
		    $(this).parent().html("");
		    cnt -= 1 ;
		  });
		
		
		
	   if ($("#ATTCH_NAME").val() != "") {	 
		   chkfileupt = 1;
		   $("#showImgFileDiv").show();
		   $("#empFileUpDelBtn").show();
		   $("#empFileUploadBtn").hide();
	   } else {
		   $("#showImgFileDiv").hide();
		   $("#empFileUpDelBtn").hide();
		   $("#empFileUploadBtn").show();
	   }
	   
		//파일폼 숨김처리
		$("#empfile").hide();

		//기본메뉴 설정, 메뉴이동
		$("#defaultmenu").click();
		
		$("#mypagecorp").on("click", function() {
			location.href = "/cmyinfopage";
		});
		
		$("#defaultmenu").on("click",function(){
			location.href = "/empannc";
		});
	   
	   
	   //업로드 파일 삭제처리
	   $("#empFileUpDelBtn").on("click",function(){
		  
		   chkfileupt = 0;
		   $("#showImgFileDiv").hide();
		   $("#empFileUpDelBtn").hide();
		   $("#empFileUploadBtn").show();
		   $("#showName").val("");
		   $("#ATTCH_NAME").val("");
	   });
		
				
		
		//파일 업로드 버튼 이벤트
		$("#empFileUploadBtn").on("click",function(e){
			
			e.preventDefault();
			
			$("#empanncfile").click();
					
		});
		
	
		
		//파일을 선택하면 수정 여부에 관계없이 업로드실행
		$("#empanncfile").on("change",function(){
			
			var fileForm = $("#empfileForm");
			
			fileForm.ajaxForm({
				
				success:function(res) {
					
					if(res.result == "SUCCESS") {
						
						if(res.fileName.length >0) {
							
							$("#ATTCH_NAME").val(res.fileName[0]);
							chkfileupt = 1;
						   $("#showImgFileDiv").show();
						   $("#empFileUpDelBtn").show();
						   $("#empFileUploadBtn").hide();
						   $("#empFileShow").attr("src","resources/upload/"+res.fileName[0]);
							
						}else {
							alert("업로드에 실패했습니다.");
						}
					}
				},
				error : function (req,status,error) {
					alert("에러가 발생했습니다");
				}	
			});
			fileForm.submit();
			$("#showName").val($(this).val().substring($(this).val().lastIndexOf("\\")+1));
		});

		
		
		//저장 
		
		$("#uptBtn").on("click",function(){
			
			if(chkfinal()){ 
			confirm("저장하시겠습니까?");
			insEmpAnncAjax();
			 } 
			
			
	});
		
		
		
		
		
		//경력 입력활성화
	  $(".career").on("change", "input", function () {
		    if ($("#career2").is(":checked")) {
		      $("#CARR_Y").attr("disabled", false);
		    } else {
		      $("#CARR_Y").attr("disabled", true);
		      $("#CARR_Y").val("");
		    
		    }
		  });
	
		//급여 입력 초기화
		$("#sal0").on("click",function(){
			$("#maxSal").val("");
			$("#minSal").val("");
		
	});
		
		
		
	// 근무지 검색 이벤트 AJax 실행
		$("#CITY").on("change",function(){
			
	
		findregionAjax();
		});
		
	
	
	// 저장 Ajax
	
	
	function insEmpAnncAjax() {
		

		var param = $("#uptForm1, #uptForm2, #uptForm3, #uptForm4, #uptForm6, #findregionAjax, #uptForm7, #empFileForm").serialize();
		
		$.ajax({
			
			url : "insEmpAnncAjax",
			type : "post",
			data : param,
			dataType : "json",
			success : function(res) {
				
				if(res.result == "success") {
					alert("저장에 성공했습니다.");
					location.href = "mainpage";
				}else if (res.result =="failed") {
					alert("오류가 발생했습니다");
				}
			},
			error : function(request,status,error) {
				console.log(error);
	
			}	
		});
		
	}
	
	
	
	//유효성 검사 
	
	function chkfinal() {
		
		if( dateChk() && numChk() && headlinechk() && headlinechk() && empGbnChk() && empPayChk() &&
				empgraduChk() && empCarrChk() && areaChk() && opnChk() ){
			return true;
		} else {
			return false;
		}
	}
	
	
	//날짜 입력 체크
	function dateChk() {
		

		
		if($("#REG_DATE").val() == "" || $("#DLINE").val() == "") {
			alert("공고일 또는 마감일을 입력하여 주십시오");
			return false;
			
		}
		return true;
	}
	
	
	//날짜 유효성
	function checkDate() {
		var Date1 = $("#REG_DATE").val();
		var date1 = Date1.split("-");

		var y1 = parseInt(date1[0],10);
		var m1 = parseInt(date1[1],10);
		var d1 = parseInt(date1[2],10);
		
		var Date2 = $("#DLINE").val();
		var date2 = Date2.split("-");

		var y2 = parseInt(date2[0],10);
		var m2 = parseInt(date2[1],10);
		var d2 = parseInt(date2[2],10);
		
		
		var nowDate = new Date();
		
		var ny = nowDate.getFullYear();
		var nm = nowDate.getMonth() + 1;
		var nd = nowDate.getDate();
		if(y1>y2 || ((y2==ny) && (y2>ny+1)) || y1 < ny || m1 > m2 || ((y2==y1) && (m2<nm)) ) {
			
			alert("날짜의 범위가 유효하지 않습니다.");
			return false;
		}
		
		
		return true
	}
	
	

	//지역 선택여부
	function areaChk() {
		if($("#CITY").val == -1 || $("#CITY").val == "") {
			alert("근무지역을 선택해 주십시오.");
			return false;
		}
			return true;
	}
	
	
	
	//공개 여부 체크
	
	function opnChk(){
	if($("#RECRUIT_GBN").val == -1 || $("#RECRUIT_GBN").val == "" ) {
		alert("공개 여부를 설정하여 주십시오.");
		return false;			
	}
	
		return true;	
}
	
	
	//모집인원 체크
	function numChk(){
		
		var chk = RegExp(/^[0-9]{1,3}$/);
		
		if($("#EMP_PER").val()!= "") {
			
			if(!chk.test($("#EMP_PER").val())){
				alert("모집 인원란에 유효하지 않은 문자가 있거나 입력 범위를 초과했습니다.");
				$("#EMP_PER").val("");
				$("#EMP_PER").focus();
				return false;		
		}
			
		}
			if($("#EMP_PER").val()=="") {
			alert("모집 인원을 입력해주세요.");
			$("#EMP_PER").focus();
			return false;
		}
	
			return true;
}
		

	//제목 입력 체크
	function headlinechk() {
		
		var chk = RegExp(/^[가-힣a-zA-Z0-9]{1,20}$/);
		if($("#EMP_TITLE").val() != "") {
			if(!chk.test($("#EMP_TITLE").val())){
				alert("채용 공고란에 유효하지 않는 문자가 있거나 입력 범위에 오류가 있습니다.");
				$("#EMP_TITLE").val("");
				$("#EMP_TITLE").focus();
				return false;
			}
		}
	
		if($("#EMP_TITLE").val() == ""){
			alert("공고 제목을 입력해 주세요");
			$("#EMP_TITLE").focus();
			return false;
		}
		
		return true;
	
}
	
	
	
	//계약조건 확인
	function empGbnChk(){
		if($("input[name=EMP_GBN]").is(":checked") == false ) {
			alert("모집요건란이 선택되지 않았습니다.");
			return false;
		}else {
			return true;
		}
	}
	
	
	//급여란 체크여부 확인
	function empPayChk() {
		
		var chk = RegExp(/^[0-9]{1,5}$/);
		
		if($("input[name=PAY_GBN]").is(":checked") == false ) {
			alert("급여 조건란이 선택되지 않았습니다.");
			return false;
		}
		
		if($("#sal1").is(":checked") && ($("#minSal").val() == "" || $("#maxSal").val() == "" )){
			alert("급여 조건란이 공란입니다.");
			if($("#minSal").val() =="") {
				$("#minSal").focus();
			}else{
				$("#maxSal").focus();
			}
			return false;
		}	
		 if ($("#sal1").is(":checked")  && $("#minSal").val() != "" && $("#maxSal").val() != "" ) {
			
			if(!chk.test($("#maxSal").val() || !chk.test($("#minSal").val()))){
				alert("급여조건에 유효하지 않은 문자가 있거나 입력 범위를 초과했습니다.");
				$("#minSal").val("");
				$("#maxSal").val("");
				$("#minSal").focus();
				return false;
				
			}		
		} 
		 
		 if($("#minSal").val() > $("#maxSal").val()) {
			alert("급여란의 범위가 잘못되었습니다.");
			$("#minSal").val("");
			$("#maxSal").val("");
			$("#minSal").focus();
			return false;
			
		}

		return true;
		
	}


	//학력조건 확인
	
	function empgraduChk(){
		if($("input[name=GRADU]").is(":checked") == false ) {
			alert("학력 요건란이 선택되지 않았습니다.");
			return false;
		}else {
			return true;
		}
	}
	
	
	//경력요건 확인
	

	function empCarrChk(){
		var chk = RegExp(/^[0-9]{1,2}$/);
		
		if($("input[name=CARR]").is(":checked") == false ) {
			alert("경력 요건란이 선택되지 않았습니다.");
			$("input[name=CARR]").focus();
			return false;
		}	
		if($("#career2").is(":checked") && $("#CARR_Y").val() =="" ) {
			alert("경력 조건을 입력해주십시오");
			return false
		}
		
		if ($("#career2").is(":checked")) {
			
			if(!chk.test($("#CARR_Y").val())){
				alert("경력 조건에 유효하지 않은 문자가 있거나 입력범위가 초과했습니다.");
				return false;
			}
		}
		return true;
	}


	
	
	
	//근무지 검색 Ajax 
		
	function findregionAjax() {

		
		var param =  $("#findregionAjax").serialize();
	
		
		$.ajax({
			
			url: "findregionAjax",
			data : param,
			dataType : "json",
			type : "post",
			success : function(res) {
				
				if(res.result =="success"){
					console.log(res.list);
					drawRegion(res.list);
					
				}else if(res.result == "failed"){
					alert("오류발생");
				}
			},
			error: function(request,status,error) {
				console.log(error);
			}
			
			
		});
	}
	
// 지역목록 출력 
	function drawRegion(list){
		
		var html = "";
		
		for(data of list) {
			
			html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
		
		$("#REGION").html(html);
	}
	
	
	
	
 $(".list_wrap").on("click", "tr", function () {
	  	if($(".pop-container").attr("btn") == "q"){
	  		let target = $("#list_box").attr("no");
	  	    $("#QUAL_NO"+target+"").val($(this).attr("qNo"));
	  	    $("#QUAL_NAME"+target+"").val($(this).attr("qName"));
	  	    $(".pop-container").hide();
	  	}else if($(".pop-container").attr("btn") == "s"){
	  	    $("#SECTOR_NAME").val($(this).attr("sName"));
	  	    $("#SECTOR_NO").val($(this).attr("sNo"));
	  	    $(".pop-container").hide();
	  		}
	 });
	
	
	
	
	
	});

	
</script>




</body>


</html>
<!-- main_content_button button  main_button_box-->