<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources\css\common\default.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\footer.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\header.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\sidebar.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\resume\resumeDtl.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\resume\floatRightNav.css">

<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="resources\script\resume\resumeInsert.js"></script> -->
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
	$(function() {
		 var noBox = {
				 qualNo: ${conCnt.QUAL_CNT},
				 flangNo:${conCnt.FLANG_CNT},
				 carrNo: ${conCnt.CARR_CNT},
				 eduNo: ${conCnt.EDU_CNT},
				 ieduNo: ${conCnt.IEDU_CNT},
				 sintroNo: ${conCnt.SINTRO_CNT},
				 attchNo: ${conCnt.ATTCH_CNT}
				}
		console.log(noBox)
		
		if("${msg}"!=""){
			alert(${msg})
		}
		
	 	$(".locSelectBox").on("change",".citySel",function(){
			let no = $(this).attr("locResumNo")
			if(no == 0){
				getRegion0($(this).val())
			}else if(no == 1){
				getRegion1($(this).val())
			}else if(no == 2){
				getRegion2($(this).val())
			}else if(no == 3){
				getRegion3($(this).val())
			}
		}) 
		
		$("#gradu").val("${DATA.GRADU}").attr("selected", "selected");
		
		$("#city\\[0\\]").val("${DATA.CITY_NO}").attr("selected", "selected");
		getRegion00($("#city\\[0\\]").val())
		
		$("#city\\[1\\]").val("${LOC1.CITY_NO}").attr("selected", "selected");
		getRegion10($("#city\\[1\\]").val())
		
		$("#city\\[2\\]").val("${LOC2.CITY_NO}").attr("selected", "selected");
		getRegion20($("#city\\[2\\]").val())
		
		$("#city\\[3\\]").val("${LOC3.CITY_NO}").attr("selected", "selected");
		getRegion30($("#city\\[3\\]").val())
		
		$("#resumeList").on("click","div",function(){
			let resumeNo = $(this).attr("resumeNo")
			$("#resumeNo").val(resumeNo)
			$("#actGbn").val("Dtl")
			$("#resumeGo").attr("action", "resumeDtl")
			$("#resumeGo").submit()
		})
	
		 $(".apply_content").on("click", ".apply_update_btn", function () {
	    	$("#resumeNo").val($(this).parent().parent().attr("resumeNo"));
	   	});
		
		 $(".add_box").on("click", ".minus_btn", function () {
		 	let target = $(this).parent().attr("noName")
		 	noBox[target] --
		 	console.log(noBox)
		   $(this).parent().remove();
		 });
		 
		  $(".sal").on("change", "input", function () {
			    if ($("#sal1").is(":checked")) {
			      $("#minSal").attr("disabled", false);
			      $("#maxSal").attr("disabled", false);
			    } else {
			      $("#minSal").attr("disabled", true);
			      $("#maxSal").attr("disabled", true);
			    }
			  });
		
		$("#resumeList").on("click","div",function(){
			let resumeNo = $(this).attr("resumeNo")
			$("#resumeNo").val(resumeNo)
			$("#resumeGo").attr("action", "resumeDtl")
			$("#resumeGo").submit()
		})
		 // 자격증 1
		  $("#addBtn1").on("click", function () {
		  
		  	if(noBox.qualNo<3){
		  	
		    let html = "";
		    html += '<div class="input_box " id="qualInput['+noBox.qualNo+']" no="'+noBox.qualNo+'" noName="qualNo">';
		    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
		    html += '<div class="data_container">';
		    html +=
		      '<input type="button" class="" id="lisenceSchBtn" value="자격증 검색">';
		    html += '<input class="qual_input" name="qualNo['+noBox.qualNo+']" id="qualNo['+noBox.qualNo+']" type="text" value="데이터 / 자격증명" readonly>';
		    html += '<input class="qual_input" name="issuAgcy['+noBox.qualNo+']" id="issuAgcy['+noBox.qualNo+']" type="text" placeholder="발급처">';
		    html += '<input class="qual_input" name="passDate['+noBox.qualNo+']" id="passDate['+noBox.qualNo+']" type="text" placeholder="발급일">';
		    html += " </div>";
		    html += " </div>";

		    $(this).parent().prepend(html);
		    noBox.qualNo += 1
		    
		    }else{
		    alert("3개 이상 등록이 불가능합니다.")
		    }
		  });
		  
		  // 외국어 2
		  $("#addBtn2").on("click", function () {
		  
		  	if(noBox.flangNo<3){
		  
		    html = "";
		    html += '<div class="input_box" id="flangInput['+noBox.flangNo+']" no="'+noBox.flangNo+'" noName="flangNo">';
		    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
		    html += '<div class="data_container">';
		    html += '<select name="flangNo['+noBox.flangNo+']" id="flangNo">';

		    html += '<option value="-1">언어 선택</option>';
		    html += '<option value="0">독일어</option>';
		    html += '<option value="1">란다어</option>';
		    html += '<option value="2">러시아어</option>';
		    html += '<option value="3">마라티어</option>';
		    html += '<option value="4">베트남어</option>';
		    html += '<option value="5">벵골어</option>';
		    html += '<option value="6">스페인어</option>';
		    html += '<option value="7">아랍어</option>';
		    html += '<option value="8">영어</option>';
		    html += '<option value="9">우르두어</option>';
		    html += '<option value="10">일본어</option>';
		    html += '<option value="11">자바어</option>';
		    html += '<option value="12">중국어</option>';
		    html += '<option value="13">타밀어</option>';
		    html += '<option value="14">터키어</option>';
		    html += '<option value="15">텔루구어</option>';
		    html += '<option value="16">포르투갈어</option>';
		    html += '<option value="17">프랑스어</option>';
		    html += '<option value="18">힌디어</option>';

		    html += "</select>";
		    html += '<label for="flangType">타입</label>';
		    html += '<select name="flangType[' + noBox.flangNo + ']" id="flangType['+noBox.flangNo+']">';
		    html += '<option value="-1">타입 선택</option>';
		    html += '<option value="읽기/쓰기">읽기/쓰기</option>';
		    html += '<option value="회화">회화</option>';
		    html += " </select>";
		    html += '<label for="flangGrade">수준</label>';
		    html += '<select name="flangGrade['+noBox.flangNo+']" id="flangGrade['+noBox.flangNo+']">';
		    html += '<option value="-1">수준 선택</option>';
		    html += '<option value="상">상</option>';
		    html += '<option value="중">중</option>';
		    html += '<option value="하">하</option>';
		    html += " </select>";
		    html += " </div>";
		    html += " </div>";
		    
		    $(this).parent().prepend(html);
		    noBox.flangNo += 1;
		    
		    }else{
		    alert("3개 이상 등록이 불가능합니다.")
		    }
		  });
		  
		  // 경력사항 3
		  $("#addBtn3").on("click", function () {
		  
		  	if(noBox.carrNo<3){
		  
		    html = "";
		    html += '<div class="input_box more" id="carrInput['+noBox.carrNo+']" no="'+noBox.carrNo+'" noName="carrNo">';
		    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		    html += '<div class="data_container ">';
		    html += '<div class="detail">';
		    html += " 기업";
		    html += '<input type="text" name="cName['+noBox.carrNo+']" id="cName['+noBox.carrNo+']" placeholder="기업명">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 부서";
		    html += '<input type="text" name="dpart['+noBox.carrNo+']" id="dpart['+noBox.carrNo+']" placeholder="부서명">';
		    html += " 직책";
		    html += '<input type="text" name="pos['+noBox.carrNo+']" id="pos['+noBox.carrNo+']" placeholder="직책명">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 재직기간";
		    html += '<input type="text" name="stDate['+noBox.carrNo+']" id="stDate['+noBox.carrNo+']" placeholder="시작 년/월">~';
		    html += '<input type="text" name="endData['+noBox.carrNo+']" id="endData['+noBox.carrNo+']" placeholder="종료 년/월">';
		    html += " 재직기간";
		    html += '<input type="checkbox" name="tureChk['+noBox.carrNo+']" id="tureChk['+noBox.carrNo+']" placeholder="종료 년/월" value="재직">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 직무내용";
		    html +=
		      '<textarea name="" placeholder="직무내용" spellcheck="false" name="carrCntt['+noBox.carrNo+']" id="carrCntt['+noBox.carrNo+']"></textarea>';
		    html += " </div>";
		    html += " </div>";
		    html += " </div>";
		    $(this).parent().prepend(html);
		    noBox.carrNo ++
		    
		    }else{
		    alert("3개 이상 등록이 불가능합니다.")
		    }
		  });
		  
		  // 학력사항 4
		  $("#addBtn4").on("click", function () {
		  
		  	if(noBox.eduNo<3){
		  
		    html = "";
		    html += '<div class="input_box more" id="eduInput['+noBox.eduNo+']" no="'+noBox.eduNo+'" noName="eduNo">';
		    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		    html += '<div class="data_container ">';
		    html += '<div class="detail">';
		    html += " 학교";
		    html += '<input type="text" name="schName['+noBox.eduNo+']" id="schName['+noBox.eduNo+']" placeholder="학교명">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 학부";
		    html += '<input type="text" name="sol['+noBox.eduNo+']" id="sol['+noBox.eduNo+']" placeholder="학부명">';
		    html += " 학과";
		    html += '<input type="text" name="major['+noBox.eduNo+']" id="major['+noBox.eduNo+']" placeholder="전공명">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 재학기간";
		    html += '<input type="text" name="stDate['+noBox.eduNo+']" id="eduStDate['+noBox.eduNo+']" placeholder="시작 년/월">~';
		    html += '<input type="text" name="endData['+noBox.eduNo+']" id="eduEndDate['+noBox.eduNo+']" placeholder="종료 년/월">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 특이사항";
		    html +=
		      '<textarea name="" placeholder="특이사항" spellcheck="false" name="eduCntt['+noBox.eduNo+']" id="eduCntt['+noBox.eduNo+']">없음</textarea>';
		    html += " </div>";
		    html += " </div>";
		    html += " </div>";
		    $(this).parent().prepend(html);
		    noBox.eduNo ++
		    
		    }else{
		    alert("3개 이상 등록이 불가능합니다.")
		    }
		  });
		  
		  // 직무교육 5
		  $("#addBtn5").on("click", function () {
		  
		  	if(noBox.ieduNo<3){
		  
		    html = "";
		    html += '<div class="input_box more" id="ieduInput['+noBox.ieduNo+']" no="'+noBox.ieduNo+'" noName="ieduNo">';
		    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		    html += '<div class="data_container ">';
		    html += '<div class="detail">';
		    html += "기관";
		    html += '<input type="text" name="ieduName['+noBox.ieduNo+']" id="ieduName['+noBox.ieduNo+']" placeholder="기관명">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 훈련과정";
		    html += '<input type="text" name="coseName['+noBox.ieduNo+']" id="coseName['+noBox.ieduNo+']" placeholder="훈련과정명">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 교육기관";
		    html += '<input type="text" name="stDate['+noBox.ieduNo+']" id="stDate['+noBox.ieduNo+']" placeholder="시작 년/월">~';
		    html += '<input type="text" name="endData['+noBox.ieduNo+']" id="endData['+noBox.ieduNo+']" placeholder="종료 년/월">';
		    html += " </div>";
		    html += '<div class="detail">';
		    html += " 교육내용";
		    html +=
		      '<textarea name="" placeholder="교육내용" spellcheck="false" name="ieduCntt['+noBox.ieduNo+']" id="ieduCntt['+noBox.ieduNo+']"></textarea>';
		    html += " </div>";
		    html += " </div>";
		    html += " </div>";
		    $(this).parent().prepend(html);
		    noBox.ieduNo ++
		    
		    }else{
		    alert("3개 이상 등록이 불가능합니다.")
		    }
		  });
		  
		  // 자기소개서 6
		  $("#addBtn6").on("click", function () {
		  
		  	if(noBox.sintroNo<3){
		  	
		    html = "";
		    html += '<div class="input_box text_box" id="sintroInput['+noBox.sintroNo+']" no="'+noBox.sintroNo+'" noName="sintroNo">';
		    html += '<input type="text" name="sintroName['+noBox.sintroNo+']" id="sintroName['+noBox.sintroNo+']" placeholder="자기소개서 제목 입력">';
		    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		    html += '<div class="data_container">';
		    html +=
		      '<textarea name="" placeholder="자기소개서 내용 입력" spellcheck="false" name="sintroCntt['+noBox.sintroNo+']" id="sintroCntt['+noBox.sintroNo+']"></textarea>';
		    html += " </div>";
		    html += " </div>";
		    $(this).parent().prepend(html);
		    noBox.sintroNo ++
		    
		    }else{
		    alert("3개 이상 등록이 불가능합니다.")
		    }
		  });
		  
		  // 첨부파일 7
		  $("#addBtn7").on("click", function () {
		  
		  	if(noBox.attchNo<3){
		  	
		    html = "";
		    html += '<div class="input_box " id="attchInput['+noBox.attchNo+']" no="'+noBox.attchNo+'" noName="attchNo">';
		    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
		    html += '<div class="data_container file_container">';
		    html += '<div id="fileSNm" name="attchName['+noBox.attchNo+']" id="attchName['+noBox.attchNo+']">파일명</div>';
		    html += '<input type="hidden" id="fileLNm">';
		    html += '<button type="button">파일업로드</button>';
		    html += " </div>";
		    html += " </div>";
		    $(this).parent().prepend(html);
		    noBox.attchNo ++
		    
		    }else{
		    alert("3개 이상 등록이 불가능합니다.")
		    }
		  });	
	})
