$(function () {
	let qualCnt = 0;
	
	$(".pop-container").on('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  }
	  })
	  
/* js에서 api 데이터 호출해서 활용하는 방법 =?= controller에서 api데이터 호출해서 활용하는 방법*/
	$("#qualSchBtn").on("click", function () {
		$(".pop-container").attr("btn","q")
		$("#qualList").attr("no", $(this).attr("no"))
		$(".pop-text-header").children("h1").html("자격증 검색")
		$("#qualList").html("");
		$("#schCName").val("");
		$("#schQualBtn").show()
	    $("#schSectorBtn").hide()
		
		let cnt = $("input[name=qualno]").length
		if(cnt < 3){
			let html = "";
			$(".pop-container").show();

		}else{
			alert("안됨")
		}
	});
  
	$("#cancelBtn").on("click", function(){
		$(".pop-container").hide();

	});
  
	$("#schQualBtn").on("click", function () {
		schQual();
	});
	
	
	/*$(".paging_wrap").on("click","span",function(){
		$("#pop_page").val($(this).attr("pop_page"));
		schQual();
	})*/
	$(".lisence_box").on("click", ".minus_btn", function () {
		$(this).parent().remove("");
	});
	
});

function schQual() {
   let params = $("#qualSchForm").serialize();
   
  $.ajax({
    type: "POST",
    data: params,
    url: "getQualList",
    dataType: "json",
    success: function (res) {
     qualList(res.list);
     popdrawPaging(res.pb)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}

function qualList(list) {
  let html = "";
  
      for(let data of list){
      html += "<tr "
      
      html += "qNo="
      
      html += "'" + data.QUAL_NO + "'"
      
      html += "qName="
      
      html += "'" + data.QUAL_NAME + "'>"
      
      html += "    <td>" + data.QUAL_NO + "</td>"
      
      html += "    <td>" + data.QUAL_NAME + "</td>"
      
      html += "</tr>"
      }
  

  $("#qualList").html(html);
}


function popdrawPaging(pb) {
		let html = ""
			/* 현재 페이지 굵은 글씨 적용*/
			html += "<span pop_page=\"1\">처음</span>"
			
			if($("#pop_page").val() == 1){
				html +=	"	<span pop_page=\"1\">이전</span>"	
			}else{
				html += "	<span pop_page=\"" + ($("#pop_page").val()*1 - 1) + "\">이전</span>	"
			}
			
			for(var i = pb.startPcount; i <= pb.endPcount; i++){
				if($("#pop_page").val() == i ){
					html += "	<span pop_page=\"" + i + "\"><b>" + i + "</b></span>"	
				}else{
					html += "	<span pop_page=\"" + i + "\">" + i + "</span>"	
				}
			}
			
			if($("#page").val() == pb.maxPcount){
				html += "	<span pop_page=\"" + pb.maxPcount + "\">다음</span>"	
			}else{
				html += "	<span pop_page=\"" + ($("#pop_page").val()*1 + 1) + "\">다음</span>	"
			}
			
			html += "<span pop_page=\"" + pb.maxPcount + "\">끝</span>"
			
		$(".paging_wrap").html(html)
	}
	
function qaulOverChk(){
	   	let arr = new Array()
       $("input[name=qualno]").each(function(idx){
         arr.push($(this).val())
         })
         let set = new Set(arr)
         console.log(arr)
         console.log(set)
         if(arr.length != set.size){
               alert("자격증이 중복되었습니다.")
               return false
          }
          return true
  }