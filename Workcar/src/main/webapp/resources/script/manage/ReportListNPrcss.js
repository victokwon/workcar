$(function(){
	getIDcl()
	getDDcl()
	
   $("#reporting_paging_wrap").on("click","span",function(){
	 $("#Ipage").val($(this).attr("page"))
     getIDcl()
   })
	
   $("#reported_paging_wrap").on("click","span",function(){
	 $("#Dpage").val($(this).attr("page"))
     getDDcl()
   })
   
   $(".pop-container").on("click",".prcssBtn",function(){
   		
   		if($("#prcssGbn").val() == '0'){
			alert("미처리 상태로 처리할 수 없습니다.")
			return	   	
   		}else if($("#prcssGbn").val() == '2'){
   			if($("#dclareRefuse").val() ==""){
   				alert("거절내용이 누락되었습니다.")
   				$("#dclareRefuse").focus()
   				return
   			}
   		}
		DclUpdate()
   		$(".pop_wrap").hide();
		$(".pop-container").html("")
   })
   
    
})   
    
/*이벤트 온 오프 처리*/

function getIDcl(){
	let params = $("#ReportingForm").serialize()
	let view = "ing"
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getDclAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawDclList(res.list, view, res.cnt)
     		$("#Ipage").val(res.page)
     		if(res.cnt != '0'){
     			drawPaging(res.pb, view)
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

function getDDcl(){
	let params = $("#ReportedForm").serialize()
	let view = "ed"
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getDclAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawDclList(res.list, view)
     		$("#Dpage").val(res.page)
     		drawPaging(res.pb, view)
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

function drawDclList(list, view, cnt) {
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
	    html += '                          <div class="reporting_list">                                                                 '
	    html += '                              <div class="box_profile"></div>                                                          '
	    html += '                              <div class="dtl_box">                                                                    '
	    html += '                                  <div class="reporting_dtl">                                                          '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">신고자</div>                                           '
	    html += '                                              <div class="data">'+data.NAME+'</div>                                         '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">채용공고</div>                                         '
	    html += '                                              <div class="data title">'
	    
		if(data.DEL_CHK == '1'){
			html += '[삭제됨]'
		}
	    
	    html += '                                              '+data.EMP_TITLE+'</div>                              '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row ">                                                           '
	    html += '                                              <div class="text">기업</div>                                             '
	    html += '                                              <div class="data ">'+data.C_NAME+'</div>                                          '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">사유</div>                                             '
	    html += '                                              <div class="data">'+data.DCLARE_REASN, +'</div>                                             '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">신고일</div>                                           '
	    html += '                                              <div class="data">'+data.REG_DATE+'</div>                                      '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                              <div class="button_container">                                                           '
	    
	    if(view =="ing"){
		    html += '                                  <div class="button_box">                                                             '
		    html += '                                      <button type="button" id="rPrcssBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" dNo="'+data.DCLARE_NO+'">처리</button>             '
		    html += '                                  </div>                                                                               '
		}else if(view =="ed"){
			    html += '                                  <div class="button_box">                                                             '
			if(data.PRCSS_GBN =="0"){
				html += '                                      <button type="button" id="rPrcssBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" dNo="'+data.DCLARE_NO+'">처리</button>             '
			}else{		    
			    html += '                                      <button type="button" id="rUpdateBtn" class="b_hover" mNo="'+data.MEM_NO+'" eNo="'+data.EMP_NO+'" dNo="'+data.DCLARE_NO+'">수정</button>             '
			    html += '                                      <button type="button" class="n_hover" >완료</button>             '
		    }
		    html += '                                  </div>                                                                               '
	    }
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
	}
	
	
	if(view =="ing"){
		$(".reporting").html(html)
	}else if(view =="ed"){
		$(".reported").html(html)
	}
}	


function drawPaging(pb, view) {
	let pageName =""
	if(view =="ing"){  
		pageName = "Ipage"
	}else if(view =="ed"){
		pageName = "Dpage"
	}

      let html = ''
         /* 현재 페이지 굵은 글씨 적용*/
         html += '<span page="1">&lt;&lt;</span>'
         
         if($("#"+pageName+"").val() == 1){
            html +=   '<span page="1">&lt;</span>'   
         }else{
            html += '<span page="' + ($("#"+pageName+"").val()*1 - 1) + '">&lt;</span>'
         }
         
         for(var i = pb.startPcount; i <= pb.endPcount; i++){
            if($("#"+pageName+"").val() == i ){
               html += '<span page="' + i + '"><b>' + i + '</b></span>'   
            }else{
               html += '<span page="' + i + '">' + i + '</span>'   
            }
         }
         
         if($("#"+pageName+"").val() == pb.maxPcount){
            html += '<span page="' + pb.maxPcount + '">&gt;</span>'   
         }else{
            html += '<span page="' + ($("#"+pageName+"").val()*1 + 1) + '">&gt;</span>'
         }
         
         html += '<span page="' + pb.maxPcount + '">&gt;&gt;</span>'
         
   		if(view =="ing"){  
      		$("#reporting_paging_wrap").html(html)
    	}else if(view =="ed"){
     		$("#reported_paging_wrap").html(html)
 		}
   }

function DclUpdate(){
	let params = $("#prcssForm").serialize()
	
	$.ajax({
    type: "POST",
    data: params,
    url: "updateDclAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
			alert("처리에 성공했습니다.")
	   		getIDcl()
			getDDcl()
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




