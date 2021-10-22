$(function () {
	  $(".apply_content").on("click", ".apply_update_btn", function () {
	    // hidden form에 이력서 정보 전달 및 ajax 전달밀 이력서 세부 내용 가져와 화면 재구성
	    $("#resumeNO").val($(this).parent().parent().attr("resumeNO"));
	
	   
	  });
	
	  $(".add_box").on("click", ".minus_btn", function () {
	    $(this).parent().remove();
	  });
  })