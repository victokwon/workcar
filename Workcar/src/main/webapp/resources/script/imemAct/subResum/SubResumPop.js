$(function(){
	$(".pop-container").on('keydown', function(event) {
	     if (event.keyCode === 13) {
	       event.preventDefault();
	     }
  	     if (event.keyCode === 27) {
    		$(".pop_wrap").hide();
   			$(".pop-container").html("")
	     }
    })
    
    $(".pop-container").on('click', ".pop-close-btn",function(event) {
   		$(".pop_wrap").hide();
   		$(".pop-container").html("")
    })
    
    $(".pop-container").on('click', ".select_resum",function(event) {
    	let targetResumNo = $(this).attr("no")
    	let text = targetResumNo +"번" 
    	$("#changeResume").html(text)
    	$("#cResumeNo").val(targetResumNo);
    })
    
	/*처리*/
	$(".main_info").on("click","#sUpdateBtn", function(){
		let target = $(this)
		getSupResumList(target) 
		$(".pop_wrap").show();
	})
	
	$(".main_info").on("click","#sCancBtn", function(){
		let eNo = $(this).attr("eNo")
		let rNo = $(this).attr("rNo")
		DelSupResum(eNo,rNo) 
	})
	
	
	/*내용*/
	$(".main_info").on("click","#sCancBtn", function(){
	
	})
})

function getSupResumList(target){
	
	 $.ajax({
   		 type: "POST",
	    data: "memNo=" + $("#userNo").attr("no"),
	    url: "getResumeListAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     	drawResumList(res.list ,target)
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

function DelSupResum(eNo,rNo){
	let params = "resumeNo="+rNo+"&empNo="+eNo
	 $.ajax({
   		 type: "POST",
	    data: params,
	    url: "DelSupResumAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     		alert("입사지원 취소가 완료되었습니다")
	     		getSubResum()
	     	}else if(res.result == "FAILED"){
	     		alert("취소요청을 완료할 수 없습니다.")
	     	}
	    },
	    error: function (request, status, error) {
	      console.log(request);
	      console.log(error);
	    }
  });
}

function drawResumList(list, target){
	let rNo = target.attr("rNo")
	let eNo = target.attr("eNo")
	let mNo = $("#userNo").attr("no")
	
	let html = ""
	
	html += '		 <div class="pop-out-container">                                                                                                                      '
	html += '		    <div class="pop-in-container">                                                                                                                    '
	html += '		        <div class="pop-text-header">                                                                                                                 '
	html += '		            <h1 class="modal-title" id="process_title">이력서 선택</h1>                                                                        '
	html += '		        </div>                                                                                                                                        '
	html += '		        <div class="content">                                                                                                                                        '
	for(data of list){
	if(data.RESUM_NO == rNo){
		data.RESUM_NAME += " [ 지원 ] "
	}
	html += '		            <div class="select_resum" no="'+data.RESUM_NO+'">                                                                                                                                    '
	html += '			            <div class="resum_info_box">                                                                                                     '
	html += '			             	<div class="text_box">                                                                                                        '
	html += '			                    <div id="mNoT" class="head">'+data.RESUM_NO+'</div>                                                                                  '
	html += '			                    <div id="mNoT" class="body">'+data.RESUM_NAME+' / '+data.CHN_DATE+'</div>                                                                                  '
	html += '			                </div>                                                                                                                        '
	html += '			            </div>                                                                                                                            '
	html += '		            </div>                                                                                                                                    '
	}
	html += '			        <div class="resum_info_box">                                                                                                     '
	html += '			             <div class="text_box">                                                                                                        '
	html += '			                <div id="mNoT" class="head">변경 이력서</div>                                                                                  '
	html += '			                <div id="changeResume" class="body" ></div>                                                                                  '
	html += '			             </div>                                                                                                                        '
	html += '			        </div>                                                                                                                            '
	html += '		        </div>                                                                                                                                        '
	html += '		        <hr>                                                                                                                                          '
	html += '		        <div class="button_box">                                                                                                                      '
	html += '		            <button type="button" class="prcssBtn" rNo="">변경</button>                                                                                         '
	html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">취소</button>                                                                                     '
	html += '		        </div>                                                                                                                                        '
	html += '		            <form action="#" method="post" id="prcssForm">     '		
	html += '		                <input type="hidden" id="resumeNo" name="resumeNo" value="'+rNo+'">     '
	html += '		                <input type="hidden" id="cResumeNo" name="cResumeNo" >     '
	html += '		                <input type="hidden" id="empNo" name="empNo" value="'+eNo+'">     '
	html += '		            </form>     '
	html += '	        </div>                                                                                                                                            '
	html += '	    </div>'
	 
	$(".pop-container").html(html)
	
}







