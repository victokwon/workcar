<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@include file="/resources/jsp/header.jsp"%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일력거</title>
	<link rel="stylesheet" type="text/css" href="resources/css/common/default.css">
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
	<script type="text/javascript">
	function linkGo(url){
		location.href = url;
	}
	</script>
</head>

<body>

    <main>
		<div class="main_button_box">
			<div class="main_button_box">
				<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
				<button type="button" class="main_button" onclick="linkGo('mngancpage')">채용공고</button>
				<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
				<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
			</div>

			<div class="main_info">
				<input type="hidden" name="MEM_NO" value="${data.MEM_NO}">

				<div id="main_apply" class="main_content">

					<!--          <div class="vertical_menu">

                    이력서 리스트 메뉴 출력
                    <a href="#" id="jobPost">채용공고 관리</a>
                    <a href="#" id="jobResume">받은 이력서</a>
                </div> -->

					<div class="main_box">
					<form action="#" id="uptForm1" method="post" class="form1" >
						<input type="hidden" name="MEM_NO" value="${data.MEM_NO}">
						<input type="hidden" name="EMP_NO" value="${data.EMP_NO}"/>
						<div class="tilte">
							<div class="header">
								<div class="job_post_title">
									<input type="text" value="${data.EMP_TITLE}" placeholder="공고이름을 입력하세요" class="headline" 
									NAME="EMP_TITLE" id="EMP_TITLE" style="width: 870px !important;">
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
													<input type="HIDDEN" id="SECTOR_NO" name="SECTOR_NO" value="${data.SECTOR_NO}" readonly />
													<input type="text" id="SECTOR_NAME" name="SECTOR_NAME" value="${data.SECTOR_NAME}" readonly />
													<button type="button" id="sectorBtn" btn="s">업종 검색</button>
												</div>
											</div>
											<div class="count">
												<div class="text">모집인원</div>
												<div class="input">
													<input type="text" placeholder="모집인원" name="EMP_PER"  id="EMP_PER" value="${data.EMP_PER}">명
												</div>
											</div>
											<div class="type">
												<div class="text">모집조건</div>
												<div class="input">
													<input type="radio" name="EMP_GBN" value="0" id="type0" 
													<c:if test="${data.EMP_GBN eq 0}">checked="checked"</c:if>/>
													<label for="type0">정규직</label> 
													<input type="radio"name="EMP_GBN" value="1" id="type1"
													<c:if test="${data.EMP_GBN eq 1}">checked="checked"</c:if>/> 
													<label for="type1">계약직</label>
													<input type="radio" name="EMP_GBN" value="2" id="type2"
													<c:if test="${data.EMP_GBN eq 2}">checked="checked"</c:if>/>
													<label for="type2">시간제</label>
													<input type="radio" name="EMP_GBN" value="3" id="type3"
													<c:if test="${data.EMP_GBN eq 3}">checked="checked"</c:if>/>
													<label for="type3">기타</label>
												</div>
											</div>
											<div class="sal">
												<div class="text">급여(월)</div>
												<div class="input">
													<input type="radio" name="PAY_GBN" value="0" id="sal0"
													<c:if test="${data.PAY_GBN eq 0}">checked="checked"</c:if>/>
													<label for="sal0">내규</label> 
													<input type="radio" name="PAY_GBN" value="1" id="sal1"
													<c:if test="${data.PAY_GBN eq 1}">checked="checked"</c:if>/> 
													<label for="sal1">일반</label>
													<input type="text" placeholder="최저금액" id="minSal" name="PAY_MIN" value="${data.PAY_LOW}" disabled>만원
													~ 
													<input type="text" placeholder="최대금액" id="maxSal" name="PAY_MAX" value="${data.PAY_HIGH}" disabled>만원
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
													<input type="radio" name="GRADU" id="edu0"  value="0"
													<c:if test="${data.GRADU eq 0}">checked="checked"</c:if>/>
													<label for="edu0">무관</label> 
													<input type="radio"name="GRADU" id="edu1"  value="1"
													<c:if test="${data.GRADU eq 1}">checked="checked"</c:if>/> 
													<label for="edu1">고등학교</label> 
													<input type="radio" name="GRADU" id="edu2" value="2"
													<c:if test="${data.GRADU eq 2}">checked="checked"</c:if>/> 
													<label for="edu2">전문대학</label>
													<input type="radio" name="GRADU" id="edu3" value="3"
													<c:if test="${data.GRADU eq 3}">checked="checked"</c:if>/>
													<label for="edu3">대학교</label> 
													<input type="radio" name="GRADU" id="edu4" value="4"
													<c:if test="${data.GRADU eq 4}">checked="checked"</c:if>/> 
													<label for="edu4">석사</label>
													<input type="radio" name="GRADU" id="edu5" value="5"
													<c:if test="${data.GRADU eq 5}">checked="checked"</c:if>/>
													<label for="edu5">박사</label>
												</div>
											</div>
											<div class="major">
												<div class="text">전공</div>
												<div class="input">
													<input name="MAJOR" type="text" value="${data.MAJOR}" placeholder="전공">
												</div>
											</div>
											<div class="career">
												<div class="text">경력</div>
												<div class="input">
													<input type="radio" name="CARR" id="career0" value="0"
													<c:if test="${data.CARR eq 0}">checked="checked"</c:if>/>
													<label for="career0">무관</label> 
													<input type="radio"name="CARR" id="career1" value="1"
													<c:if test="${data.CARR eq 1}">checked="checked"</c:if>/>
													<label for="career1">신입</label>
													<input type="radio" name="CARR" id="career2" value="2"
													<c:if test="${data.CARR eq 2}">checked="checked"</c:if>/>
													<label for="career2">경력 </label>
												
									
													<input type="text" id="CARR_Y" NAME="CARR_Y" style="width:20px; height:20px;" value="${data.CARR_Y}" disabled >년
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
							<input type="hidden" name="EMP_NOO" value="${data.EMP_NO}"/>
							<div class="content apply_dtl_lisence" id="resumeLisence">
								<div class="dtl">
									<div class="header">자격증</div>
									<div class="con add_box">
									<c:if test ="${!empty qlist}">
									<c:set var="cntt" value ="1" />
										<c:forEach var="list" items="${qlist}">
											<div class="input_box " id="qualInput${cntt}" no="cnt${cntt}" noName="qualNo">
												<input type="button" class="minus_btn" id="delBtn" value="－">
												<div class="data_container">
													<button type="button" id="qualBtn" no="${cntt}" >자격증검색</button>
													<input class="qual_input" name="QUAL_NO" id="QUAL_NO${cntt}" value="${list.QUAL_NO}" type="hidden" readonly>
	        										<input class="qual_input" name="QUAL_NAME" id="QUAL_NAME${cntt}" value="${list.QUAL_NAME}" type="text" disabled style="width:200px; text-align:center; margin-left:30px;">	        										
												</div>
											</div>
											 <c:set var="cntt" value="${cntt + 1 }" />
										</c:forEach>
									</c:if>		
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
						<form action="empFileAploadAjax" method="post">
							<div class="content apply_dtl_attch" id="resumeAttach">
								<div class="dtl">
									<div class="header">첨부파일</div>
									<div class="con add_box">
										<!-- js를 통해 추가되는 내용 -->
										<div class="input_box ">
											<!-- <input type="button" class="minus_btn" id="delBtn" value="－"> -->
											<div class="data_container file_container">
											
												파일이름 : <input type ="text" id="showName" value="${data.ATTCH_NAME}" disabled>
												<input type="hidden" id="ATTCH_NAME" name="ATTCH_NAME" value="${data.ATTCH_NAME}">
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
												<textarea name="DTL" id="DTL"  placeholder="채용정보 세부 사항" 
													spellcheck="false">${data.DTL}</textarea>
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
													<input type="date" name="REG_DATE" size="5" value="<fmt:formatDate value='${data.REG_DATE}' pattern='yyyy-MM-dd'/>" placeholder="공고일">
												</div>
											</div>
											<div class="end">
												<div class="text">마감일</div>
												<div class="input">
													<input type="date" name="DLINE" value="<fmt:formatDate value='${data.DLINE}' pattern='yyyy-MM-dd'/>" placeholder="마감일">
												</div>
											</div>
											<div class="method">
												<div class="text">서류</div>
												<div class="input">
													<input type="checkbox" name="EMP_DOC"  id="EMP_DOC0" value="0" > 
													<label for="method0">이력서</label> <br>
													<input type="checkbox" name="EMP_DOC" id="EMP_DOC1" value="1" > 
													<label for="method1">경력기술서</label> <br>
													<input type="checkbox" name="EMP_DOC" id="EMP_DOC2" value="2"> 
													<label for="method2">포트폴리오</label> <br>
													<input type="checkbox" name="EMP_DOC" id="EMP_DOC3" value="3" >
													<label for="method3">기타</label>
												</div>
											</div>
											<div class="apply">
												<div class="text">전형</div>
												<div class="input">
													<input type="checkbox" name="EMP_PRCS" id="EMP_PRCS0" value="0" >
													<label for="apply0">서류전형</label> <br> 
													<input type="checkbox" name="EMP_PRCS" id="EMP_PRCS1" value="1">
													<label for="apply1">면접</label> <br> 
													<input type="checkbox" name="EMP_PRCS" id="EMP_PRCS2" value="2">
													<label for="apply2">인적성검사</label> <br> 
													<input type="checkbox" name="EMP_PRCS" id="EMP_PRCS3" value="3">
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
													<select name="CITY" id="CITY" >
														<option value="-1">도/광역시 선택</option>
														<option value="0" id="CITY0" >강원</option>
														<option value="1" id="CITY1">경기</option>
														<option value="2" id="CITY2">경남</option>
														<option value="3" id="CITY3">경북</option>
														<option value="4" id="CITY4">광주</option>
														<option value="5" id="CITY5">대구</option>
														<option value="6" id="CITY6">대전</option>
														<option value="7" id="CITY7">부산</option>
														<option value="8" id="CITY8">서울</option>
														<option value="9" id="CITY9">울산</option>
														<option value="10" id="CITY10">인천</option>
														<option value="11" id="CITY11">전남</option>
														<option value="12" id="CITY12">전북</option>
														<option value="13" id="CITY13">제주</option>
														<option value="14" id="CITY14">충남</option>
														<option value="15" id="CITY15">충북</option>
													</select> 
													<select name="REGION" id="REGION" selValue="${data.REGION_NO}">
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
														<option value="0" <c:if test="${data.RECRUIT_GBN eq 0}">selected="selected"</c:if>>공개</option>
														<option value="1" <c:if test="${data.RECRUIT_GBN eq 1}">selected="selected"</c:if>>비공개</option>
													</select>
												 <button type="button" id="uptBtn">수정</button> 
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
	
