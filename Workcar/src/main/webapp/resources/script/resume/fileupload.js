$(function(){
	$("#fileBox").on("click","#fileBtn",function(){
		$("#att").attr("target", $(this).attr("target"))
		$("#att").click();
	})
	
	$("#att").on("change", function(){
		let target = $("#att").attr("target")
		uploadAjax(target)
		$("#fileName"+ target +"").html($(this).val().substring($(this).val().lastIndexOf("\\")+1))
	})
})

function uploadAjax(target) {
	let fileForm = $("#fileForm")
	
	fileForm.ajaxForm({
		success : function(res){
			if(res.result == "SUCCESS"){
				if(res.fileName.length > 0){ 
					$("#mFile" +target+"").val(res.fileName[0])
				}
			}else {
				alert("파일 업로드 중 실패")
			}
		},
		error : function(req, status, error){
			console.log(error)
			alert("파일 업로드 중 문제 발생")
		}
	})
	
	fileForm.submit();
}