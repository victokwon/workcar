<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<link rel="stylesheet" type="text/css" href="resources/css/cormypage/mngempanc/mngempanc.css">
    <link rel="stylesheet" href="resources/css/cormypage/mngempanc/floatRightNav.css"> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/script/cormypage/empannc/mainbox.js"></script>
    <script type="text/javascript" src="resources/script/cormypage/mngempanc/mngempanc.js"></script>
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
        <div id="test"></div>
			<div class="main_button_box">
				<button type="button" id="cmyinfopage" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
				<button type="button" id="mngancpage" class="main_button" onclick="linkGo('mngancpage')">이력서관리</button>
				<button type="button" class="main_button" onclick="linkGo('recepReq')">활동내역</button>
				<button type="button" class="main_button" onclick="linkGo('empsugget')">관심정보</button>
			</div>
        <div class="main_info">

            <div id="main_apply" class="main_content">
                <div class="vertical_menu">
                    <form action="#" id="resumeGo">
                        <input type="hidden" id="userNO">
                        <input type="hidden" id="resumeNO">
                    </form>
                    <!-- 이력서 리스트 메뉴 출력 -->
                    <a href="#" id="jobPost">채용공고 관리</a>
                    <a href="#" id="jobResume">받은 이력서</a>
                     <a href="#" id="jobResume2">임시저장</a>
                </div>
                
                <form action="#" id="empancDtl" method="post" >
                    <input type="hidden" id="EMP_NO" name="EMP_NO" >
                    <input type="hidden" id="MEM_NO" name="MEM_NO" >   
                </form>
                
                
                <div class="main_box">
                <div id="empAncLists1" >
                <table class="job_post_tab">
                   <c:forEach var ="data" items="${list}"> 
                        <tr id="dtlBody" >
                            <td jobPostNo="1">
                                <div class="job_post_list">
                                    <div class="logo"></div>
                                    <div class="dtl_box">
                                        <div class="job_post_title">공고 이름 : ${data.EMP_TITLE}</div>
                                        <div class="job_post_state_dtl">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="text">회사명</div>
                                                    <div class="data">${data.C_NAME}</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">모집인원</div>
                                                    <div class="data">${data.EMP_PER}명</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">공고일</div>
                                                    <div class="data">${data.REG_DATE}.</div>
                                                </div>
                                                <div class="row">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="row">
                                                    <div class="text">조회수</div>
                                                    <div class="data">${data.VIEWS}회</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">근무지역</div>
                                                    <div class="data">${data.REGION_NAME}.</div>
                                                </div>
                                              <div class="row">
                                                    <div class="text">마감일</div>
                                                    <div class="data">${data.DLINE}.</div>
                                                </div>
                                                <div class="row">
                                              
                                                </div>
                                            </div>
                                        </div>                                                          
                                    </div>
                                    <div class="button_container">
                                        <div class="job_post_state">상태 : ${data.OPNCHK}</div>
                                        <div class="button_box" eno="${data.EMP_NO}" rno="${data.MEM_NO}"> 
                                            <button id="openDtl">열람</button>
                                            <button id="delDtl">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                       </c:forEach>
                    </table>
                           <div class="job_post_add">
                             <button type="button" id ="writeBtn">새로운 공고 작성</button>
                           </div>
                    </div>                    
                  
                  
                    
                <div id="empAncLists2">       
                <table class="job_post_tab">
                   <c:forEach var ="data2" items="${list}"> 
                        <tr id="dtlBody" >
                            <td jobPostNo="1">
                                <div class="job_post_list">
                                    <div class="logo"></div>
                                    <div class="dtl_box">
                                        <div class="job_post_title">공고 이름 : ${data2.EMP_TITLE}</div>
                                        <div class="job_post_state_dtl">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="text">회사명</div>
                                                    <div class="data">${data2.C_NAME}</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">모집인원</div>
                                                    <div class="data">${data2.EMP_PER}명</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">공고일</div>
                                                    <div class="data">${data2.REG_DATE}.</div>
                                                </div>
                                                <div class="row">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="row">
                                                    <div class="text">조회수</div>
                                                    <div class="data">${data2.VIEWS}회</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">근무지역</div>
                                                    <div class="data">${data2.REGION_NAME}.</div>
                                                </div>
                                              <div class="row">
                                                    <div class="text">마감일</div>
                                                    <div class="data">${data2.DLINE}.</div>
                                                </div>
                                                <div class="row">
                                              
                                                </div>
                                            </div>
                                        </div>                                                          
                                    </div>
                                    <div class="button_container">
                                        <div class="job_post_state">상태 : ${data2.OPNCHK}</div>
                                        <div class="button_box" eno="${data2.EMP_NO}" rno="${data2.MEM_NO}"> 
                                            <button id="openResume">지원자 보기</button>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                       </c:forEach>
                    </table>
                           
				</div>
                    
                    
                    
          		<div id="resumeLists" >
                    <table class="job_post_resume" >                  
