$(function(){
	
	
   $(".paging_wrap").on("click","span",function(){
   		$("#page").val($(this).attr("page"))
      getEmpList($("#selectBtn").attr("rNo"))
   })
   
	$(".pop-container").on('keydown', function(event) {
	     if (event.keyCode === 13) {
	       event.preventDefault();
	     }
    })

    $(".pop-close-btn").on('click', function(event) {
   		  $(".pop-container").hide();
    })

	$(".main_info").on("click","#JCBtn", function(){
		let targetRNo = $(this).parent().parent().parent().parent().parent().attr("no")
		$("#selectBtn").attr("rNo", targetRNo);
		getEmpList(targetRNo) 
		$(".pop-container").show();
	})
	
	$(".list_wrap").on("click", "tr", function () {
	  	let targetENo = $(this).attr("eNo")
		$("#selectBtn").attr("eNo", targetENo);
		$(".text_box").html("<b>요청할 채용공고 번호: "+targetENo+"</b>")
    });
    
    $("#selectBtn").on("click",function(){
    	JC($(this).attr("rNo"),$(this).attr("eNo"))
    	$(".pop-container").hide();
    })
    
})
function JC(targetR, targetE){
	
	let params = "memNo=" + $("#userNo").attr("no") +"&resumeNo=" + targetR +"&empNo=" + targetE
	
	 $.ajax({
   		 type: "POST",
	    data: params,
	    url: "JCAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     		alert("요청을 완료했습니다.")
	     		$(".pop-container").hide();
	     	}else if(res.result == "FAILED"){
	     		alert("요청에 완료할 수 없습니다.")
	     	}
	    },
	    error: function (request, status, error) {
	      console.log(request);
	      console.log(error);
	    }
  });
}

function getEmpList(targetR){
	let params = "memNo=" + $("#userNo").attr("no") + "&resumeNo=" + targetR
	let page = $("#page").val()
	if(page !=""){
		params += "&page=" + page
	}else{
		params += "&page=" + 1
	}
	
	 $.ajax({
    type: "POST",
    data: params,
    url: "getEmpListAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawList(res.list)
     		drawPaging(res.pb)
     	}
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}
function drawList(list){
	let html = ""
	
	for (data of list){
	 html += "<tr "
      
      html += "eNo="
      
      html += "'" + data.EMP_NO + "'>"
      
      html += "    <td class='td_no'>" + data.EMP_NO + "</td>"
      
      html += "    <td class='td_name'>" + data.EMP_TITLE + "</td>"
      
      html += "    <td class='td_date'>" + data.DLINE + "</td>"
      
      html += "</tr>"
	}
	
	$("#list_box").html(html)
}

function drawPaging(pb) {
      let html = ""
         /* 현재 페이지 굵은 글씨 적용*/
         html += "<span page=\"1\">처음</span>"
         
         if($("#page").val() == 1){
            html +=   "   <span page=\"1\">이전</span>"   
         }else{
            html += "   <span page=\"" + ($("#page").val()*1 - 1) + "\">이전</span>   "
         }
         
         for(var i = pb.startPcount; i <= pb.endPcount; i++){
            if($("#page").val() == i ){
               html += "   <span page=\"" + i + "\"><b>" + i + "</b></span>"   
            }else{
               html += "   <span page=\"" + i + "\">" + i + "</span>"   
            }
         }
         
         if($("#page").val() == pb.maxPcount){
            html += "   <span page=\"" + pb.maxPcount + "\">다음</span>"   
         }else{
            html += "   <span page=\"" + ($("#page").val()*1 + 1) + "\">다음</span>   "
         }
         
         html += "<span page=\"" + pb.maxPcount + "\">끝</span>"
         
      $(".paging_wrap").html(html)
   }