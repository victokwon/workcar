$(function(){
	getSendReq()	

   $("#sendReq_paging_wrap").on("click","span",function(){
	 $("#page").val($(this).attr("page"))
     getSendReq()
   })
	
   	$(".sendReq").on("click", "#cancBtn",function(){
   		$("#goMemNo").val($(this).attr("mNo"))
   		$("#goEmpNo").val($(this).attr("eNo"))
		sendReqCanc() 
	})
	
   	$(".sendReq").on("click", "#delBtn",function(){
		$(this).parent().parent().parent().parent().remove()
	})
    
})   
    
/*이벤트 온 오프 처리*/

function getSendReq(){
	let params = $("#sendReqForm").serialize()
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getSendReqAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawsendReqList(res.list, res.cnt)
     		$("#page").val(res.page)
     		if(res.cnt != '0'){
     		console.log(res.pb)
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


function drawsendReqList(list, cnt) {
	let html = ""
	
	
	
	if(cnt == '0'){
 		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="zero">처리할 내용이 없습니다.</div>                                                          '	    
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '	    		
 		}
 		
	for (data of list){
	
		
		
		if(data.REFUSE_CHK == "0"){
			data.REFUSE_CHK = "미응답"
		}else if(data.REFUSE_CHK == "1"){
			data.REFUSE_CHK = "거절"
		}
		
		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="sendReq_list">                                                                 '
	    html += '                              <div class="dtl_box">                                                                    '
	    html += '                                  <div class="sendReq_dtl">                                                          '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">이름</div>                                           '
	    html += '                                              <div class="data">'+data.NAME+'</div>                                         '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">공고명</div>                                         '
	    html += '                                              <div class="data title">'+data.EMP_TITLE+'</div>           '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row ">                                                           '
	    html += '                                              <div class="text">성별</div>                                             '
	    html += '                                              <div class="data ">'+data.GENDER +'</div>                                          '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
		html += '    							    <div class="text">처리</div>         '
		html += '    							    <div class="data">'+data.REFUSE_CHK+'</div>         '
	    html += '                                              </div>                                             '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">제안일</div>                                           '
	    html += '                                              <div class="data">'+data.REG_DATE+'</div>                                      '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                              <div class="button_container">                                                           '
	    html += '                                  <div class="button_box">                                                             '
	    html += '                                      <button type="button" id="cancBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" >취소</button>             '
		html += '                                      <button type="button" id="delBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" >삭제</button>             '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
		}
		
	
		$(".sendReq").html(html)
	
	$(".star_rating").each(function(idx){
		let score = $(this).attr("score")
			html = ''
		for(let i = 0; i<Math.round(score); i++){
			html+= '	    <span class="fa fa-star checked"></span>             '
		}
		for(let i = 0; i<5-Math.round(score); i++){
			html+= '	    <span class="fa fa-star"></span>             '
		}
		$(this).html(html)
	})

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
         
      		$("#sendReq_paging_wrap").html(html)
   }



function sendReqCanc(){

	let params = $("#sendReqForm").serialize()
	
	$.ajax({
    type: "POST",
    data: params,
    url: "sendReqCancAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
			alert("처리에 성공했습니다.")
				getSendReq()	
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