<%@include file="/resources/jsp/footer.jsp"%>


<script>
	$(document).ready(function(){
	
	//자격증 개수 체크
  	
	 var cnt ='<c:out value="${cntt}"/>'

	console.log("cntt값"+${cntt});
	//파일 업로드 체크
   	var chkfileupt = 0;

		
   // 자격증
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
	  alert("자격증은 3개 이상 등록이 불가능합니다.");
	  return false;
	  }
	});
	
	  $(".add_box").on("click", ".minus_btn", function () {
		    $(this).parent().html("");
		    cnt -= 1 ;
		  });
	  
	  
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
	  
	  
	  
	
	//체크값 불러오기	
		var doc = "${data.EMP_DOC}";
		var prcs = "${data.EMP_PRCS}";

		for(var i =0; i<=3; i++) {
			var docVal = "EMP_DOC"+i;
			for(var b =0; b<doc.length; b++) {

				/* var doca = doc[b]; */
				if(doc[b] == document.getElementById(docVal).value){						
					document.getElementById(docVal).setAttribute("checked",true);			
			}
		}
	}
		
		for(var i =0; i<=3; i++) {
			var prcsVal = "EMP_PRCS"+i;
			for(var b =0; b<doc.length; b++) {

				/* var prcsa = prcs[b]; */

				if(prcs[b] == document.getElementById(prcsVal).value){						
					document.getElementById(prcsVal).setAttribute("checked",true);
					
			}
		}
	}
		
		
	
	//이미지 파일 체크
		
	(function(){
		var img = "${data.ATTCH_NAME}";
	if(img != "") {
		$("#empFileShow").attr("src","resources/upload/"+img);
	}
	
	})();
		

 	//도시 체크
 	
	var city = "${data.CITY_NO}";
	var region = "${data.REGION_NO}";

	console.log("region 값 : "+ region);
	
	
	$("#CITY").val(city);
	findregionAjax();

		

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
		$("#defaultmenu2").click();
		
		$("#mypagecorp2").on("click", function() {
			location.href = "/cmyinfopage";
		});
		
		$("#defaultmenu2").on("click",function(){
			location.href = "/mngancpage";
		});
	   
		//파일이름정리
		if($("#showName").val() != '') {
			$("#showName").html($(this).val().substring($(this).val().lastIndexOf("\\")+1));
		}
		
		
		
	   //업로드 파일 삭제처리
	   $("#empFileUpDelBtn").on("click",function(){
		  alert("첨부파일이 삭제되었습니다");
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
			
		if(confirm("수정 하시겠습니까?")){
			
			if(chkfinal()){
				uptEmpAnncAjax();
				}
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
	
	
	function uptEmpAnncAjax() {
		

		var param = $("#uptForm1, #uptForm2, #uptForm3, #uptForm4, #uptForm6, #findregionAjax, #uptForm7, #empFileForm").serialize();
		
		$.ajax({
			
			url : "uptEmpAnncAjax",
			type : "post",
			data : param,
			dataType : "json",
			success : function(res) {
				
				if(res.result == "success") {
					alert("수정이 완료되었습니다.");
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
			
		}else {
			checkDate();
		}
			
		
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
		$("#REGION").val(region);
		
	}


	
	});

	
</script>

</body>


</html>
