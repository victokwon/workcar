$(document).ready(function(){

		
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




  $(".sal").on("change", "input", function () {
    if ($("#sal1").is(":checked")) {
      $("#minSal").attr("disabled", false);
      $("#maxSal").attr("disabled", false);
    } else {
      $("#minSal").attr("disabled", true);
      $("#maxSal").attr("disabled", true);
    }
  });




});
