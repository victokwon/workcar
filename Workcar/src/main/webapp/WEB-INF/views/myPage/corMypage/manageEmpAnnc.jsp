<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<link rel="stylesheet" type="text/css" href="resources/css/cormypage/mngempanc/mngempanc.css">
    <link rel="stylesheet" href="resources/css/cormypage/mngempanc/floatRightNav.css"> 	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/script/cormypage/empannc/mainbox.js"></script>
	<script type="text/javascript" src="resources/script/cormypage/mngempanc/mngempanc.js"></script>
	<script type="text/javascript">
	function linkGo(url){
	location.href = url;
}
</script>
<body>

    <main>
        <div id="test"></div>
			<div class="main_button_box">
				<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
				<button type="button" class="main_button" onclick="linkGo('mngancpage')">채용공고</button>
				<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
				<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
			</div>
        <div class="main_info">

            <div id="main_apply" class="main_content">
                <div class="vertical_menu">
                    <form action="#" id="resumeGo">
                        <input type="hidden" id="userNO" name="userNO">
                        <input type="hidden" id="resumeNO" name="resumeNo">
                        <input type="hidden" id="empNO" name="empNo">
                        <input type="hidden" id="empResumePage" name="page">
                    </form>
                    <!-- 이력서 리스트 메뉴 출력 -->
                    <a href="#" id="jobPost">채용공고 관리</a>
                    <a href="#" id="jobResume">받은 이력서</a>
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
                                                    <div class="data">${data.EMP_PER}명.</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">공고일</div>
                                                    <div class="data">${data.REG_DATE}.</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="row">
                                                    <div class="text">조회수</div>
                                                    <div class="data">${data.VIEWS}회.</div>
                                                </div>
                                                <div class="row">
                                                    <div class="text">지원자</div>
													<c:choose>
														<c:when test="${data.CNT > 0}">
															<div class="data">${data.CNT}명.</div>
														</c:when>
														<c:otherwise>
															<div class="data">없음</div>
														</c:otherwise>
													</c:choose>
                                                </div>
                                              <div class="row">
                                                    <div class="text">마감일</div>
                                                    <div class="data">${data.DLINE}.</div>
                                                </div>
                                            </div>
                                        </div>                                                          
                                    </div>
                                    <div class="button_container">
                                        <div class="job_post_state">상태 : ${data.OPNCHK}</div>
                                        <div class="button_box" eno="${data.EMP_NO}" mno="${data.MEM_NO}" > 
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
                <table class="resume_post_tab">
                   	<c:forEach var ="data2" items="${list}"> 
	                   	<c:if test="${data2.CNT > 0 }">
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
		                                            </div>
		                                            <div class="col">
		                                                <div class="row">
		                                                    <div class="text">조회수</div>
		                                                    <div class="data">${data2.VIEWS}회.</div>
		                                                </div>
		                                                <div class="row">
		                                                    <div class="text">지원자</div>
		                                                    <div class="data">${data2.CNT}명.</div>
		                                                </div>
		                                              <div class="row">
		                                                    <div class="text">마감일</div>
		                                                    <div class="data">${data2.DLINE}.</div>
		                                                </div>
		                                            </div>
		                                        </div>                                                          
		                                    </div>
		                                    <div class="button_container">
		                                        <div class="job_post_state">상태 : ${data2.OPNCHK}</div>
		                                        <div class="button_box" eno="${data2.EMP_NO}" mno="${data2.MEM_NO}" > 
		                                            <button id="openResume" class="openResume">지원자 보기</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
    	                    </c:if>
                       </c:forEach>
                    </table>
                           
				</div>
 
                    
                    
          		<div id="resumeLists" >
                    <table class="job_post_resume" >                  

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

<%@include file="/resources/jsp/footer.jsp"%>

<script>