<!--                         <tr>
                            <td jobPostNo="1">
                                <div class="job_post_state">
                                    <div class="job_post_resume_title">공고명: </div>
                                    <div class="job_post_resume_date">
                                        <div class="start">공고일: 2021.10.13.</div>~
                                        <div class="end">마감일: 2021.10.13.</div>
                                        <div class="dd">D-day</div>
                                    </div>
                                </div>
                            </td>
                            <td jobPostResumeNo="1">
                                <div class="job_post_resume_list">
                                    <div class="logo"></div>
                                    <div class="dtl_box">
                                        <div class="job_post_resume_state_dtl">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="text">지원자 : </div>
                                                    <div class="data">지원자 이름</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">상태 : </div>
                                                    <div class="data">미처리</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="row">
                                                    <div class="text">이력서 : </div>
                                                    <div class="data">이력서 제목</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">제출일 : </div>
                                                    <div class="data">2021.10.13.</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="button_container">
                                        <div class="job_post_resume_state">모집중</div>
                                        <div class="button_box">
                                            <button>이력서</button>
                                            <button>수정</button>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr> -->
                    </table>
                     <div class="job_post_add">
                      <button type="button" id ="goListBtn">목록으로 돌아가기</button>
                    </div>
                    </div>
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
	

	$("#jobPost").click(function(){
		
		$("#resumeLists").hide();
		$("#empAncLists1").show();
		$("#empAncLists2").hide();
		
	});
	
	$("#jobResume").click(function(){
		
		$("#resumeLists").show();
		$("#empAncLists1").hide();
		$("#empAncLists2").hide();
		
	});
	
	$("#jobResume2").click(function(){
		
		$("#resumeLists").hide();
		$("#empAncLists1").hide();
		$("#empAncLists2").show();
		
	});
	
	
	$(".main_button_box").click($(".button_box"),function(){
		
		linkGo(URL);
		
	});
	
	

	
	$("#jobPost").click();
	
	
	btnchk =null;
	
	$(".job_post_tab").on("click","#openDtl",function(){
		$("#EMP_NO").val($(this).parent().attr("eno"));
		$("#MEM_NO").val($(this).parent().attr("rno"));
		
		$("#empancDtl").attr("action","empAncDtl");
		$("#empancDtl").submit();
		

		
		
	});
	
	$(".job_post_tab").on("click","#delDtl",function(){
		$("#EMP_NO").val($(this).parent().attr("eno"));
		$("#MEM_NO").val($(this).parent().attr("rno"));

		if(confirm("삭제하시겠습니까?")) {			
			 delEmpAnc();
		}
	});
	

	
	$("#writeBtn").click(function(){
		
		location.href ="empannc";
	});
	

});


function resumeLists() {
	
	var param = $("#empancDtl").serialize();
	
	$.ajax({
		url : "ancResumeLists",
		data : param,
		dataType : "json",
		type : "post",
		success : function(res) {
			if(res.result == "success") {
				console.log("리스트 불러오기 성공");
				$("#resumeLists").show();
				$("#empAncLists").hide();
			} else {
			alert ("이력서 목록을 불러오는 중 에러가 발생했습니다.");
			}
		
			}, error : function(request,status,error) {
				console.log(error);
			}
	});
	
}



 function drawResumeList() {
	
	
	var html = "";
	
	for(var rlist of rlist) {
	
			html += "		<tr RESUM_NO="+rlist.RESUME_NO+">                                       ";
/* 			html += "		<td>                                                       ";
			html += "		<div class='job_post_state'>                               ";
			html += "		<div class='job_post_resume_title'>공고명: </div>          ";
			html += "		<div class='job_post_resume_date'>                         ";
			html += "		<div class='start'>공고일: "+2021.10.13+".</div>~          ";
			html += "		<div class='end'>마감일: "+2021.10.13+".</div>             ";
			html += "		<div class='dd'>+"D-day+"</div>                            ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</td>                                                      "; */
			html += "		<td>                                                       ";
			html += "		<div class='job_post_resume_list'>                         ";
			html += "		<div class='logo'></div>                                   ";
			html += "		<div class='dtl_box'>                                      ";
			html += "		<div class='job_post_resume_state_dtl'>                    ";
			html += "		<div class='col'>                                          ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>지원자</div>                             ";
			html += "		<div class='data'>"+지원자 이름+"</div>                   ";
			html += "		</div>                                                     ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>처리상태</div>                           ";
			html += "		<div class='data'>"+rlist.PRCSCHK+"</div>                             ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		<div class='col'>                                          ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>이력서</div>                             ";
			html += "		<div class='data'>"+이력서 제목+"</div>                    ";
			html += "		</div>                                                     ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>제출일</div>                             ";
			html += "		<div class='data'>"+rlist.REG_DATE+"</div>                    ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		<div class='button_container'>                             ";
			html += "		<div class='job_post_resume_state'>"+rlist.FINDCHK+ "</div>       ";
			html += "		<div class='button_box'>                                   ";
			html += "		<button id='openResume'>이력서 열람</button>                ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</td>                                                      ";
			html += " 		</tr>                                                      ";     
	
		}
	
			$(".job_post_resume").html(html);
			
}




function delEmpAnc(){
	
	var param = $("#empancDtl").serialize();
	
	$.ajax({
		
		url : "delEmpAncAjax",
		data : param,
		type : "post",
		dataType : "json",
		success:function(res) {
			if(res.result =="success"){
				alert("삭제가 완료되었습니다.")
				location.href="mngancpage";
			}else {
				alert("삭제 중 에러가 발생했습니다.");
				location.href="mngancpage";
			}
		},
		error : function(request,status,error) {
			console.log(error);
		}
		
	});
	
	
	
}


function linkGo(URL){
	location.herf = URL
}

</script>



</html>
<!-- main_content_button button  main_button_box-->