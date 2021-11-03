$(function () {

var cnt = 1;

  $(".add_box").on("click", ".minus_btn", function () {
    $(this).parent().html("");
    cnt -= 1 ;
  });

  $(".sal").on("change", "input", function () {
    if ($("#sal1").is(":checked")) {
      $("#minSal").attr("disabled", false);
      $("#maxSal").attr("disabled", false);
    } else {
      $("#minSal").attr("disabled", true);
      $("#maxSal").attr("disabled", true);
    }
  });

/*  $(".career").on("change", "input", function () {
    if ($("#career2").is(":checked")) {
      $("#minCareer").attr("disabled", false);
      $("#maxCareer").attr("disabled", false);
    } else {
      $("#minCareer").attr("disabled", true);
      $("#maxCareer").attr("disabled", true);
    }
  });*/

/*  // 자격증 1
	$("#addBtn1").on("click", function () {
	  
	    
	    if(cnt <4){
	    
        let html = "";
        html += '<div class="input_box " id="qualInput'+cnt+'" no="'+cnt+'" noName="qualNo">';
        html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
        html += '<div class="data_container">';
        html += '<button type="button" id="qualBtn" no="'+cnt+'" >자격증검색</button>';
        html += '<input class="qual_input" name="QUAL_NO" id="QUAL_NO'+cnt+'" type="hidden" readonly>';
        html += '<input class="qual_input" name="QUAL_NAME" id="QUAL_NAME'+cnt+'" value="자격증 명" type="text" disabled style="width:200px; text-align: center; margin-left: 30px;">';
        html += " </div>";
        html += " </div>";
	
	  $(this).parent().prepend(html);
	  cnt += 1
	  
	  }else{
	  alert("자격증은 3개 이상 등록이 불가능합니다.")
	  }
	});*/

  // 첨부파일 2
  $("#addBtn7").on("click", function () {
    html = "";
    html += '<div class="input_box ">';
    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
    html += '<div class="data_container file_container">';
    html += '<div id="fileSNm">파일명</div>';
    html += '<input type="hidden" id="fileLNm">';
    html += '<button type="button">파일업로드</button>';
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
  });
});
