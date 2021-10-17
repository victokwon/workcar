$(function () {

  $("#cSchBtn").on("click", function () {
    $(".pop-container").show();
  });
  
    $("#schBtn").on("click", function () {
  	 schCInfo()
  });
  
  $("tbody").on("click", "td", function () {
    $("#crno").val($(this).attr("crno"));
    $(".pop-container").hide();
  });
  
	$(".paging_wrap").on("click","span",function(){
		$("#page").val($(this).attr("page"))
		cInfoList()
	})
});

function schCInfo() {
	var params = $("#companySchForm").serialize();
  $.ajax({
    type: "POST",
    data: params,
    url: "getApiDataAjax",
    dataType: "text",
    success: function (res) {
    console.log("a");
     console.log(JSON.parse(res));
    },
    error: function (request, status, error) {
      console.log(error);
    }
  });
}

function drawCInfoList(){
	var params = $("#companySchForm").serialize();
	
	  $.ajax({
	    type: "post",
	    url: "cInfoListAjax",
	    dataType: "json",
	    data: params,
	    success: function (res) {
	    	drawPaging(res.pb)
	    },
	    error: function (request, status, error) {
	      console.log(error);
	    }
	  });
}

function companyList(list) {
  var html = "";

  for (var data of list) {
  		let listChk;
	  if(data.enpXchgLstgDt != ""){
		listChk = 0;
	  }else{
	  	listChk = 1;
	  }
    html += "<tr corpNo='" 
    + data.crno + 
    "' cName='" 
    + data.corpNm + "'"
    + "listChk='" 
    + listChk + "'"
    + "wrkCnt='"
    + data.enpEmpeCnt+ "'"
	+ "bzno='"
    + data.bzno+ "'"
    + "enpHmpgUrl='"
    + data.enpHmpgUrl+ "'"
	+ "smenpYn='"
    + data.smenpYn+ "'"
	+ "enpPn1AvgSlryAmt='"
    + data.enpPn1AvgSlryAmt+ "'"
	+ "enpEstbDt='"
    + data.enpEstbDt+ "'"
	+ "sicNm='"
    + data.sicNm+ "'"
    + ">";
    html += "   <td>" + data.corpNo + "</td>";
    html += "   <td>" + data.corpNm + "</td>";
    html += "</tr>";
  }

  $("tbody").html(html);
}

function drawPage(pb) {
		var html = ""
			
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
			html += "	<span page=\"" + pb.maxPcoung + "\">다음</span>"	
			}else{
			html += "	<span page=\"" + ($("#page").val()*1 + 1) + "\">다음</span>	"
			}
			html += "<span page=\"" + pb.maxPcount + "\">끝</span>"
			
		$(".paging_wrap").html(html)
	}
