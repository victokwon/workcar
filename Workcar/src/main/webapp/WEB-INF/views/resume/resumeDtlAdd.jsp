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
   <link rel="stylesheet" type="text/css"
   href="resources\css\resume\pop.css">

<script type="text/javascript"
   src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
	src="resources/script/jquery/jquery.form.js"></script> 
<script type="text/javascript" src="resources\script\resume\sector.js"></script>
<script type="text/javascript" src="resources\script\resume\qual.js"></script>
<script type="text/javascript" src="resources\script\resume\fileupload.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
	$(function() {
	    var noBox = {
	          qualNo: 0,
	          flangNo: 0,
	          carrNo: 0,
	          eduNo: 0,
	          ieduNo: 0,
	          sintroNo: 0,
	          attchNo: 0
	         }
	   
		 $(".list_wrap").on("click", "tr", function () {
			  	if($(".pop-container").attr("btn") == "q"){
			  		let target = $("#list_box").attr("no")
					$("#qualName"+target+"").val($(this).attr("qName"));
				    $("#qualNo"+target+"").val($(this).attr("qNo"));
				    $(".pop-container").hide();
			  	}else if($(".pop-container").attr("btn") == "s"){
			  	    $("#sectorInput").html($(this).attr("sName"))
				    $("#sectorInput").attr( "sNo",$(this).attr("sNo"))
				    $("#sectorNo").val($(this).attr("sNo"))
				    $(".pop-container").hide()
		  		}
	 	 });
	    
	    
	    $("#saveBtn").on("click",function(){
	    	console.log($("#sal0").is(":checked"))
			if($("#sal0").is(":checked")){
				$("#salMin").val("0")
				$("#salMax").val("0")
			}
	    	console.log($("#carr0").is(":checked"))
			if($("#carr0").is(":checked")){
				$("#carrPer").val("0")
			}
			
			if(checkInputText()
					&&checkInputSel()
					&&checkInputDate()
					&&checkInputTextarea()
					&&checkQualVal()){
			    $("#sectorNo").val($("#sectorInput").attr( "sNo"))
			   $("#updateForm").attr("action", "resumeUpdate")
			   $("#updateForm").submit() 
			}
		})
		
		if("${msg}"!=""){
		   alert(${msg})
		}
      
		$(".locSelectBox").on("change",".citySel",function(){
		   getRegion($(this).val(), $(this).next())
		}) 
      
		$("#resumeList").on("click","div",function(){
		   let resumeNo = $(this).attr("resumeNo")
		   $("#resumeNo").val(resumeNo)
		   $("#actGbn").val("Dtl")
		   $("#resumeGo").attr("action", "resumeDtl")
		   $("#resumeGo").submit()
		})
   
		
		 $(".add_box").on("click", ".minus_btn", function () {
		   let target = $(this).parent().attr("noName")
		   noBox[target] --
		  $(this).parent().remove();
		}); 
       
		$(".sal").on("change", "input", function () {
		     if ($("#sal1").is(":checked")) {
		       $("#minSal").attr("readonly", false);
		       $("#maxSal").attr("readonly", false);
		     } else {
		       $("#minSal").attr("readonly", true);
		       $("#maxSal").attr("readonly", true);
		     }
		 });
		
		$(".carr").on("change", "input", function () {
		     if ($("#carr1").is(":checked")) {
		       $("#carrPer").attr("readonly", false);
		     } else {
		       $("#carrPer").attr("readonly", true);
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
		  html += '<div class="input_box " id="qualInput'+noBox.qualNo+'" no="'+noBox.qualNo+'" noName="qualNo">';
		  html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
		  html += '<div class="data_container">';
		  html += '<button type="button" id="qualBtn" no="'+noBox.qualNo+'" btn="q">자격증검색</button>';
		  html += '<input class="qual_input" name="qualNo" id="qualNo'+noBox.qualNo+'" type="hidden" value="데이터 / 자격증명" readonly>';
		  html += '<input class="qual_input" id="qualName'+noBox.qualNo+'" type="text" value="자격증명" disabled>';
		  html += '<input class="qual_input" name="issuAgcy" id="issuAgcy'+noBox.qualNo+'" type="text" placeholder="발급처">';
		  html += '<input class="qual_input" name="passDate" id="passDate'+noBox.qualNo+'" type="date" ';
		  html += " </div>";
		  html += " </div>";
		
		  $(this).parent().prepend(html);
		  noBox.qualNo += 1
		  
		  }else{
		  alert("등록 초과(최대 3개 등록 가능)")
		  }
		});
        
        // 외국어 2
		$("#addBtn2").on("click", function () {
		
		   if(noBox.flangNo<3){
		
		  html = "";
		  html += '<div class="input_box" id="flangInput'+noBox.flangNo+'" no="'+noBox.flangNo+'" noName="flangNo">';
		  html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
		  html += '<div class="data_container">';
		  html += '<select name="flangNo" id="flangNo">';
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
		  html += '<select name="flangType" id="flangType'+noBox.flangNo+'">';
		  html += '<option value="-1">타입 선택</option>';
		  html += '<option value="읽기/쓰기">읽기/쓰기</option>';
		  html += '<option value="회화">회화</option>';
		  html += " </select>";
		  html += '<label for="flangGrade">수준</label>';
		  html += '<select name="flangGrade" id="flangGrade'+noBox.flangNo+'">';
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
		  alert("등록 초과(최대 3개 등록 가능)")
		  }
		});
        
        // 경력사항 3
		$("#addBtn3").on("click", function () {
		
		   if(noBox.carrNo<3){
		
		  html = "";
		  html += '<div class="input_box more" id="carrInput'+noBox.carrNo+'" no="'+noBox.carrNo+'" noName="carrNo">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		  html += '<div class="data_container ">';
		  html += '<div class="detail">';
		  html += " 기업";
		  html += '<input type="text" name="cName" id="cName'+noBox.carrNo+'" value="-" placeholder="기업명">';
		  html += " </div>";
		  html += '<div class="detail">'; 
		  html += " 부서";
		  html += '<input type="text" name="dpart" id="dpart'+noBox.carrNo+'" value="-" placeholder="부서명">';
		  html += " 직책";
		  html += '<input type="text" name="pos" id="pos'+noBox.carrNo+'" value="-" placeholder="직책명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 재직기간";
		  html += '<input type="date" name="carrStDate" id="stDate'+noBox.carrNo+'" placeholder="시작 년/월">~';
		  html += '<input type="date" name="carrEndDate" id="EndDate'+noBox.carrNo+'" placeholder="종료 년/월">';
		  html += " 재직여부";
		  html += '<select name="tureChk">'
		  html += '<option value="퇴직">퇴직</option>'
		  html += '<option value="재직">재직</option>'
		  html += '</select>'
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 직무내용";
		  html +=
		    '<textarea placeholder="직무내용" spellcheck="false" name="carrCntt" id="carrCntt'+noBox.carrNo+'">작성필수</textarea>';
		  html += " </div>";
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.carrNo ++
		  
		  }else{
		  alert("등록 초과(최대 3개 등록 가능)")
		  }
		});
        
        // 학력사항 4
		$("#addBtn4").on("click", function () {
		
		   if(noBox.eduNo<3){
		
		  html = "";
		  html += '<div class="input_box more" id="eduInput'+noBox.eduNo+'" no="'+noBox.eduNo+'" noName="eduNo">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		  html += '<div class="data_container ">';
		  html += '<div class="detail">';
		  html += " 학교";
		  html += '<input type="text" name="schName" id="schName'+noBox.eduNo+'" value="-" placeholder="학교명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 학부";
		  html += '<input type="text" name="sol" id="sol'+noBox.eduNo+'" value="-" placeholder="학부명">';
		  html += " 학과";
		  html += '<input type="text" name="major" id="major'+noBox.eduNo+'" value="-" placeholder="전공명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 재학기간";
		  html += '<input type="date" name="eduStDate" id="eduStDate'+noBox.eduNo+'" placeholder="시작 년/월">~';
		  html += '<input type="date" name="eduEndDate" id="eduEndDate'+noBox.eduNo+'" placeholder="종료 년/월">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 특이사항";
		  html +=
		    '<textarea placeholder="특이사항" spellcheck="false" name="eduCntt" id="eduCntt'+noBox.eduNo+'">작성필수</textarea>';
		  html += " </div>";
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.eduNo ++
		  
		  }else{
		  alert("등록 초과(최대 3개 등록 가능)")
		  }
		});
        
        // 직무교육 5
		$("#addBtn5").on("click", function () {
		
		   if(noBox.ieduNo<3){
		
		  html = "";
		  html += '<div class="input_box more" id="ieduInput'+noBox.ieduNo+'" no="'+noBox.ieduNo+'" noName="ieduNo">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		  html += '<div class="data_container ">';
		  html += '<div class="detail">';
		  html += "기관";
		  html += '<input type="text" name="ieduName" id="ieduName'+noBox.ieduNo+'" value="-" placeholder="기관명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 훈련과정";
		  html += '<input type="text" name="coseName" id="coseName'+noBox.ieduNo+'" value="-" placeholder="훈련과정명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 교육기간";
		  html += '<input type="date" name="ieduStDate" id="stDate'+noBox.ieduNo+'" placeholder="시작 년/월">~';
		  html += '<input type="date" name="ieduEndDate" id="EndDate'+noBox.ieduNo+'" placeholder="종료 년/월">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 교육내용";
		  html +=
		    '<textarea placeholder="교육내용" spellcheck="false" name="ieduCntt" id="ieduCntt'+noBox.ieduNo+'" >작성필수</textarea>';
		  html += " </div>";
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.ieduNo ++
		  
		  }else{
		  alert("등록 초과(최대 3개 등록 가능)")
		  }
		});
        
        // 자기소개서 6
		$("#addBtn6").on("click", function () {
		
		   if(noBox.sintroNo<3){
		   
		  html = "";
		  html += '<div class="input_box text_box" id="sintroInput'+noBox.sintroNo+'" no="'+noBox.sintroNo+'" noName="sintroNo">';
		  html += '<input type="text" name="sintroName" id="sintroName'+noBox.sintroNo+'" placeholder="자기소개서 제목 입력">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
		  html += '<div class="data_container">';
		  html +=
		    '<textarea placeholder="자기소개서 내용 입력" spellcheck="false" name="sintroCntt" id="sintroCntt'+noBox.sintroNo+'">작성필수</textarea>';
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.sintroNo ++
		  
		  }else{
		  alert("등록 초과(최대 3개 등록 가능)")
		  }
		});
        
        // 첨부파일 7
	$("#addBtn7").on("click", function () {
	     
	        if(noBox.attchNo<3){
	        
	       html = "";
	       html += '<div class="input_box " id="attchInput'+noBox.attchNo+'" no="'+noBox.attchNo+'" noName="attchNo">';
	       html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
	       html += '<div class="data_container file_container">';
	       html += '<div class="fileSNm" id="fileName' +noBox.attchNo+ '" name="attchName" id="attchName'+noBox.attchNo+'">파일명</div>';
	       html += '<input type="hidden" id="mFile'+noBox.attchNo+'" name="fileNm" value="">';
	       html += '<button type="button" id="fileBtn" target="' +noBox.attchNo+'">파일업로드</button>';
	       html += " </div>";
	       html += " </div>";
	       $(this).parent().prepend(html);
	       noBox.attchNo ++
	       
	       }else{
	       alert("등록 초과(최대 3개 등록 가능)")
	       }
	     });   
	})
   
	function getRegion(city, target, val){
	   $.ajax({
	         type : "POST",
	         data : "cityNo=" + city,
	         url : "getRegionAjax",
	         dataType : "json",
	         success : function(res) {
	            if (res.result == "SUCCESS") {
	               regionOptionDraw(res.list ,target, val)
	            } else if (res.result == "FAILED") {
	               console.log(res.result)
	            }
	         },
	         error : function(request, status, error) {
	            console.log(error);
	         }
	      });
	}


	function regionOptionDraw(list, target, val){
	   var html= "" 
	      for(data of list){
	            html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
	      }
	   target.html(html);
	   
	   if(val != null) {
		   target.val(val);
	   }
	}

	function linkGo(url) {
	      location.href = url
	}
	   
	function linkBack() {
	      history.back()
	}
	
   	function checkInputText(){
   		let flag = true
   		$("input[type=text]").each(function(idx){
   			if($(this).val() == ""){
   				alert("입력값이 누락되었습니다.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkInputDate(){
   		let flag = true
   		$("input[type=date]").each(function(idx){
   			if($(this).val() == ""){
   				alert("입력값이 누락되었습니다.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkInputSel(){
   		let flag = true
 		$("input[type=select]").each(function(idx){
   			if($(this).val() < 0){
   				alert("선택값이 누락되었습니다.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkInputTextarea(){
   		let flag = true
 		$("textarea").each(function(idx){
   			if($(this).val() < 0){
   				alert("선택값이 누락되었습니다.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkQualVal(){
   		let flag = true
   		let arr = new Array() 
 		$("input[name=qualNo]").each(function(idx){
			arr.push($(this).val())
   		})
   		let set = new Set(arr)  
			if(arr.length != set.size){
   				alert("자격증이 중복되었습니다.")
   				flag = false
   				return false
   			}
   		return flag
   	}
   	function checkHidden(){
   		let flag = true
   			if($("#sectorInput").attr("sNo") < 0 ){
   				alert("입력값이 누락되었습니다.")
   				$(this).focus()
   				flag = false
   				return false
   		}
   		return flag
   	}
</script>
</head>

<body>
<!-- 여기 폼  -->
	<!-- <form action="#" method="post" id="updateForm">
		<input type="hidden" name="cityArr" value="">
	
	</form> -->

    <form action="#" id="resumeGo" method="post">
        <input type="hidden" id="memNo" name="memNo" value="${sMNo}">
        <input type="hidden" id="resumeNo" name="resumeNo" value="">
        <input type="hidden" id="actGbn" name="actGbn">
    </form>

    <div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1></h1>
                </div>
                <form class="pop-user" id="schForm">
                    <input type="hidden" name="page" id="page" value="${page }">
                    <div class="pop-input">
                        <input type="button" class="sch-btn" id="schSectorBtn" value="검색">
                        <input type="button" class="sch-btn" id="schQualBtn" value="검색">
                        <input name="schDataName" id="schName" placeholder="검색어">
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
            <button type="button" class="main_button" id="defaultOpen" onclick="linkGo('resumeList')">이력서관리</button>
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
          
                <div class="main_box">
                  <form action="#" method="post" id="updateForm">
                  <input type="hidden" name="dtlGbn" value="add"> 
                  <input type="hidden" name="memNo" value="${sMNo }"> 
                    <div class="content apply_dtl_header" id="resumeName">
                        <div class="apply_dtl">
                             <input type="text" id="resumeName" name="resumeName" value="" >
                            <span class="apply_dtl_opn">
                                <select id="opencase" name="openCase" class="opencase" >
                                    <option value="1">공개</option>
                                    <option value="0">비공개</option>
                                </select>
                            </span>
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
                                            <div class="input">${DATA.GENDER_NAME}</div>
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
                                                    <select class="citySel" id="city0" name="city" >
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
                                                    <select id="region0" name="region" >
                                                        <option value="16">전체</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="edu">
                                            <div class="text">최종학력</div>
                                            <div class="input">
                                                <select name="gradu" id="gradu"  >
                                                    <option value="">학력 선택</option>
                                                    <option value="1">고등학교</option>
                                                    <option value="2">전문대학</option>
                                                    <option value="3">대학교</option>
                                                    <option value="4">석사</option>
                                                    <option value="5">박사</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="carr">
                                            <div class="text">경력</div>
                                            <div class="input">
                                                <input type="radio" name="carr" value="1" id="carr0" checked="checked">
                                                <label for="carr0">신입</label>
                                                <input type="radio" name="carr" value="2" id="carr1">
                                                <label for="carr1">경력</label>
                                             	<input type="text" name="carrPer" value="" placeholder="경력" id="carrPer" class="radioInput" readonly="readonly">년
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
                                            <input type="hidden" name="sectorNo" id="sectorNo" value="">
                                            <div class="input" id="sectorInput" sNo=""></div>
                                            <button type="button" id="sectorBtn" btn="s">직종 검색</button>
                                        </div>
                                        <div class="hope_loc">
                                            <div class="text">근무지역</div>
                                            <div class="input">
                                            <c:set var="locNo" value="1"/>
                                            	<c:forEach var="i" begin="1" step="1" end="3"  >
	                                                <div class="locSelectBox">
	                                                    <select class="citySel" id="city${locNo }" name="city" >
	                                                        <option value="16" >전체</option>
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
	                                                    <select id="region${locNo }" name="region" >
															<option value="16">전체</option>	
	                                                    </select>
	                                                    <c:set var="locNo" value="${locNo + 1 }"></c:set>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="work_format">
                                            <div class="text">근무형태</div>
                                            <div class="input">
                                               <label for="workType0">무관</label>
                                               <input type="checkbox" name="workType" id="workType0" value="0" checked="checked">
                                               <label for="workType1">정규직</label>
                                               <input type="checkbox" name="workType" id="workType1" value="1">
                                               <label for="workType2">계약직</label>
                                               <input type="checkbox" name="workType" id="workType2" value="2">
                                               <label for="workType3">시간직</label>
                                               <input type="checkbox" name="workType" id="workType3" value="3">
                                               <label for="workType4">기타</label>
                                               <input type="checkbox" name="workType" id="workType4" value="4">
                                            </div>
                                        </div>
                                        <div class="sal">
                                            <div class="text">희망연봉</div>
                                            <div class="input">
                                                <input type="radio" name="sal" value="0" id="sal0" checked="checked">
                                                <label for="sal0">내규</label>
                                                <input type="radio" name="sal" value="1" id="sal1">
                                                <label for="sal1">일반</label>
                                          		<input type="text" placeholder="최저금액" name="salMin"  class="radioInput salinput"
                                                    value="" id="salMin" readonly="readonly">만원 ~
                                                <input type="text" placeholder="최대금액" name="salMax" class="radioInput salinput"
                                                    value="" id="salMax" readonly="readonly">만원	
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_lisence" id="resumeLisence">
                            <div class="dtl">
                                <div class="header">자격증</div>
                                <div class="con add_box">
                                    <input type="button" class="plus_btn" id="addBtn1" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_forei" id="resumeForeign">
                            <div class="dtl">
                                <div class="header">외국어능력</div>
                                <div class="con add_box flang">
                                    <input type="button" class="plus_btn" id="addBtn2" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_history" id="resumeHistory">
                            <div class="dtl">
                                <div class="header">경력사항</div>
                                <div class="con add_box">
                                    <input type="button" class="plus_btn" id="addBtn3" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_Edu" id="resumeEdu">
                            <div class="dtl">
                                <div class="header">학력사항</div>
                                <div class="con add_box">
                                    <input type="button" class="plus_btn" id="addBtn4" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_job_edu" id="resumeJobEdu">
                            <div class="dtl">
                                <div class="header">직무교육</div>
                                <div class="con add_box ">
                                    <input type="button" class="plus_btn" id="addBtn5" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_intro" id="resumeIntro">
                            <div class="dtl">
                                <div class="header">자기소개서</div>
                                <div class="con add_box">
                                    <input type="button" class="plus_btn" id="addBtn6" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_attch" id="resumeAttach">
                            <div class="dtl">
                                <div class="header">첨부파일</div>
                                <div class="con add_box" id="fileBox">
                                    <input type="button" class="plus_btn" id="addBtn7" value="＋">
                                </div>
                            </div>
                        </div>
                    </form>
                    
     <form action="fileUploadAjax" id="fileForm" method="post" enctype="multi/form-data">
        <input type="file" accept="image/*" name="att" id="att" target="">
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