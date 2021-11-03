$(function() {
	/* 필요한것 공고번호 : eNo , 이력서 번호 : rNo*/
	$(".pop-container").on('keydown', function(event) {
		    if (event.keyCode === 13) {
		       event.preventDefault();
     		}
		})
		
     $(".pop-close-btn").on('click', function(event) {
   		  $(".pop-container").hide();
     })
	
	
	$("#popOpen").on("click", function(){
		/* 위치를 찾아야함 -> 버튼 상대위치  */
		let targetENo = $("#empNo").val()
		console.log(targetENo)
		$("#applyBtn").attr("eNo", targetENo);
		getResumeList(targetENo) 
		$(".pop-container").show();
	})
	
	$(".list_wrap").on("click", "tr", function () {
	  	let targetRNo = $(this).attr("rNo")
		$("#applyBtn").attr("rNo", targetRNo);
		$(".text_box").html("<b>지원할 이력서 번호: "+targetRNo+"</b>")
    });
	
    $("#applyBtn").on("click",function(){
    	if($(this).attr("rNo") == "X"){
			alert("선택된 이력서가 없습니다.")
    	}else{
	    	PA($(this).attr("rNo"),$(this).attr("eNo"))
	    	$(".pop-container").hide();
    	}
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

function getResumeList(targetENo){
	let params = "memNo=" + $("#memNo").val() + "&empNo=" + targetENo
	
	 $.ajax({
	    type: "POST",
	    data: params,
	    url: "getResumeListAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     		drawResumList(res.list)
	     		/*drawPaging(res.pb)*/
	     	}
	    },
	    error: function (request, status, error) {
	      console.log(request);
	      console.log(error);
	    }
  });
}
function drawResumList(list){
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

