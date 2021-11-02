$(function(){
	getSubResum()
	
   $("#subResum_paging_wrap").on("click","span",function(){
	 $("#page").val($(this).attr("page"))
     getSubResum()
   })
	
   $(".pop-container").on("click",".prcssBtn",function(){
   		
   			if($("#cResumeNo").val() ==""){
   				alert("이력서가 선택되지 않았습니다.")
   				$("#process_title").focus()
   				return
   			}
   			
		changeSubResum()
   		$(".pop_wrap").hide();
		$(".pop-container").html("")
   })
   
   $(".subResum").on("click","#goResum",function(){
   		$("#goResumNo").val($(this).attr("rNo"))
   		$("#subResumForm").attr("action","resumeDtl")
   		$("#subResumForm").submit()		
   })
    
})   
    
/*이벤트 온 오프 처리*/

function getSubResum(){
	let params = $("#subResumForm").serialize() 
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getSubResumAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawSubResumList(res.list, res.cnt)
     		$("#page").val(res.page)
     		if(res.cnt != '0'){
     			drawPaging(res.pb)
     		}
     	}else if(res.result == "FAILED"){
     	}
     	console.log(res.result)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}


function drawSubResumList(list, cnt) {
	let html = ""
	let prcssState = ""
	let findChk = ""
	
	
	if(cnt == '0'){
 		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="zero">입사지원 내용이 없습니다.</div>                                                          '	    
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '	    		
 		}
 		
	for (data of list){
	
		if(typeof data.PRCSS_DATE == "undefined"){
			data.PRCSS_DATE ="미처리"
		}
		
		if(data.FIND_CHK == 0){
			findChk = "미조회"
		}else{
			findChk = "조회"
		}
		
		if(data.PRCSS_STATE == 0){
			prcssState = "미처리"
		}else{
			prcssState = "조회"
		}
		
		
		
		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="subResum_list">                                                                 '
	    html += '                              <div class="dtl_box">                                                                    '
	    html += '                                  <div class="subResum_dtl">                                                          '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">공고명</div>                                         '
	    html += '                                              <div class="data title">'+data.EMP_TITLE+'</div>                                                                   '
	    html += '                                          </div>                                                                     '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">제출일</div>                                           '
	    html += '                                              <div class="data">'+data.REG_DATE+'</div>                                         '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row ">                                                           '
	    html += '                                              <div class="text">이력서</div>                                             '
	    html += '                                              <div class="data ">'+data.RESUM_NAME+'</div>                                          '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">조회/처리</div>                                             '
	    html += '                                              <div class="data">'+findChk+ ' / ' +prcssState+'</div>                                             '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">마감일</div>                                           '
	    html += '                                              <div class="data">'+data.DLINE+'</div>                                      '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                              <div class="button_container">                                                           '
	    html += '                                  <div class="button_box">                                                             '
			html += '                                      <button type="button" id="goResum" class="b_hover" rNo="'+data.RESUM_NO+'" eNo="'+data.EMP_NO+'" >확인</button>             '
		html += '                                  </div>                                                                               '
		html += '                                  <div class="button_box">                                                             '
			html += '                                      <button type="button" id="sCancBtn" class="b_hover" rNo="'+data.RESUM_NO+'" eNo="'+data.EMP_NO+'" >취소</button>             '
		    html += '                                      <button type="button" id="sUpdateBtn" class="b_hover"  rNo="'+data.RESUM_NO+'" eNo="'+data.EMP_NO+'">변경</button>             '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
	
	
	}
	
	
		$(".subResum").html(html)
	

}	


function drawPaging(pb) {

      let html = ''
         /* 현재 페이지 굵은 글씨 적용*/
         html += '<span page="1">&lt;&lt;</span>'
         
         if($("#page").val() == 1){
            html +=   '<span page="1">&lt;</span>'   
         }else{
            html += '<span page="' + ($("#page").val()*1 - 1) + '">&lt;</span>'
         }
         
         for(var i = pb.startPcount; i <= pb.endPcount; i++){
            if($("#page").val() == i ){
               html += '<span page="' + i + '"><b>' + i + '</b></span>'   
            }else{
               html += '<span page="' + i + '">' + i + '</span>'   
            }
         }
         
         if($("#page").val() == pb.maxPcount){
            html += '<span page="' + pb.maxPcount + '">&gt;</span>'   
         }else{
            html += '<span page="' + ($("#page").val()*1 + 1) + '">&gt;</span>'
         }
         
         html += '<span page="' + pb.maxPcount + '">&gt;&gt;</span>'
         
      		$("#subResum_paging_wrap").html(html)
   }

function changeSubResum(){
	let params = $("#prcssForm").serialize()
	
	$.ajax({
    type: "POST",
    data: params,
    url: "changeSubResumAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
			alert("처리에 성공했습니다.")
				getSubResum()
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



