$(function(){
	getIMember()
	
  $("#imember").on("click", function () {
 	getIMember()
    $(".imember").css("display", "table");
    $(".cmember").css("display", "none");
    $("#imember_paging_wrap").show()
    $("#cmember_paging_wrap").hide()
  });
  
  $("#cmember").on("click", function () {
   	getCMember()	
    $(".imember").css("display", "none");
    $(".cmember").css("display", "table");
    $("#cmember_paging_wrap").show()
    $("#imember_paging_wrap").hide()
  });

   $("#imember_paging_wrap").on("click","span",function(){
	 $("#Ipage").val($(this).attr("page"))
     getIMember()
   })
	
   $("#cmember_paging_wrap").on("click","span",function(){
	 $("#Cpage").val($(this).attr("page"))
     getCMember()
   })
   
 })   
    
/*이벤트 온 오프 처리*/

function getIMember(){
	let params = $("#imemberForm").serialize()
	let view = "imember"
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getIMemAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawIMemList(res.list, view, res.cnt)
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

function getCMember(){
	let params = $("#cmemberForm").serialize()
	let view = "cmember"
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getCMemAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawCMemList(res.list, view)
     		$("#Cpage").val(res.page)
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

function drawIMemList(list, view, cnt) {
	let html = ""
	if(cnt == '0'){
 		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="zero">처리할 내용이 없습니다.</div>                                                          '	    
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '	    		
 		}
 		
	for (data of list){
			let today = new Date()
			let year = parseInt(data.YEAR)
			let month = parseInt(data.MONTH)
			let day = parseInt(data.DAY)
			let birthDate = new Date(year, month, day)
			let age = today.getFullYear() - birthDate.getFullYear()
			let m = today.getMonth() - birthDate.getMonth()
			if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
			    age--;
			}
	
	
		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="imember_list">                                                                 '
	    html += '                              <div class="dtl_box">                                                                    '
	    html += '                                  <div class="imember_dtl">                                                          '
	    html += '                                      <div class="NO"><b>'+data.MEM_NO+'</b></div>                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">성명</div>                                           '
	    html += '                                              <div class="data">'+data.NAME+'</div>                                         '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">아이디</div>                                         '
	    html += '                                              <div class="data">'+data.ID+'</div>                              '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">나이 / 성별</div>                                         '
	    html += '                                              <div class="data">'+age+' / '+data.CAT_NAME+'</div>                              '
	    html += '                                          </div>   '
	    html += '                                      </div>                                                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row ">                                                           '
	    html += '                                              <div class="text">연락처</div>                                             '
	    html += '                                              <div class="data ">'+data.PHONE+'</div>                                          '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">이메일</div>                                             '
	    html += '                                              <div class="data">'+data.EMAIL, +'</div>                                             '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    
		if(typeof data.WDRAWL_DATE == "undefined"){
	    html += '                                              <div class="text">가입일</div>                                           '
	    html += '                                              <div class="data">'+data.JOIN_DATE+'</div>                                      '
	    }else{
	    html += '                                              <div class="text">탈퇴일</div>                                           '
	    html += '                                              <div class="data sece">'+data.WDRAWL_DATE+'</div>                                      '
	    }
	    
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                              <div class="button_container">                                                           '
	    html += '                                  <div class="button_box">                                                             '
	    html += '                                      <button type="button" id="updateBtn" class="b_hover" mNo="'+data.MEM_NO+'" >수정</button>             '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
	}
	
		$(".imember").html(html)
}	

function drawCMemList(list, view, cnt) {
	let html = ""
	let approve = "미승인"
	if(typeof data.RRCSS_DATE == "undefined"){
		data.C_NAME = "[미승인]" + data.C_NAME
	}
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
	    html += '                          <div class="cmember_list">                                                                 '
	    html += '                              <div class="dtl_box">                                                                    '
	    html += '                                  <div class="cmember_dtl">                                                          '
	    html += '                                      <div class="NO"><b>'+data.MEM_NO+'</b></div>                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">성명</div>                                           '
	    html += '                                              <div class="data">'+data.NAME+'</div>                                         '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">아이디</div>                                         '
	    html += '                                              <div class="data">'+data.ID+'</div>                              '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">회사명</div>                                         '
	    html += '                                              <div class="data">'+data.C_NAME+'</div>                              '
	    html += '                                          </div>   '
	    html += '                                      </div>                                                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row ">                                                           '
	    html += '                                              <div class="text">연락처</div>                                             '
	    html += '                                              <div class="data ">'+data.PHONE+'</div>                                          '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">이메일</div>                                             '
	    html += '                                              <div class="data">'+data.EMAIL, +'</div>                                             '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    
		if(typeof data.WDRAWL_DATE == "undefined"){
	    html += '                                              <div class="text">가입일</div>                                           '
	    html += '                                              <div class="data">'+data.JOIN_DATE+'</div>                                      '
	    }else{
	    html += '                                              <div class="text">탈퇴일</div>                                           '
	    html += '                                              <div class="data sece">'+data.WDRAWL_DATE+'</div>                                      '
	    }
	    
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                              <div class="button_container">                                                           '
	    html += '                                  <div class="button_box">                                                             '
	    html += '                                      <button type="button" id="updateBtn" class="b_hover" mNo="'+data.MEM_NO+'" cNo="'+data.CORP_NO+'">수정</button>             '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
	}
	
		$(".cmember").html(html)
}	


function drawPaging(pb, view) {
	let pageName =""
	if(view =="imember"){  
		pageName = "Ipage"
	}else if(view =="cmember"){
		pageName = "Cpage"
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
         
   		if(view =="imember"){  
      		$("#imember_paging_wrap").html(html)
    	}else if(view =="cmember"){
     		$("#cmember_paging_wrap").html(html)
 		}
   }





