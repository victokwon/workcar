$(function(){
	console.log($("#city\\[0\\]").val())
	
		getRegion0($("#city\\[0\\]").val())
		getRegion1($("#city\\[0\\]").val())
		getRegion2($("#city\\[0\\]").val())
		getRegion3($("#city\\[0\\]").val())
		
	$(".locSelectBox").on("change",".citySel",function(){
		let no = $(this).attr("locResumNo")
		if(no == 0){
			getRegion0($(this).val())
		}else if(no == 1){
			getRegion1($(this).val())
		}else if(no == 2){
			getRegion2($(this).val())
		}else if(no == 3){
			getRegion3($(this).val())
		}
	})
	
})

function getRegion0(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw0(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion1(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw1(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion2(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw2(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}
function getRegion3(city){
	$.ajax({
			type : "POST",
			data : "cityNo=" + city,
			url : "getRegionAjax",
			dataType : "json",
			success : function(res) {
				if (res.result == "SUCCESS") {
					regionOptionDraw3(res.list)
				} else if (res.result == "FAILED") {
					console.log(res.result)
				}
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
}

function regionOptionDraw0(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[0\\]").html(html)
}

function regionOptionDraw1(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[1\\]").html(html)
}

function regionOptionDraw2(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[2\\]").html(html)
}
function regionOptionDraw3(list){
	var html= "" 
		for(data of list){
				html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
		}
	$("#region\\[3\\]").html(html)
}