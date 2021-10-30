$(function(){
	$(".pop-container").on('keydown', function(event) {
	     if (event.keyCode === 13) {
	       event.preventDefault();
	     }
    })
    
    $(".pop-container").on('click', ".pop-close-btn",function(event) {
   		$(".pop_wrap").hide();
   		$(".pop-container").html("")
    })
    
    $(".pop-container").on('change', "#prcssGbn",function(event) {
    	if($("#prcssGbn").val() == 2){
    		$("#dclareRefuse").attr("disabled",false)
    	}else{
    		$("#dclareRefuse").attr("disabled",true)
    	}
    })
    
	/*처리*/
	$(".main_info").on("click","#rPrcssBtn", function(){
		let act = "p"
		let target = $(this)
		getDclDtl(target, act) 
		$(".pop_wrap").show();
	})
	
	
	/*내용*/
	$(".main_info").on("click","#rUpdateBtn", function(){
		let act = "u"
		let target = $(this)
		getDclDtl(target, act) 
		$(".pop_wrap").show();
	})
	
    
})

function getDclDtl(target, act){
	
	 $.ajax({
   		 type: "POST",
	    data: "dclareNo=" + target.attr("dNo"),
	    url: "getDclDtlAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     	drawDclDtl(res.data ,target, act)
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

function drawDclDtl(data, target, act){
	console.log(act)
	let html = ""
	
	let empNo = target.attr("eNo")
	let memNo = target.attr("mNo")
	let dclareNo = target.attr("dNo")
	let manageNo = $("#userNo").attr("no")

	if(typeof data.DCLARE_REFUSE == "undefined"){
		data.DCLARE_REFUSE =""
	}
	
	html += '		 <div class="pop-out-container">                                                                                                                      '
	html += '		    <div class="pop-in-container">                                                                                                                    '
	html += '		        <div class="pop-text-header">                                                                                                                 '
	html += '		            <h1 class="modal-title" id="process_title">허위 채용정보 신고</h1>                                                                        '
	html += '		        </div>                                                                                                                                        '
	html += '		        <div class="content">                                                                                                                                        '
	html += '		            <div >                                                                                                                                    '
	html += '		            	<form action="#" id="prcssForm">                                                                                                      '
	html += '		            		<input type="hidden" name="empNo" id="empNo" value="'+empNo+'">                                                                                     '
	html += '							<input type="hidden" name="memNo" id="memNo" value="'+memNo+'">                                                                                     '
	html += '							<input type="hidden" name="manageNo" id="manageNo" value="'+manageNo+'">                                                               '
	html += '							<input type="hidden" name="dclareNo" id="dclareNo" value="'+dclareNo+'">                                                               '	
	html += '			                <div class="report_prcss_box">                                                                                                    '
	html += '			                 	<div class="text_box">                                                                                                        '
	html += '			                        <div class="head">처리                                                                                             '
	html += '			                        </div>                                                                                              '
	html += '			                         <select name="prcssGbn" id="prcssGbn" class="body" selValue="'+data.PRCSS_GBN+'">                                                                      '
	html += '			                            <option value="0">미처리</option>                                                                                       '	
	html += '			                            <option value="1">처리</option>                                                                                       '        
	html += '			                            <option value="2">거절</option>                                                                                       '
	html += '			                        </select>                                                                                                                 '
	html += '			                    </div>                                                                                                                        '
	html += '			                </div>                                                                                                                            '
	html += '			                <div class="report_info_box">                                                                                                     '
	html += '			                 	<div class="text_box">                                                                                                        '
	html += '			                        <div id="mNoT" class="head">신고자</div>                                                                                  '
	html += '			                        <div id="mNoT" class="body">'+data.NAME+'</div>                                                                                  '
	html += '			                    </div>                                                                                                                        '
	html += '			                     <div class="text_box">                                                                                                       '
	html += '			                        <div id="eNoT" class="head">채용공고                                                                              '
	html += '			                        </div>                                                                                '
	html += '			                        <div id="eNoT" class="body">                                                                           '

	if(data.DEL_CHK == '1'){
		html += '[삭제됨]'
	}

	html += '			                        '+data.EMP_TITLE+'</div>                                                                            '
	html += '			                    </div >                                                                                                                       '
	html += '			                     <div class="text_box">                                                                                                       '
	html += '			                        <div id="cNoT" class="head">기업명</div>                                                                                  '
	html += '			                         <div class="body">'+data.C_NAME+'</div>                                                                                           '
	html += '			                    </div>                                                                                                                        '
	html += '			                     <div class="text_box">                                                                                                       '
	html += '			                        <div class="head">신고일</div>                                                                                            '
	html += '			                        <div class="body">'+data.REG_DATE+'</div>                                                                                       '
	html += '			                    </div>                                                                                                                        '
	html += '			                </div>                                                                                                                            '
	html += '			                <div class="report_content_box">                                                                                                  '
	html += '			                	<div class="text_box">                                                                                                        '
	html += '			                        <div class="head">신고사유</div>                                                                                          '
	html += '			                        <select name="dclareCode" id="dclareCode" selValue="'+data.DCLARE_CODE+'">                                                                               '
	html += '			                            <option value="0">허위정보</option>                                                                                   '
	html += '			                            <option value="1">도배</option>                                                                                       '
	html += '			                            <option value="2">광고</option>                                                                                       '
	html += '			                            <option value="3">기타</option>                                                                                       '
	html += '			                        </select>                                                                                                                 '
	html += '			                    </div>                                                                                                                        '
	html += '			                     <div class="text">                                                                                                           '
	html += '			                        <div>사유</div>                                                                                                           '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="dclareReasn" id="dclareReasn" cols="60" rows="2" spellcheck="false" placeholder="신고사유" >'+data.DCLARE_REASN+'</textarea>        '
	html += '		                    </div>                                                                                                                            '
	html += '			                <div class="refuse">                                                                                                              '
	html += '			                    <div class="text">                                                                                                            '
	html += '			                        <div>거절사유</div>                                                                                                       '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="dclareRefuse" id="dclareRefuse" cols="60" rows="2" spellcheck="false" disabled>'+ data.DCLARE_REFUSE +'</textarea>                             '
	html += '			                </div>                                                                                                                            '
	html += '		                </form>                                                                                                                               '
	html += '		            </div>                                                                                                                                    '
	html += '		        </div>                                                                                                                                        '
	html += '		        <hr>                                                                                                                                          '
	
	if(act =="p"){
		html += '		        <div class="button_box">                                                                                                                      '
		html += '		            <button type="button" class="prcssBtn" >처리</button>                                                                                         '
		html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">취소</button>                                                                                     '
		html += '		        </div>                                                                                                                                        '
	}else if(act == "u"){
		html += '		        <div class="button_box">                                                                                                                      '
		html += '		            <button type="button" class="prcssBtn">수정</button>                                                                                         '
		html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">확인</button>                                                                                     '
		html += '		        </div>                                                                                                                                        '	
	}
		html += '	        </div>                                                                                                                                            '
		html += '	    </div>'
	 
	$(".pop-container").html(html)
	
	  $("select").each(function(idx) {
		   if($(this).attr("selValue") != "") {
			   $(this).val($(this).attr("selValue"));
		   }
	   });
	   
		if($("#prcssGbn").val() == 2){
    		$("#dclareRefuse").attr("disabled",false)
    	}else{
    		$("#dclareRefuse").attr("disabled",true)
    	}
	
}











