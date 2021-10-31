$(function() {
	/* 필요한것 공고번호 : eNo , 이력서 번호 : rNo*/
	$(".pop-container").on('keydown', function(event) {
		    if (event.keyCode === 13) {
		       event.preventDefault();
     		}
		})
		
   $(".paging_wrap").on("click","span",function(){
      $("#page").val($(this).attr("page"))
      getResumeList( $("#applyBtn").attr("eNo")) 
   })
   
     $(".pop-close-btn").on('click', function(event) {
   		  $(".pop-container").hide();
     })
	
	
	$("#popOpen").on("click", function(){
		/* 위치를 찾아야함 -> 버튼 상대위치  */
		let targetENo = 1;
		$("#applyBtn").attr("eNo", targetENo);
		getResumeList(targetENo) 
		$(".pop-container").show();
	})
	
	$(".list_wrap").on("click", "tr", function () {
		/* 위치를 찾아야함 -> 버튼 상대위치  */
	  	let targetRNo = $(this).attr("rNo")
		$("#applyBtn").attr("rNo", targetRNo);
		$(".text_box").html("<b>지월할 이력서 번호: "+targetRNo+"</b>")
    });
	
    $("#applyBtn").on("click",function(){
    	PA($(this).attr("rNo"),$(this).attr("eNo"))
    	$(".pop-container").hide();
    })
    
	
})

function PA(targetR, targetE){
	
	let params = "memNo=" + $("#memNo").val() +"&resumeNo=" + targetR +"&empNo=" + targetE
	
	 $.ajax({
    type: "POST",
    data: params,
    url: "PAjax",
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

function getResumeList(targetE){
	console.log(targetE)
	let params = "memNo=" + $("#memNo").val() + "&empNo=" + targetE
	let page = $("#page").val()
	if(page !=""){
		params += "&page=" + page
	}else{
		params += "&page=" + 1
	}
	
	 $.ajax({
	    type: "POST",
	    data: params,
	    url: "getResumeListAjax",
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
      
      html += "rNo="
      
      html += "'" + data.RESUM_NO + "'>"
      
      html += "    <td class='td_no'>" + data.RESUM_NO + "</td>"
      
      html += "    <td class='td_name'>" + data.RESUM_NAME + "</td>"
      
      html += "    <td class='td_date'>" + data.CHN_DATE + "</td>"
      
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