$(function(){
	$(".pop-container1").on('keydown', function(event) {
	     if (event.keyCode === 13) {
	       event.preventDefault();
	     }
 	     if (event.keyCode === 27) {
    		$(".pop_wrap").hide();
   			$(".pop-container1").html("")
	     }
    })
    
    $(".pop-container1").on('click', "#prcssCancBtn",function(event) {
   		$(".pop_wrap").hide();
   		$(".pop-container1").html("")
    })
    
    
	/*신고오픈*/
	$("#dclBtn").on("click", function(){
		drawDcl()
		$(".pop_wrap").show();
	})
	
	/*처리*/
	$(".pop_wrap").on("click", "#prcssDclBtn",function(){
		if($("#dclareCode").val()==-1){
			alert("신고 유형이 선택되지 않았습니다.")
			return
		}else if($("#dclareReasn").val() == ""){
			alert("신고사유가 작성되지 않았습니다.")
			return
		}else{
			DclInsert()
		}
	})
	
})


function drawDcl(){
	let html = ""
	
	let userName = $("#userNo").attr("name") 
	let cName = $("#cNameBox").attr("cname")
	let empTitle = $("#empTitle").attr("title")

	
	html += '		 <div class="pop-out-container">                                                                                                                      '
	html += '		    <div class="pop-in-container">                                                                                                                    '
	html += '		        <div class="pop-text-header">                                                                                                                 '
	html += '		            <h1 class="modal-title" id="process_title">허위 채용정보 신고</h1>                                                                        '
	html += '		        </div>                                                                                                                                        '
	html += '		        <div class="content">                                                                                                                                        '
	html += '		            <div >                                                                                                                                    '
	html += '		            	<form action="#" id="prcssForm">                                                                                                      '
	html += '			                <div class="report_info_box">                                                                                                     '
	html += '			                 	<div class="text_box">                                                                                                        '
	html += '			                        <div id="mNoT" class="head">신고자</div>                                                                                  '
	html += '			                        <div id="mNoT" class="body">'+userName+'</div>                                                                                  '
	html += '			                    </div>                                                                                                                        '
	html += '			                     <div class="text_box">                                                                                                       '
	html += '			                        <div id="eNoT" class="head">채용공고                                                                              '
	html += '			                        </div>                                                                                '
	html += '			                        <div id="eNoT" class="body">'+empTitle+'</div>                                                                     '
	html += '			                    </div >                                                                                                                       '
	html += '			                     <div class="text_box">                                                                                                       '
	html += '			                        <div id="cNoT" class="head">기업명</div>                                                                                  '
	html += '			                         <div class="body">'+cName+'</div>                                                                                           '
	html += '			                    </div>                                                                                                                        '
	html += '			                </div>                                                                                                                            '
	html += '			                <div class="report_content_box">                                                                                                  '
	html += '			                	<div class="text_box">                                                                                                        '
	html += '			                        <div class="head">신고사유</div>                                                                                          '
	html += '			                        <select name="dclareCode" id="dclareCode" >                                                                               '
	html += '			                            <option value="-1" selected>신고유형</option>                                                                                   '	
	html += '			                            <option value="0">허위정보</option>                                                                                   '
	html += '			                            <option value="1">도배</option>                                                                                       '
	html += '			                            <option value="2">광고</option>                                                                                       '
	html += '			                            <option value="3">기타</option>                                                                                       '
	html += '			                        </select>                                                                                                                 '
	html += '			                    </div>                                                                                                                        '
	html += '			                     <div class="text">                                                                                                           '
	html += '			                        <div>사유</div>                                                                                                           '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="dclareReasn" id="dclareReasn" cols="60" rows="2" spellcheck="false" placeholder="신고사유" ></textarea>        '
	html += '		                    </div>                                                                                                                            '
	html += '			                <div class="refuse">                                                                                                              '
	html += '			                    <div class="text">                                                                                                            '
	html += '			                        <div>거절사유</div>                                                                                                       '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="dclareRefuse" id="dclareRefuse" cols="60" rows="2" spellcheck="false" disabled></textarea>                             '
	html += '			                </div>                                                                                                                            '
	html += '		                </form>                                                                                                                               '
	html += '		            </div>                                                                                                                                    '
	html += '		        </div>                                                                                                                                        '
	html += '		        <hr>                                                                                                                                          '
	html += '		        <div class="button_box">                                                                                                                      '
	html += '		            <button type="button" id="prcssDclBtn" >처리</button>                                                                                         '
	html += '		            <button type="button" class="pop-close-btn1" id="prcssCancBtn">취소</button>                                                                                     '
	html += '		        </div>                                                                                                                                        '
	html += '	        </div>                                                                                                                                            '
	html += '	    </div>'
	 
	$(".pop-container1").html(html)
	
	   
	
}


function DclInsert(){
	let params = $("#prcssForm").serialize()
	params += "&empNo=" +$("#empNo").val()+ "&memNo=" +$("#memNo").val()
	$.ajax({
    type: "POST",
    data: params,
    url: "DclInsertAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
			alert("처리에 성공했습니다.")
	   		$(".pop_wrap").hide();
   			$(".pop-container1").html("")
     	}else if(res.result == "FAILED"){
     		alert("처리에 실패했습니다.")
     	}
     	console.log(res.result)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
  
}








