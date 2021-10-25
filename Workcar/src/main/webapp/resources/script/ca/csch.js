$(function () {
	$(".pop-container").on('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  }
	  })
	  
/* js에서 api 데이터 호출해서 활용하는 방법 =?= controller에서 api데이터 호출해서 활용하는 방법*/
  $("#cSchBtn").on("click", function () {
    $(".pop-container").show();
  });
  
    $("#schBtn").on("click", function () {
  	 schCInfo()
  });
  
  $("tbody").on("click", "tr", function () {
    $("#cName").val($(this).attr("cName"));
    $("#corpNo").val($(this).attr("corpno"));
    $("#listChk").val($(this).attr("listChk"));
    $("#wrkCnt").val($(this).attr("wrkCnt"));
    $("#enpHmpgUrl").val($(this).attr("enpHmpgUrl"));
    $("#smenpYn").val($(this).attr("smenpYn"));
    $("#enpRprFnm").val($(this).attr("enpRprFnm"));
    $("#sicNm").val($(this).attr("sicNm"));
    $(".pop-container").hide();
    $("#cSchBtn").next().attr("style", "background-image: url(resources/images/ca/ccheck.png)")
  });
  
	$(".paging_wrap").on("click","span",function(){
		$("#page").val($(this).attr("page"))
		schCInfo()
	})
});

function schCInfo() {
	let params = $("#companySchForm").serialize();
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getApiDataAjax",
    dataType: "json",
    success: function (res) {
    console.log("기업검색에이젝스");
     $("#itemCnt").val(res.response.body.totalCount)
     drawCInfPaging()
     console.log(res.response.body.items);
     companyList(res.response.body.items);
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}

function drawCInfPaging(){
	let params = $("#companySchForm").serialize();
	
	  $.ajax({
	    type: "post",
	    url: "apiPagingAjax",
	    dataType: "json",
	    data: params,
	    success: function (res) {
	    	drawPaging(res.pb)
	    },
	    error: function (request, status, error) {
			console.log(request);
			console.log(error);
	    }
	  });
}

function companyList(items) {
  let html = "";
		for (let data of items.item) {
	  		let listChk;
		  if(data.enpXchgLstgDt != ""){
			listChk = 0;
		  }else{
		  	listChk = 1;
		  }
		
		html += "<tr "
		
		html += "corpNo="
		
		html += "'" + data.crno + "'"
		
		html += "cName="
		
		html += "'" + data.corpNm + "'"
		
		html += "listChk="
		
		html += "'" + listChk + "'"
		
		html += "wrkCnt="
		
		html += "'" + data.enpEmpeCnt + "'"
		
		html += "bzno="
		
		html += "'" + data.bzno + "'"
		
		html += "enpHmpgUrl="
		
		html += "'" + data.enpHmpgUrl + "'"
		
		html += "smenpYn="
		
		html += "'" + data.smenpYn + "'"
		
		html += "npPn1AvgSlryAmt="
		
		html += "'" + data.enpPn1AvgSlryAmt + "'"
		
		html += "enpRprFnm="
		
		html += "'" + data.enpRprFnm + "'"
		
		html += "sicNm="
		
		html += "'" + data.sicNm + "'>"
		
		html += "    <td>" + data.corpNm + "</td>"
		
		html += "    <td>" + data.crno + "</td>"
		
		html += "</tr>"
		
  }

  $("tbody").html(html);
}

function drawPaging(pb) {
		let html = ""
			/* 현재 페이지 굵은 글씨 적용*/
			html += "<span page=\"1\">처음</span>"
			
			if($("#page").val() == 1){
				html +=	"	<span page=\"1\">이전</span>"	
			}else{
				html += "	<span page=\"" + ($("#page").val()*1 - 1) + "\">이전</span>	"
			}
			
			for(var i = pb.startPcount; i <= pb.endPcount; i++){
				if($("#page").val() == i ){
					html += "	<span page=\"" + i + "\"><b>" + i + "</b></span>"	
				}else{
					html += "	<span page=\"" + i + "\">" + i + "</span>"	
				}
			}
			
			if($("#page").val() == pb.maxPcount){
				html += "	<span page=\"" + pb.maxPcount + "\">다음</span>"	
			}else{
				html += "	<span page=\"" + ($("#page").val()*1 + 1) + "\">다음</span>	"
			}
			
			html += "<span page=\"" + pb.maxPcount + "\">끝</span>"
			
		$(".paging_wrap").html(html)
	}
