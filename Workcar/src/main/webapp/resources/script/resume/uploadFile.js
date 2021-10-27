$(function(){
	$("#add_box").on("click","fileBtn",function(){
	
	})
})
let fileForm = $("#fileForm")
			
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
						if(res.fileName.length > 0) {
							$("#nFile").val(res.fileName[0]);
						}
						
						//글 저장
						var params = $("#addForm").serialize();  //데이터를 문자열화
						
						$.ajax({
							url: "ntcABAdds",   //이 주소로 데이터 주고받을거야
							type: "post",
							dataType: "json",  
							data: params,
							success: function(res) { 
								if(res.result == "success") { // 성공시 그냥 로케이션 이동
									location.href = "ntcSpaceABList";
								} else if(res.result == "failed") {
									alert("작성에 실패하였습니다.");
								} else {
									alert("작성중 문제가 발생했습니다.");
								}
							},
							error: function(request, status, error) {
								console.log(error);
							}
						});
						
					} else {
						alert("파일 업로드에 실패하였습니다.");
					}
				},
				error : function(req, status, error) {
					console.log(error);
					alert("파일 업로드중 문제가 발생하였습니다.");
				}
				
			});
			
			fileForm.submit();