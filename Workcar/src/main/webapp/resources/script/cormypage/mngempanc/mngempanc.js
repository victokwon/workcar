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
