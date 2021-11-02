$(function(){
	getRecepReq()	

   $("#recepReq_paging_wrap").on("click","span",function(){
	 $("#page").val($(this).attr("page"))
     getRecepReq()
   })
	
	$(".main_info").on("click","#goEmpBtn",function(){
		$("#goEmpNo").val($(this).attr("eNo"))
		$("#recepReqForm").attr("action","applyDetail")
		$("#recepReqForm").submit()
	})
   
   	$(".recepReq").on("click", "#refuseBtn",function(){
		$("#goEmpNo").val($(this).attr("eNo"))
		recepReqRefuse() 
	})
    
})   
    
/*이벤트 온 오프 처리*/

function getRecepReq(){
	let params = $("#recepReqForm").serialize()
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getRecepReqAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawRecepReqList(res.list, res.cnt)
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


function drawRecepReqList(list, cnt) {
	let html = ""
	
	
	
	
	if(cnt == '0'){
 		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="zero">처리할 내용이 없습니다.</div>                                                          '	    
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '	    		
 		}
 		
	for (data of list){
	
		
		
		
		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="recepReq_list">                                                                 '
	    html += '                              <div class="dtl_box">                                                                    '
	    html += '                                  <div class="recepReq_dtl">                                                          '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">공고명</div>                                           '
	    html += '                                              <div class="data title">'+data.EMP_TITLE+'</div>                                         '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">제안일</div>                                         '
	    html += '                                              <div class="data">'+data.REG_DATE+'</div>           '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row ">                                                           '
	    html += '                                              <div class="text">기업</div>                                             '
	    html += '                                              <div class="data ">'+data.C_NAME+'</div>                                          '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">평점</div>                                             '
	    html += '                                              <div class="data">'
	    html+= '	<div class="star_rating" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'">                        '
		html+= '	</div>      	    '
	    html += '                                              </div>                                             '
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
	    html += '                                      <button type="button" id="goEmpBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" >확인</button>             '
	    html += '                                  </div>                                                                               '
	    html += '                                  <div class="button_box">                                                             '
		html += '                                      <button type="button" id="tApplyBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" >지원</button>             '
	    html += '                                      <button type="button" id="refuseBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" >거절</button>             '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
	
		
	
                                     
	
	
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
	
	
		$(".recepReq").html(html)
	
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
         
      		$("#recepReq_paging_wrap").html(html)
   }



function recepReqRefuse(){

	let params = $("#recepReqForm").serialize()
	
	$.ajax({
    type: "POST",
    data: params,
    url: "recepReqRefuseAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
			alert("처리에 성공했습니다.")
				getRecepReq()	
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




