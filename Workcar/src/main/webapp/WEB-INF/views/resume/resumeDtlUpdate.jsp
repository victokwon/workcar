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
   href="resources\css\resume\sector.css">

<script type="text/javascript"
   src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources\script\resume\sector.js"></script>
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
	   
		
	   $("select").each(function(idx) {
		   if($(this).attr("selValue") != "") {
			   $(this).val($(this).attr("selValue"));
		   }
	   });
	    
	   $("selectname='region'").each(function(idx) {
		   getRegion($("#city" + idx + "").val(), $(this), $(this).attr("selValue"));
	   });
	   
       /* for(let i = 0; i < $("select").length;i++){
    	   if($("select").eq(i).attr("selValue") != ""){
    		   let target = $("select").eq(i)
    		   target.val(target.attr("selValue")).attr("selected", "selected");
    	   }
       } */
	    
      /*  for(let i = 0; i < $("selectname='city'").length;i++){
    	   let city = $("selectname='city'").eq(i).val()
    	   let target = $("selectname='region'").eq(i)
    	   
    	   getRegion(city, target)
    	   
    	   console.log(target)
    	   console.log(target.attr("selValue")) 
    	  target.val(target.attr("selValue")).attr("selected", "selected");
       } */
	    
	    
		$("#saveBtn").on("click",function(){
	/* 		
			let city
			let region
			
			let workType
			
			let qualNo
			let issuAgcy
			let passDate
			
			let flangNo
			let flangType
			let flangGrade
			
			let cName
			let dpart
			let pos
			let carrStDate
			let carrEndData
			let tureChk
			let carrCntt
			
			let schName
			let sol
			let major
			let eduStDate
			let eduEndData
			let eduCntt
			
			let ieduName
			let coseName
			let ieduStDate
			let ieduEndDate
			let ieduCntt
			
			let sintroName
			let sintroCntt 
			
			*/
			
			
		   $("#updateForm").attr("action", "resumeUpdate")
		   $("#updateForm").submit() 
		})
		
		if("${msg}"!=""){
		   alert(${msg})
		}
      
		$(".locSelectBox").on("change",".citySel",function(){
		   getRegion($(this).val(), $(this).next())
		}) 
      
		/* $("#gradu").val("${DATA.GRADU}").attr("selected", "selected"); */
		
	/* 	$("#city").val("${DATA.CITY_NO}").attr("selected", "selected");
		getRegion($("#city").val()) */
		
      
		$("#resumeList").on("click","div",function(){
		   let resumeNo = $(this).attr("resumeNo")
		   $("#resumeNo").val(resumeNo)
		   $("#actGbn").val("Dtl")
		   $("#resumeGo").attr("action", "resumeDtl")
		   $("#resumeGo").submit()
		})
   
		/* $(".apply_content").on("click", ".apply_update_btn", function () {
		   $("#resumeNo").val($(this).parent().parent().attr("resumeNo"));
		  }); */
		
		$(".add_box").on("click", ".minus_btn", function () {
		   let target = $(this).parent().attr("noName")
		   noBoxtarget] --
		   console.log(noBox)
		  $(this).parent().remove();
		});
       
		if ($("#sal1").is(":checked")) {
		      $("#minSal").attr("disabled", true);
		      $("#maxSal").attr("disabled", true);
		} else {
		       $("#minSal").attr("disabled", false);
		       $("#maxSal").attr("disabled", false);
		}
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
		
		if($("#sal0").val() == "${DATA.PAY_GBN}"){
		   $("#sal0").attr("checked","checked")
		}
		if($("#sal1").val() == "${DATA.PAY_GBN}"){
		   $("#sal1").attr("checked","checked")
		}

      
       // 자격증 1
		$("#addBtn1").on("click", function () {
		
		   if(noBox.qualNo<3){
		   
		  let html = "";
		  html += '<div class="input_box " id="qualInput'+noBox.qualNo+'" no="'+noBox.qualNo+'" noName="qualNo">';
		  html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
		  html += '<div class="data_container">';
		  html +=
		    '<input type="button" class="" id="lisenceSchBtn" value="자격증 검색">';
		  html += '<input class="qual_input" name="qualNo" id="qualNo'+noBox.qualNo+'" type="text" value="데이터 / 자격증명" readonly>';
		  html += '<input class="qual_input" name="issuAgcy" id="issuAgcy'+noBox.qualNo+'" type="text" placeholder="발급처">';
		  html += '<input class="qual_input" name="passDate" id="passDate'+noBox.qualNo+'" type="text" placeholder="발급일">';
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
		  html += '<input type="text" name="cName" id="cName'+noBox.carrNo+'" placeholder="기업명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 부서";
		  html += '<input type="text" name="dpart" id="dpart'+noBox.carrNo+'" placeholder="부서명">';
		  html += " 직책";
		  html += '<input type="text" name="pos" id="pos'+noBox.carrNo+'" placeholder="직책명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 재직기간";
		  html += '<input type="text" name="carrStDate" id="stDate'+noBox.carrNo+'" placeholder="시작 년/월">~';
		  html += '<input type="text" name="carrEndData" id="endData'+noBox.carrNo+'" placeholder="종료 년/월">';
		  html += " 재직여부";
		  html += '<select name="tureChk">'
		  html += '<option value="퇴직">퇴직</option>'
		  html += '<option value="재직">재직</option>'
		  html += '</select>'
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 직무내용";
		  html +=
		    '<textarea placeholder="직무내용" spellcheck="false" name="carrCntt" id="carrCntt'+noBox.carrNo+'"></textarea>';
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
		  html += '<input type="text" name="schName" id="schName'+noBox.eduNo+'" placeholder="학교명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 학부";
		  html += '<input type="text" name="sol" id="sol'+noBox.eduNo+'" placeholder="학부명">';
		  html += " 학과";
		  html += '<input type="text" name="major" id="major'+noBox.eduNo+'" placeholder="전공명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 재학기간";
		  html += '<input type="text" name="eduStDate" id="eduStDate'+noBox.eduNo+'" placeholder="시작 년/월">~';
		  html += '<input type="text" name="eduEndData" id="eduEndDate'+noBox.eduNo+'" placeholder="종료 년/월">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 특이사항";
		  html +=
		    '<textarea placeholder="특이사항" spellcheck="false" name="eduCntt" id="eduCntt'+noBox.eduNo+'">없음</textarea>';
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
		  html += '<input type="text" name="ieduName" id="ieduName'+noBox.ieduNo+'" placeholder="기관명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 훈련과정";
		  html += '<input type="text" name="coseName" id="coseName'+noBox.ieduNo+'" placeholder="훈련과정명">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 교육기간";
		  html += '<input type="text" name="ieduStDate" id="stDate'+noBox.ieduNo+'" placeholder="시작 년/월">~';
		  html += '<input type="text" name="ieduEndData" id="endData'+noBox.ieduNo+'" placeholder="종료 년/월">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " 교육내용";
		  html +=
		    '<textarea placeholder="교육내용" spellcheck="false" name="ieduCntt" id="ieduCntt'+noBox.ieduNo+'"></textarea>';
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
		    '<textarea placeholder="자기소개서 내용 입력" spellcheck="false" name="sintroCntt" id="sintroCntt'+noBox.sintroNo+'"></textarea>';
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
	       html += '<div class="fileSNm" id="fileSNm' +noBox.attchNo+ '" name="attchName" id="attchName'+noBox.attchNo+'">파일명</div>';
	       html += '<input type="hidden" id="fileLNm">';
	       html += '<button type="button">파일업로드</button>';
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
		console.log(city);
		console.log(target);
		console.log(val);
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
   

</script>
<!-- <script type="text/javascript" src="resources\script\resume\locAjax.js"></script> -->
</head>

<body>
<!-- 여기 폼  -->
	<!-- <form action="#" method="post" id="updateForm">
		<input type="hidden" name="cityArr" value="">
	
	</form> -->
	
    <form action="#" id="resumeGo" method="post">
        <input type="hidden" id="memNo" name="memNo" value="${sMNo}">
        <input type="hidden" id="resumeNo" name="resumeNo" value="${DATA.RESUM_NO }">
        <input type="hidden" id="actGbn" name="actGbn">
    </form>

    <div class="pop-container">
        <div class="pop-out-container">
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1>직종검색</h1>
                </div>

                <form class="pop-user" id="sectorSchForm">
                    <input type="hidden" name="page" id="page" value="${page }">
                    <div class="pop-input">
                        <input type="button" id="schBtn" value="검색">
                        <input type="text" name="schSectorName" id="schSectorName" placeholder="직종명">
                    </div>
                </form>

                <!-- 5개 리스트 -->
                <div class="company_wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>내용</th>
                            </tr>
                        </thead>
                        <tbody id="sectorList">
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
                <!-- form 내부의 button 동작 막기 -->
                <div class="main_box">
                    <div class="content apply_dtl_header" id="resumeName">
                        <div class="apply_dtl">
                            <span class="apply_dtl_name">${DATA.RESUM_NAME}</span><br>
                            <span class="apply_dtl_date">최종수정일 | ${DATA.CHN_DATE}</span>
                            <span class="apply_dtl_opn">
                                <select id="opencase" name="openCase" class="opencase" selValue="${DATA.OPN_CHK}">
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
                     <form action="#" method="post" id="updateForm"> 
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
                                                    <select class="citySel" id="city0" name="city" locResumNo="0" selValue="${DATA.CITY_NO }">
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
                                                    <select id="region0" name="region" selValue="${DATA.REGION_NO }">

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="edu">
                                            <div class="text">최종학력</div>
                                            <div class="input">
                                                <select name="gradu" id="gradu" selValue="${DATA.GRADU}" >
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
                                            <div class="input" id="sectorInput">${DATA.SECTOR_NAME}</div>
                                            <button type="button" id="sectorBtn">직종 검색</button>
                                        </div>
                                        <div class="hope_loc">
                                            <div class="text">근무지역</div>
                                            <div class="input">
                                            <c:set var="locNo" value="1"/>
                                            	<c:forEach var="data" items="${LOC }">
	                                                <div class="locSelectBox">
	                                                    <select class="citySel" id="city${locNo }" name="city" selValue="${data.CITY_NO}">
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
	                                                    <select id="region${locNo }" name="region" selValue="${data.REGION_NO }">
	
	                                                    </select>
	                                                    <c:set var="locNo" value="${locNo + 1 }"></c:set>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="work_format">
                                            <div class="text">근무형태</div>
                                            <div class="input">
                                                <c:set var="workTypeCnt" value="0" />
                                                <c:forEach var="data" items="${WORK}">
                                                    <label for="workType${ workTypeCnt}">${data.WORK_TYPE_NAME }</label>
                                                    <c:choose>
                                                        <c:when test="${!empty data.WORK_TYPE}">
                                                            <input type="checkbox" name="workType" id="workType${workTypeCnt }" value="${ data.SCD_CAT}" checked="checked">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="checkbox" name="workType" id="workType${workTypeCnt }" value="${ data.SCD_CAT}">
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:set var="workTypeCnt" value="${workTypeCnt + 1 }"></c:set>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="sal">
                                            <div class="text">희망연봉</div>
                                            <div class="input">
                                                <input type="radio" name="sal" value="0" id="sal0">
                                                <label for="sal0">내규</label>
                                                <input type="radio" name="sal" value="1" id="sal1">
                                                <label for="sal1">일반</label>
                                                <input type="text" placeholder="최저금액" name="salMin"
                                                    value="${DATA.PAY_MIN}" id="minSal" disabled>만원 ~
                                                <input type="text" placeholder="최대금액" name="salMax"
                                                    value="${DATA.PAY_MAX}" id="maxSal" disabled>만원
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
                                    <c:if test="${!empty QUAL }">
                                        <c:set var="qualCnt" value="0" />
                                        <c:forEach var="data" items="${QUAL }">
                                            <div class="input_box" id="qualInput${qualCnt }" no="${qualCnt }" noName="qualNo">
                                                <input type="button" class="minus_btn" id="delBtn" value="－">
                                                <div class="data_container">
                                                    <input type="text" name="qualNo" value="${data.QUAL_NAME }" readonly="readonly">
                                                    <input type="date" name="issuAgcy" value="${data.PASS_DATE }">
                                                    <input type="text" name="passDate" value="${data.ISSU_AGCY }">
                                                </div>
                                            </div>
                                            <c:set var="qualCnt" value="${qualCnt + 1 }" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn1" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_forei" id="resumeForeign">
                            <div class="dtl">
                                <div class="header">외국어능력</div>
                                <div class="con add_box flang">
                                    <c:if test="${!empty FLANG }">
                                        <c:set var="flangCnt" value="0" />
                                        <c:forEach var="data" items="${FLANG }">
                                            <div class="input_box" id="flangInput${flangCnt }" no="${flangCnt }" noName="flangNo">
                                                <input type="button" class="minus_btn" id="delBtn" value="－">
                                                <div class="data_container">
                                                    <input type="text" name="flangNo" value="${data.FLANG_NAME }">
                                                    <input type="text" name="flangType" value="${data.FLANG_TYPE }">
                                                    <input type="text" name="flangGrade" value="${data.FLANG_GRADE }">
                                                </div>
                                            </div>
                                            <c:set var="flangCnt" value="${ flangCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn2" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_history" id="resumeHistory">
                            <div class="dtl">
                                <div class="header">경력사항</div>
                                <div class="con add_box">
                                    <c:if test="${!empty CARR }">
                                        <c:set var="carrCnt" value="0" />
                                        <c:forEach var="data" items="${CARR }">
                                            <div class="input_box more" id="carrInput${carrCnt }" no="${carrCnt }" noName="carrNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="－">
                                                <div class="data_container ">
                                                    <div class="detail">
                                                        기업 <input type="text" name="cName${ carrCnt}" value="${data.C_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        부서 <input type="text" name="dpart" value="${data.DPART }"> 
                                                        직책 <input type="text" name="pos" value="${data.POS }">
                                                    </div>
                                                    <div class="detail">
                                                        재직기간 <input type="date" name="carrStDate" value="${data.ST_DATE }">
                                                        ~ <input type="date" name="carrEndData" value="${data.END_DATE }">
                                                        재직여부 
                                                        <select name="tureChk" value="${data.TURE_CHK }" >
                                                        	<option value="퇴직">퇴직</option>
                                                        	<option value="재직">재직</option>
                                                        </select>
                                                    </div>
                                                    <div class="detail">
                                                        직무내용
                                                        <textarea name="carrCntt" spellcheck="false">${data.CARR_CNTT }</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="carrCnt" value="${ carrCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn3" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_Edu" id="resumeEdu">
                            <div class="dtl">
                                <div class="header">학력사항</div>
                                <div class="con add_box">
                                    <c:if test="${!empty EDU }">
                                        <c:set var="eduCnt" value="0" />
                                        <c:forEach var="data" items="${EDU }">
                                            <div class="input_box more" id="eduInput${eduCnt }" no="${eduCnt }" noName="eduNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="－">
                                                <div class="data_container ">
                                                    <div class="detail">
                                                        학교 <input type="text" name="schName" value="${data.SCH_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        학부 <input type="text" name="sol" value="${data.SOL }">
                                                        전공 <input type="text" name="major" value="${data.MAJOR }">
                                                    </div>
                                                    <div class="detail">
                                                        재학기간 <input type="date" name="eduStDate" value="${data.ST_DATE }">
                                                        ~ <input type="date" name="eduEndData" value="${data.END_DATE }">
                                                    </div>
                                                    <div class="detail">
                                                        특이사항
                                                        <textarea name="eduCntt" spellcheck="false">${data.EDU_ETC }</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="eduCnt" value="${ eduCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn4" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_job_edu" id="resumeJobEdu">
                            <div class="dtl">
                                <div class="header">직무교육</div>
                                <div class="con add_box ">
                                    <c:if test="${!empty IEDU }">
                                        <c:set var="ieduCnt" value="0" />
                                        <c:forEach var="data" items="${IEDU }">
                                            <div class="input_box more" id="ieduInput${ieduCnt }" no="${ieduCnt }" noName="ieduNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="－">
                                                <div class="data_container ">
                                                    <div class="detail">
                                                        기관 <input type="text" name="ieduName" value="${data.IEDU_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        훈련과정 <input type="text" name="coseName" value="${data.COSE_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        교육기간 <input type="date" name="ieduStDate" value="${data.ST_DATE }">
                                                        ~ <input type="date" name="ieduEndDate" value="${data.END_DATE }">
                                                    </div>
                                                    <div class="detail">
                                                        교육내용
                                                        <textarea name="ieduCntt" spellcheck="false">${data.CNTT }</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="ieduCnt" value="${ ieduCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn5" value="＋">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_intro" id="resumeIntro">
                            <div class="dtl">
                                <div class="header">자기소개서</div>
                                <div class="con add_box">
                                    <c:if test="${!empty SINTRO }">
                                        <c:set var="sintroCnt" value="0" />
                                        <c:forEach var="data" items="${SINTRO }">
                                            <div class="input_box more text_box" id="sintroInput${sintroCnt }" no="${sintroCnt }" noName="sintroNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="－">
                                                <input type="text" name="sintroName" value="${data.SINTRO_NAME }">
                                                <div class="data_container">
                                                    <textarea name="sintroCntt" spellcheck="false">${data.SINTRO_CNTT }</textarea>
                                                </div>
                                            </div>
                                            <c:set var="sintroCnt" value="${ sintroCnt + 1}" />
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
                                        <c:set var="attchCnt" value="0" />
                                        <c:forEach var="data" items="${ATTACH }">
                                            <div class="input_box " id="attchInput${attchCnt }" no="${attchCnt }" noName="attchNo">
                                                <input type="button" class="minus_btn" id="delBtn" value="－">
                                                <div class="data_container file_container">
                                                	<input type="hidden" name="fileNm" value="${data.ATTCH_NAME }">
                                                    <div class="fileSNm" id="fileSNm${attchCnt }">
                                                        ${data.ATTCH_NAME }
                                                    </div>
                                                    <c:set var="attchCnt" value="${ attchCnt + 1}" />
                                                </div>
                                            </div>
                                        </c:forEach>
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