function getRegion0(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw0(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion1(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw1(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion2(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw2(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion3(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw3(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion00(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw0(res.list)
					$("#region\\[0\\]").val("${DATA.REGION_NO}").attr("selected", "selected");
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion10(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw1(res.list)
					$("#region\\[1\\]").val("${LOC1.REGION_NO}").attr("selected", "selected");
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion20(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw2(res.list)
					$("#region\\[2\\]").val("${LOC2.REGION_NO}").attr("selected", "selected");
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion30(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw3(res.list)
					$("#region\\[3\\]").val("${LOC3.REGION_NO}").attr("selected", "selected");
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}

function regionOptionDraw0(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[0\\]").html(html)
}

function regionOptionDraw1(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[1\\]").html(html)
}

function regionOptionDraw2(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[2\\]").html(html)
}
function regionOptionDraw3(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[3\\]").html(html)
}
	function linkGo(url) {
		location.href = url
	}
	function linkBack(){
		history.back()
	}
	
</script>
<!-- <script type="text/javascript" src="resources\script\resume\locAjax.js"></script> -->
</head>

<body>

	<form action="#" id="resumeGo" method="post">
		<input type="hidden" id="memNo" name="memNo" value="${sMNo}">
		<input type="hidden" id="resumeNo" name="resumeNo"
			value="${DATA.RESUM_NO }">
		<input type="hidden" id="actGbn" name="actGbn" >
	</form>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div>채용정보</div>
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
		<div id="test"></div>
		<div class="main_button_box">
			<button type="button" class="main_button">계정관리</button>
			<button type="button" class="main_button" id="defaultOpen"
				onclick="linkGo('resumeList')">이력서관리</button>
			<button type="button" class="main_button">활동내역</button>
			<button type="button" class="main_button">관심정보</button>
		</div>
		<div class="main_info">

			<div id="main_apply" class="main_content">
				<div class="vertical_menu">
					<table id="resumeList">
						<c:forEach var="data" items="${LIST }">
							<tr>
								<td>
									<div resumeNo="${data.RESUM_NO }">
										<a href="#">${data.RESUM_NAME }</a>
									</div>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${CNT < 5  }">
							<tr>
								<td>
									<div class="apply_list">
										<a href="resumeDtl" id="addBtn"> 추가 </a>
									</div>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<!-- form 내부의 button 동작 막기 -->
				<div class="main_box">
					<div class="content apply_dtl_header" id="resumeName">
						<div class="apply_dtl">
							<span class="apply_dtl_name">${DATA.RESUM_NAME}</span><br> <span
								class="apply_dtl_date">최종수정일 | ${DATA.CHN_DATE}</span> <span
								class="apply_dtl_date">&nbsp;[${DATA.OPN_CHK}]</span>
						</div>
						<div class="apply_btn">
							<button type="button" id="saveBtn">저장</button>
							<button type="button" id="cancelBtn" onclick="linkBack()">취소</button>
						</div>
					</div>
					<!-- form 설정 -->
					<div class="content apply_dtl_user" id="resumeUser">
						<div class="dtl">
							<div class="header">지원자정보</div>
							<div class="con">
								<div class="profile"></div>
								<div class="input_box">
									<div class="name">
										<div class="text">성명</div>
										<div class="input">${DATA.NAME}</div>
									</div>
									<div class="gender">
										<div class="text">성별</div>
										<div class="input">${DATA.GENDER}</div>
									</div>
									<div class="birth">
										<div class="text">출생년도</div>
										<div class="input">${DATA.BIRTH}</div>
									</div>
									<div class="phone">
										<div class="text">연락처</div>
										<div class="input">${DATA.PHONE}</div>
									</div>
									<div class="email">
										<div class="text">이메일</div>
										<div class="input">${DATA.EMAIL}</div>
									</div>
									<div class="location">
										<div class="text">거주지역</div>
										<div class="input">
											<div class="locSelectBox">
												<select class="citySel" id="city[0]" name="city[0]" locResumNo="0">
													<option value="-1" selected="selected">시도 선택</option>
													<option value="16">전체</option>
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
												<select id="region[0]" name="region[0]">
													
												</select>
											</div>
										</div>
									</div>
									<div class="edu">
										<div class="text">최종학력</div>
										<div class="input">
											<select name="gradu" id="gradu">
												<option value="-1">학력 선택</option>
												<option value="고등학교">고등학교</option>
												<option value="전문대학">전문대학</option>
												<option value="대학교">대학교</option>
												<option value="석사">석사</option>
												<option value="박사">박사</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- form 설정 -->
					<div class="content apply_dtl_hope" id="resumeHope">
						<div class="dtl">
							<div class="header">구직희망사항</div>
							<div class="con">
								<div class="input_box">
									<div class="job">
										<div class="text">희망직종</div>
										<div class="input">${DATA.SECTOR_NO}</div>
									</div>
									<div class="hope_loc">
										<div class="text">근무지역</div>
										<div class="input">
											<div class="locSelectBox" >
												<select class="citySel" id="city[1]" name="city[1]" locResumNo="1">
													<option value="-1">시도 선택</option>
													<option value="16">전체</option>
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
												<select id="region[1]" name="region[1]">
													
												</select>
											</div>
											<div class="locSelectBox" >
												<select class="citySel" id="city[2]" name="city[2]" locResumNo="2">
													<option value="-1">시도 선택</option>
													<option value="16">전체</option>
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
												<select id="region[2]" name="region[2]">
													
												</select>
											</div>
											<div class="locSelectBox" >
												<select class="citySel" id="city[3]" name="city[3]" locResumNo="3">
													<option value="-1">시도 선택</option>
													<option value="16">전체</option>
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
												<select id="region[3]" name="region[3]">
													
												</select>
											</div>
										</div>
									</div>
									<div class="work_format">
										<div class="text">근무형태</div>
										<div class="input">
						<%-- 					<c:forEach var="data" items="${WORK}">
												[&nbsp;${data.WORK_TYPE }&nbsp;]&nbsp;
											</c:forEach> --%>
											<label for="workType[0]">정규직</label>
											<input type="checkbox" name="workType[0]" id="workType[0]" value="0">
											<label for="workType[1]">계약직</label>
											<input type="checkbox" name="workType[1]" id="workType[1]" value="1">
											<label for="workType[2]">시간직</label>
											<input type="checkbox" name="workType[3]" id="workType[2]" value="2">
											<label for="workType[3]">기타</label>
											<input type="checkbox" name="workType[4]" id="workType[3]" value="3">
										</div>
									</div>
									<div class="sal">
										<div class="text">희망연봉</div>
										<div class="input">
											 <input type="radio" name="sal" value="기업내규" id="sal0">
	                                         <label for="sal0">내규</label>
	                                         <input type="radio" name="sal" value="일반" id="sal1">
	                                         <label for="sal1">일반</label>
	                                         <input type="text" placeholder="최저금액" value="${DATA.PAY_MIN}" id="minSal" disabled>만원 ~
	                                         <input type="text" placeholder="최대금액" value="${DATA.PAY_MAX}" id="maxSal" disabled>만원
                                        </div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 여기하고 있음 -->
					<form action="#" id="qualForm">
						<div class="content apply_dtl_lisence" id="resumeLisence">
							<div class="dtl">
								<div class="header">자격증</div>
								<div class="con add_box">
									<c:if test="${!empty QUAL }">
										<c:set var="qualCnt" value="0"/>
										<c:forEach var="data" items="${QUAL }">
											<div class="input_box" id="qualInput[${qualCnt }]" no="${qualCnt }" noName="qualNo">
											<input type="button" class="minus_btn" id="delBtn" value="－">
												<div class="data_container">
													<input type="text"  value="${data.QUAL_NO }">
													<input type="text"  value="${data.PASS_DATE }"> 
													<input type="text"  value="${data.ISSU_AGCY }">
												</div>
											</div>
											<c:set var="qualCnt" value="${qualCnt + 1 }"/>
										</c:forEach>
									</c:if>
									<input type="button" class="plus_btn" id="addBtn1" value="＋">
								</div>
							</div>
						</div>
					</form>
					
					<form action="#" id="flangForm">
						<div class="content apply_dtl_forei" id="resumeForeign">
							<div class="dtl">
								<div class="header">외국어능력</div>
								<div class="con add_box flang">
									<c:if test="${!empty FLANG }">
										<c:forEach var="data" items="${FLANG }">
											<div class="input_box">
											<input type="button" class="minus_btn" id="delBtn" value="－">
												<div class="data_container">
													<input type="text"  value="${data.FLANG_NO }"> 
													<input type="text"  value="${data.FLANG_TYPE }">
													<input type="text"  value="${data.FLANG_GRADE }">
												</div>
											</div>
										</c:forEach>
									</c:if>
									<input type="button" class="plus_btn" id="addBtn2" value="＋">
								</div>
							</div>
						</div>
					</form>
					
					<form action="#" id="carrForm">
						<div class="content apply_dtl_history" id="resumeHistory">
							<div class="dtl">
								<div class="header">경력사항</div>
								<div class="con add_box">
									<c:if test="${!empty CARR }">
										<c:forEach var="data" items="${CARR }">
											<div class="input_box more">
												<div class="data_container ">
													<div class="detail">
														기업 <input type="text" 
															value="${data.C_NAME }">
													</div>
													<div class="detail">
														부서 <input type="text" 
															value="${data.DPART }"> 직책 <input type="text"
															 value="${data.POS }">
													</div>
													<div class="detail">
														재직기간 <input type="text" 
															value="${data.ST_DATE }"> ~ <input type="text"
															 value="${data.END_DATE }"> 재직여부
														<input type="text" 
															value="${data.TURE_CHK }">
													</div>
													<div class="detail">
														직무내용
														<textarea name="" spellcheck="false" >${data.CARR_CNTT }</textarea>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<input type="button" class="plus_btn" id="addBtn3" value="＋">
								</div>
							</div>
						</div>
					</form>

					<form action="#" id="eduForm">
						<div class="content apply_dtl_Edu" id="resumeEdu">
							<div class="dtl">
								<div class="header">학력사항</div>
								<div class="con add_box">
									<c:if test="${!empty EDU }">
										<c:forEach var="data" items="${EDU }">
											<div class="input_box more">
												<div class="data_container ">
													<div class="detail">
														학교 <input type="text" 
															value="${data.SCH_NAME }">
													</div>
													<div class="detail">
														학부 <input type="text" 
															value="${data.SOL }"> 전공 <input type="text"
															 value="${data.MAJOR }">
													</div>
													<div class="detail">
														재학기간 <input type="text" 
															value="${data.ST_DATE }">~ <input type="text"
															 value="${data.END_DATE }">
													</div>
													<div class="detail">
														특이사항
														<textarea name="" spellcheck="false" >${data.EDU_ETC }</textarea>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<input type="button" class="plus_btn" id="addBtn4" value="＋">
								</div>
							</div>
						</div>
					</form>

					<form action="#" id="ieduForm">
						<div class="content apply_dtl_job_edu" id="resumeJobEdu">
							<div class="dtl">
								<div class="header">직무교육</div>
								<div class="con add_box ">
									<c:if test="${!empty IEDU }">
										<c:forEach var="data" items="${IEDU }">
											<div class="input_box more">
												<div class="data_container ">
													<div class="detail">
														기관 <input type="text" 
															value="${data.IEDU_NAME }">
													</div>
													<div class="detail">
														훈련과정 <input type="text" 
															value="${data.COSE_NAME }">
													</div>
													<div class="detail">
														교육기관 <input type="text" 
															value="${data.ST_DATE }">~ <input type="text"
															 value="${data.END_DATE }">
													</div>
													<div class="detail">
														교육내용
														<textarea name="" spellcheck="false" >${data.CNTT }</textarea>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<input type="button" class="plus_btn" id="addBtn5" value="＋">
								</div>
							</div>
						</div>
					</form>

					<form action="#" id="sintroForm">
						<div class="content apply_dtl_intro" id="resumeIntro">
							<div class="dtl">
								<div class="header">자기소개서</div>
								<div class="con add_box">
									<c:if test="${!empty SINTRO }">
										<c:forEach var="data" items="${SINTRO }">
											<div class="input_box text_box">
												<input type="text" 
													value="${data.SINTRO_NAME }">
												<div class="data_container">
													<textarea name="" spellcheck="false" >${data.SINTRO_CNTT }</textarea>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<input type="button" class="plus_btn" id="addBtn6" value="＋">
								</div>
							</div>
						</div>
					</form>

                    <form action="fileUploadAjax" id="fileForm" method="post" enctype="multi/form-data">
                        <input type="file" accept="image/*" name="att" id="att">
                    </form>
					<form action="#" id="attchForm">
						<div class="content apply_dtl_attch" id="resumeAttach">
							<div class="dtl">
								<div class="header">첨부파일</div>
								<div class="con add_box">
									<c:if test="${!empty ATTACH }">
										<div class="input_box ">
											<div class="data_container file_container">
												<c:forEach var="data" items="${ATTACH }">
													<div id="fileSNm">${data.ATTCH_NAME }</div>
												</c:forEach>
											</div>
										</div>
									</c:if>
									<input type="button" class="plus_btn" id="addBtn7" value="＋">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="float_right_nav_wrap" id="floatRightNavWrap">
			<div class="float_right_nav">
				<div>
					<a href="#resumeName">이력서제목</a>
				</div>
				<div>
					<a href="#resumeUser">지원자정보</a>
				</div>
				<div>
					<a href="#resumeHope">구직희망사항</a>
				</div>
				<div>
					<a href="#resumeLisence">자격증</a>
				</div>
				<div>
					<a href="#resumeForei">외국어능력</a>
				</div>
				<div>
					<a href="#resumeHistory">경력사항</a>
				</div>
				<div>
					<a href="#resumeEdu">학력사항</a>
				</div>
				<div>
					<a href="#resumeJobEdu">직무교육</a>
				</div>
				<div>
					<a href="#resumeIntro">자기소개서</a>
				</div>
				<div>
					<a href="#resumeAttach">첨부파일</a>
				</div>
			</div>
		</div>
	</main>
</body>
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
			<div class="footer_dtl_contents_2">등록일자 2021년 9월 ?일 | 발행 (주)일력거
				| 편집 (주)일력거</div>
			<div class="footer_dtl_contents_3">발행소 서울시 금천구 가산디지털2로 구디아카데미 |
				전화번호 02-1234-5678</div>
			<div class="copyright">©WorkRickshaw. All rights reserved.</div>
		</div>
	</div>
</footer>
</html>