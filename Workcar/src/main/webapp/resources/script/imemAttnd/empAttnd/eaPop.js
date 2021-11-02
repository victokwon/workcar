$(function() {
	/* 필요한것 공고번호 : eNo , 이력서 번호 : rNo*/
	$(".pop-container").on('keydown', function(event) {
	    if (event.keyCode === 13) {
	       event.preventDefault();
 		}
  	     if (event.keyCode === 27) {
    		$(".pop_wrap").hide();
   			$(".pop-container").html("")
	     }
		})
		
     $(".pop-container").on('click', ".pop-close-btn", function(event) {
   		  $(".pop_wrap").hide();
     })
	
	
	$(".recepReq").on("click", "#tApplyBtn",function(){
		let targetENo = $(this).attr("eNo")
		getResumeList(targetENo) 
		$(".pop_wrap").show();
		$(".pop-container").html();
	})
	
    $(".pop-container").on('click', ".select_resum",function(event) {
    	let targetResumNo = $(this).attr("no")
    	let text = targetResumNo +"번" 
    	$("#changeResume").html(text)
    	$("#resumeNo").val(targetResumNo);
    })
	
    $(".pop-container").on("click",".prcssBtn",function(){
    	PA()
    	$(".pop_wrap").hide();
    	$(".pop-container").html();
    })
    
    
    
	
})

function PA(act){
	
	let params = $("#prcssForm").serialize()
	
	 $.ajax({
    type: "POST",
    data: params,
    url: "PAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		alert("요청을 완료했습니다.")
     		$(".pop_wrap").hide();
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
	
	 $.ajax({
	    type: "POST",
	    data: "memNo=" + $("#userNo").attr("no"),
	    url: "getResumeListAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     		drawResumList(res.list, targetENo)
	     	}
	    },
	    error: function (request, status, error) {
	      console.log(request);
	      console.log(error);
	    }
  });
}

function drawResumList(list, targetENo){
	let eNo = targetENo
	let mNo = $("#userNo").attr("no")
	
	let html = ""
	
	html += '		 <div class="pop-out-container">                                                                                                                      '
	html += '		    <div class="pop-in-container">                                                                                                                    '
	html += '		        <div class="pop-text-header">                                                                                                                 '
	html += '		            <h1 class="modal-title" id="process_title">이력서 선택</h1>                                                                        '
	html += '		        </div>                                                                                                                                        '
	html += '		        <div class="content">                                                                                                                                        '
	for(data of list){
	html += '		            <div class="select_resum" no="'+data.RESUM_NO+'">                                                                                                                                    '
	html += '			            <div class="resum_info_box">                                                                                                     '
	html += '			             	<div class="text_box">                                                                                                        '
	html += '			                    <div id="mNoT" class="head">'+data.RESUM_NO+'</div>                                                                                  '
	html += '			                    <div id="mNoT" class="body">'+data.RESUM_NAME+' / '+data.CHN_DATE+'</div>                                                                                  '
	html += '			                </div>                                                                                                                        '
	html += '			            </div>                                                                                                                            '
	html += '		            </div>                                                                                                                                    '
	}
	html += '			        <div class="resum_info">                                                                                                     '
	html += '			             <div class="resum_info_text">                                                                                                        '
	html += '			                <div id="mNoT" class="head">변경 이력서</div>                                                                                  '
	html += '			                <div id="changeResume" class="body" ></div>                                                                                  '
	html += '			             </div>                                                                                                                        '
	html += '			        </div>                                                                                                                            '
	html += '		        </div>                                                                                                                                        '
	html += '		        <hr>                                                                                                                                          '
	html += '		        <div class="button_box">                                                                                                                      '
	html += '		            <button type="button" class="prcssBtn" rNo="">지원</button>                                                                                         '
	html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">취소</button>                                                                                     '
	html += '		        </div>                                                                                                                                        '
	html += '		            <form action="#" method="post" id="prcssForm">     '		
	html += '		                <input type="hidden" id="resumeNo" name="resumeNo" value="">     '
	html += '		                <input type="hidden" id="empNo" name="empNo" value="'+eNo+'">     '
	html += '		            </form>     '
	html += '	        </div>                                                                                                                                            '
	html += '	    </div>'
	 
	$(".pop-container").html(html)
	
}