$(document).ready(function(){
		
	
	// 사이드 메뉴 이동
	$("#resumeLists").hide();
	$("#empAncLists2").hide();
	
	
	$("#jobPost").click(function(){
		
		$("#empAncLists1").show();
		$("#empAncLists2").hide();
		$("#resumeLists").hide();
		
	});
	
	$("#jobResume").click(function(){
		
		$("#empAncLists2").show();
		$("#empAncLists1").hide();
		$("#resumeLists").hide();
		
	});
	

	//채용 공고 열람	
	$(".job_post_tab").on("click","#openDtl",function(){
		$("#EMP_NO").val($(this).parent().attr("eno"));
		$("#MEM_NO").val($(this).parent().attr("mno"));
		
		$("#empancDtl").attr("action","empAncDtl");
		$("#empancDtl").submit();	
	});
	
	
	
	// 채용 공고 작성
	$("#writeBtn").click(function(){		
		location.href ="empannc";
	});


//지원자 보기
$(".resume_post_tab").on("click","#openResume",function(){
	$("#EMP_NO").val($(this).parent().attr("eno"));
	$("#MEM_NO").val($(this).parent().attr("mno"));

	
	resumeLists();

});


//목록버튼
$("#goListBtn").click(function(){
	
	$("#jobResume").click();
	
});	



//기본메뉴설정
$("#jobPost").click(); 
	
	
//채용공고 열람	
	$(".job_post_tab").on("click","#openDtl",function(){
		$("#EMP_NO").val($(this).parent().attr("eno"));
		$("#MEM_NO").val($(this).parent().attr("mno"));
		
		$("#empancDtl").attr("action","empAncDtl");
		$("#empancDtl").submit();
			
	});
	
//채용 공고 삭제
	$(".job_post_tab").on("click","#delDtl",function(){
		$("#EMP_NO").val($(this).parent().attr("eno"));
		$("#MEM_NO").val($(this).parent().attr("mno"));

		if(confirm("삭제하시겠습니까?")) {			
			 delEmpAnc();
			 location.reload();
		}
	});
	

	
	$("#writeBtn").click(function(){
		
		location.href ="empannc";
	});
	



//메뉴이동
$("#goListBtn").click(function(){
	
	$("#jobResume").click();
	
});



//이력서 불러오기 
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
				console.log(res.rlist);	
				drawResumeList(res.rlist);
				
				$("#empAncLists2").hide();
				$("#empAncLists1").hide();
				$("#resumeLists").show();
				
			} else {
				alert("에러가 발생했습니다");
			}
		
			}, error : function(request,status,error) {
				console.log(error);
			}
	});
	
}


//이력서 목록
 function drawResumeList(rlist) {
	
	
	var html = "";
	
	for(var rlists of rlist) {
	
			html += "		<tr RESUM_NO="+rlists.RESUME_NO+">                                       ";
			html += "		<td>                                                       ";
			html += "		<div class='job_post_resume_list'>                         ";
			html += "		<div class='logo'></div>                                   ";
			html += "		<div class='dtl_box'>                                      ";
			html += "		<div class='job_post_resume_state_dtl'>                    ";
			html += "		<div class='col'>                                          ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>지원자 : </div>                           ";
			html += "		<div class='data'> "+rlists.NAME+"</div>                 	";
			html += "		</div>                                                     ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>처리 : </div>                           ";
			html += "		<div class='data'>"+rlists.PRCSCHK+"</div>                 ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		<div class='col'>                                          ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>제목 : </div>                             ";
			html += "		<div class='data'>"+rlists.RESUM_NAME+"</div>                 ";
			html += "		</div>                                                     ";
			html += "		<div class='row'>                                          ";
			html += "		<div class='text'>제출일 : </div>                             ";
			html += "		<div class='data'>" +rlists.REG_DATE+"</div>                    ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		<div class='button_container'>                             ";
			html += "		<div class='job_post_resume_state'>상태 : "+rlists.FINDCHK+"</div> ";
		if(rlists.R_DEL_CHK=="1"){
			html += "		<div class='job_post_resume_state'><b>삭제된 이력서</b></div> ";
		}else {
			html += "		<div class='button_box'>                                   ";
			html += "		<button id='goResume' class='openResume' eno='"+rlists.EMP_NO+"' rno='"+rlists.RESUM_NO+"'>이력서 열람</button>                ";
			html += "		</div>                                                     ";
		}
			html += "		</div>                                                     ";
			html += "		</div>                                                     ";
			html += "		</td>                                                      ";
			html += " 		</tr>                                                      ";     	
		}	
			$(".job_post_resume").html(html);			
}


//이력서 이동
	$(".job_post_resume").on("click","#goResume",function(){
		$("#empNO").val($(this).attr("eno"));
		$("#resumeNO").val($(this).attr("rno"));
		$("#resumeGo").attr("action", "empResumDtl")
		$("#resumeGo").submit()
	})


//이력서 삭제
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

 });
</script>


</html>