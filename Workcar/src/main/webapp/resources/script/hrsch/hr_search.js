


  function moreBtn(){
    if ($("#icon").attr("src") == "resources/images/empsch/up.png") {
        $("#icon").attr("src", "resources/images/empsch/down.png")
        $("#more").hide()
    } else if ($("#icon").attr("src") == "resources/images/empsch/down.png") {
        $("#icon").attr("src", "resources/images/empsch/up.png")
        $("#more").show()
    }
}
$(function(){
	$(".sal").on("change", "input", function () {
		if ($("#sal1").is(":checked")) {
			$("#minSal").attr("disabled", false);
			$("#maxSal").attr("disabled", false);
		} else {
		      $("#minSal").attr("disabled", true);
		      $("#maxSal").attr("disabled", true);
    	}
	});
	$(".career").on("change", "input", function () {
		if ($("#career2").is(":checked")) {
		  $("#minCareer").attr("disabled", false);
		  $("#maxCareer").attr("disabled", false);
		} else {
		  $("#minCareer").attr("disabled", true);
		  $("#maxCareer").attr("disabled", true);
		}
	});
	

	
})