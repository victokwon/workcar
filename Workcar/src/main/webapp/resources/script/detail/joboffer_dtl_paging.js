$(function () {
	 reloadList(); 
	 
	 $(".page1").on("click", "span", function(){
	      $("#page").val($(this).attr("page"));
	      
	      reloadList();
	   });
})
function reloadList() {
	var params = $("#actionForm").serialize();    /* serialize:데이터를 문자열로 변환시켜주는 함수 */
													/* form의 데이터를 문자열로 변환 */
	/* j쿼리에 있는 ajax를 호출한 것 */
	$.ajax({
		url: "jobofferListAjax", /* 접속주소 */
		type: "post",   /* 전송방식 */
		dataType: "json", /* 받아 올 데이터 형태(타입) */
		data: params,  /* 보낼 데이터(문자열 형태) */
		success: function(res){ /* ajax 통신이 성공 시 다음 함수 실행 */
			console.log(res.list)
			console.log(res.pb)
			drawList(res.list);
			drawPaging(res.pb);
		}, 
	error: function(request,status,error){ /* ajax 통신이 실패 시 다음 함수 실행 */
		console.log(error);
	}
	})
}

function drawList(list) {
	var html="";
	 
	for(var data of list) {        
		html += " <a href=\"#\" class=\"card\" onclick=\"javascript:goresum(\'"+data.RNUM+"\')\">                ";
		html += "     <p>이력서번호 :  "+ data.RNUM + "</p>            ";
        html += "     <p>인재명 :"+ data.NAME +"</p>            ";
        html += "     <p>희망직종 :"+ data.SECTOR_NAME+" </p>      ";
        html += "     <p>희망근무지역 :"+ data.REGION_NAME +" </p>  ";
        html += "     <p>등록일 :"+ data.DT +" </p>              ";
     	html += " </a>        ";
	}                                
	
	$(".mySlides").html(html);
}

function goresum(resum) {
		
		self.location="http://localhost:8090/Workcar/personDetails?sNo="+resum;
}


function drawPaging(pb) {
	   var html = "";
	   
	   if($("#page").val() == "1") {
	      html += "<span page=\"1\" class=\"prev\" \">&#10094;</span>      ";
	   } else {
	      html += "<span class=\"prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">&#10094;</span>      ";
	   }                                  
	                                    
	   for(var j = pb.startPcount ; j <= pb.endPcount ; j++) {
	      if($("#page").val() == j) {
	         html += "<span class=\"dot\"  page=\"" + j + "\" style=\"background-color:#717171\"> </span>  ";
	      } else {
	         html += "<span class=\"dot\"  page=\"" + j + "\"> </span>  ";
	      }
	   }                                    
	   
	   if($("#page").val() == pb.maxPcount) {
	      html += "<span class=\"next\"  page=\"" + pb.maxPcount + "\">&#10095;</span>      ";
	   } else {
	      html += "<span class=\"next\"  page=\"" + ($("#page").val() * 1 + 1) + "\">&#10095;</span>      ";
	   }
	   
	   $(".page1").html(html);
	}