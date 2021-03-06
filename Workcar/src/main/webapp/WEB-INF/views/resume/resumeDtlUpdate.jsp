<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
   href="resources\css\common\default.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\common\footer.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\common\header.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\common\sidebar.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\resume\resumeDtl.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\resume\floatRightNav.css">
   <link rel="stylesheet" type="text/css"
   href="resources\css\resume\pop.css">

<script type="text/javascript"
   src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
	src="resources/script/jquery/jquery.form.js"></script> 
<script type="text/javascript" src="resources\script\resume\sector.js"></script>
<script type="text/javascript" src="resources\script\resume\qual.js"></script>
<script type="text/javascript" src="resources\script\resume\fileupload.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
	$(function() {
	    var noBox = {
	          qualNo: ${conCnt.QUAL_CNT},
	          flangNo:${conCnt.FLANG_CNT},
	          carrNo: ${conCnt.CARR_CNT},
	          eduNo: ${conCnt.EDU_CNT},
	          ieduNo: ${conCnt.IEDU_CNT},
	          sintroNo: ${conCnt.SINTRO_CNT},
	          attchNo: ${conCnt.ATTCH_CNT}
	         }
   
	 $(".list_wrap").on("click", "tr", function () {
		  	if($(".pop-container").attr("btn") == "q"){
		  		let target = $("#list_box").attr("no")
				$("#qualName"+target+"").val($(this).attr("qName"));
			    $("#qualNo"+target+"").val($(this).attr("qNo"));
			    $(".pop-container").hide();
		  	}else if($(".pop-container").attr("btn") == "s"){
		  	    $("#sectorInput").html($(this).attr("sName"))
			    $("#sectorInput").attr( "sNo",$(this).attr("sNo"))
			    $("#sectorNo").val($(this).attr("sNo"))
			    $(".pop-container").hide()
	  		}
 	 });
    
	   $("select").each(function(idx) {
		   if($(this).attr("selValue") != "") {
			   $(this).val($(this).attr("selValue"));
		   }
	   });
	    
	    if("${DATA.PROF_PIC}"!=""){
	    
	    	$("#profile").attr("style", "background-image: url(resources/upload/${DATA.PROF_PIC }")
	    }
	    
	   $("select[name='region']").each(function(idx) {
		   getRegion($("#city" + idx + "").val(), $(this), $(this).attr("selValue"));
	   });
	   
	    
		$("#saveBtn").on("click",function(){
			if($("#sal0").is(":checked")){
				$("#salMin").val("0")
				$("#salMax").val("0")
			}
			if($("#carr0").is(":checked")){
				$("#carrPer").val("0")
			}
			if(checkInputText()
					&&checkInputSel()
					&&checkInputDate()
					&&checkInputTextarea()
					&&checkQualVal()){
			    $("#sectorNo").val($("#sectorInput").attr( "sNo"))
			   $("#updateForm").attr("action", "resumeUpdate")
			   $("#updateForm").submit() 
			}
		})
		
		if("${msg}"!=""){
		   alert(${msg})
		}
      
		$(".locSelectBox").on("change",".citySel",function(){
		   getRegion($(this).val(), $(this).next())
		}) 
      
		$("#resumeList").on("click","div",function(){
		   let resumeNo = $(this).attr("resumeNo")
		   $("#resumeNo").val(resumeNo)
		   $("#actGbn").val("Dtl")
		   $("#resumeGo").attr("action", "resumeDtl")
		   $("#resumeGo").submit()
		})
		
		 $(".add_box").on("click", ".minus_btn", function () {
		   let target = $(this).parent().attr("noName")
		   noBox[target] --
		   console.log(noBox)
		  $(this).parent().remove();
		}); 
       
		$(".sal").on("change", "input", function () {
		     if ($("#sal1").is(":checked")) {
		       $("#minSal").attr("readonly", false);
		       $("#maxSal").attr("readonly", false);
		     } else {
		       $("#minSal").attr("readonly", true);
		       $("#maxSal").attr("readonly", true);
		     }
		 });
		
		$(".carr").on("change", "input", function () {
		     if ($("#carr1").is(":checked")) {
		       $("#carrPer").attr("readonly", false);
		     } else {
		       $("#carrPer").attr("readonly", true);
		     }
		 });
		
    
		$("#resumeList").on("click","div",function(){
		   let resumeNo = $(this).attr("resumeNo")
		   $("#resumeNo").val(resumeNo)
		   $("#resumeGo").attr("action", "resumeDtl")
		   $("#resumeGo").submit()
		})
		
		if($("#sal0").val() == "${DATA.PAY_GBN}"){
		   $("#sal0").attr("checked","checked")
		}
		if($("#sal1").val() == "${DATA.PAY_GBN}"){
		   $("#sal1").attr("checked","checked")
		}
		
		if($("#carr0").val() == "${DATA.CARR}"){
			$("#carr0").attr("checked","checked")
		}
		if($("#carr1").val() == "${DATA.CARR}"){
		   $("#carr1").attr("checked","checked")
		}


      
       // ????????? 1
		$("#addBtn1").on("click", function () {
		
		   if(noBox.qualNo<3){
		   
		  let html = "";
		  html += '<div class="input_box " id="qualInput'+noBox.qualNo+'" no="'+noBox.qualNo+'" noName="qualNo">';
		  html += '<input type="button" class="minus_btn" id="delBtn" value="???">';
		  html += '<div class="data_container">';
		  html += '<button type="button" id="qualBtn" no="'+noBox.qualNo+'" btn="q">???????????????</button>';
		  html += '<input class="qual_input" name="qualNo" id="qualNo'+noBox.qualNo+'" type="hidden" value="????????? / ????????????" readonly>';
		  html += '<input class="qual_input" id="qualName'+noBox.qualNo+'" type="text" value="????????????" disabled>';
		  html += '<input class="qual_input" name="issuAgcy" id="issuAgcy'+noBox.qualNo+'" type="text" placeholder="?????????">';
		  html += '<input class="qual_input" name="passDate" id="passDate'+noBox.qualNo+'" type="date" ';
		  html += " </div>";
		  html += " </div>";
		
		  $(this).parent().prepend(html);
		  noBox.qualNo += 1
		  
		  }else{
		  alert("?????? ??????(?????? 3??? ?????? ??????)")
		  }
		});
        
        // ????????? 2
		$("#addBtn2").on("click", function () {
		
		   if(noBox.flangNo<3){
		
		  html = "";
		  html += '<div class="input_box" id="flangInput'+noBox.flangNo+'" no="'+noBox.flangNo+'" noName="flangNo">';
		  html += '<input type="button" class="minus_btn" id="delBtn" value="???">';
		  html += '<div class="data_container">';
		  html += '<select name="flangNo" id="flangNo">';
		  html += '<option value="-1">?????? ??????</option>';
		  html += '<option value="0">?????????</option>';
		  html += '<option value="1">?????????</option>';
		  html += '<option value="2">????????????</option>';
		  html += '<option value="3">????????????</option>';
		  html += '<option value="4">????????????</option>';
		  html += '<option value="5">?????????</option>';
		  html += '<option value="6">????????????</option>';
		  html += '<option value="7">?????????</option>';
		  html += '<option value="8">??????</option>';
		  html += '<option value="9">????????????</option>';
		  html += '<option value="10">?????????</option>';
		  html += '<option value="11">?????????</option>';
		  html += '<option value="12">?????????</option>';
		  html += '<option value="13">?????????</option>';
		  html += '<option value="14">?????????</option>';
		  html += '<option value="15">????????????</option>';
		  html += '<option value="16">???????????????</option>';
		  html += '<option value="17">????????????</option>';
		  html += '<option value="18">?????????</option>';
		  html += "</select>";
		  html += '<label for="flangType">??????</label>';
		  html += '<select name="flangType" id="flangType'+noBox.flangNo+'">';
		  html += '<option value="-1">?????? ??????</option>';
		  html += '<option value="??????/??????">??????/??????</option>';
		  html += '<option value="??????">??????</option>';
		  html += " </select>";
		  html += '<label for="flangGrade">??????</label>';
		  html += '<select name="flangGrade" id="flangGrade'+noBox.flangNo+'">';
		  html += '<option value="-1">?????? ??????</option>';
		  html += '<option value="???">???</option>';
		  html += '<option value="???">???</option>';
		  html += '<option value="???">???</option>';
		  html += " </select>";
		  html += " </div>";
		  html += " </div>";
		  
		  $(this).parent().prepend(html);
		  noBox.flangNo += 1;
		  
		  }else{
		  alert("?????? ??????(?????? 3??? ?????? ??????)")
		  }
		});
        
        // ???????????? 3
		$("#addBtn3").on("click", function () {
		
		   if(noBox.carrNo<3){
		
		  html = "";
		  html += '<div class="input_box more" id="carrInput'+noBox.carrNo+'" no="'+noBox.carrNo+'" noName="carrNo">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="???">';
		  html += '<div class="data_container ">';
		  html += '<div class="detail">';
		  html += " ??????";
		  html += '<input type="text" name="cName" id="cName'+noBox.carrNo+'" value="-" placeholder="?????????">';
		  html += " </div>";
		  html += '<div class="detail">'; 
		  html += " ??????";
		  html += '<input type="text" name="dpart" id="dpart'+noBox.carrNo+'" value="-" placeholder="?????????">';
		  html += " ??????";
		  html += '<input type="text" name="pos" id="pos'+noBox.carrNo+'" value="-" placeholder="?????????">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ????????????";
		  html += '<input type="date" name="carrStDate" id="stDate'+noBox.carrNo+'" placeholder="?????? ???/???">~';
		  html += '<input type="date" name="carrEndDate" id="EndDate'+noBox.carrNo+'" placeholder="?????? ???/???">';
		  html += " ????????????";
		  html += '<select name="tureChk">'
		  html += '<option value="??????">??????</option>'
		  html += '<option value="??????">??????</option>'
		  html += '</select>'
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ????????????";
		  html +=
		    '<textarea placeholder="????????????" spellcheck="false" name="carrCntt" id="carrCntt'+noBox.carrNo+'">????????????</textarea>';
		  html += " </div>";
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.carrNo ++
		  
		  }else{
		  alert("?????? ??????(?????? 3??? ?????? ??????)")
		  }
		});
        
        // ???????????? 4
		$("#addBtn4").on("click", function () {
		
		   if(noBox.eduNo<3){
		
		  html = "";
		  html += '<div class="input_box more" id="eduInput'+noBox.eduNo+'" no="'+noBox.eduNo+'" noName="eduNo">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="???">';
		  html += '<div class="data_container ">';
		  html += '<div class="detail">';
		  html += " ??????";
		  html += '<input type="text" name="schName" id="schName'+noBox.eduNo+'" value="-" placeholder="?????????">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ??????";
		  html += '<input type="text" name="sol" id="sol'+noBox.eduNo+'" value="-" placeholder="?????????">';
		  html += " ??????";
		  html += '<input type="text" name="major" id="major'+noBox.eduNo+'" value="-" placeholder="?????????">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ????????????";
		  html += '<input type="date" name="eduStDate" id="eduStDate'+noBox.eduNo+'" placeholder="?????? ???/???">~';
		  html += '<input type="date" name="eduEndDate" id="eduEndDate'+noBox.eduNo+'" placeholder="?????? ???/???">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ????????????";
		  html +=
		    '<textarea placeholder="????????????" spellcheck="false" name="eduCntt" id="eduCntt'+noBox.eduNo+'">????????????</textarea>';
		  html += " </div>";
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.eduNo ++
		  
		  }else{
		  alert("?????? ??????(?????? 3??? ?????? ??????)")
		  }
		});
        
        // ???????????? 5
		$("#addBtn5").on("click", function () {
		
		   if(noBox.ieduNo<3){
		
		  html = "";
		  html += '<div class="input_box more" id="ieduInput'+noBox.ieduNo+'" no="'+noBox.ieduNo+'" noName="ieduNo">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="???">';
		  html += '<div class="data_container ">';
		  html += '<div class="detail">';
		  html += "??????";
		  html += '<input type="text" name="ieduName" id="ieduName'+noBox.ieduNo+'" value="-" placeholder="?????????">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ????????????";
		  html += '<input type="text" name="coseName" id="coseName'+noBox.ieduNo+'" value="-" placeholder="???????????????">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ????????????";
		  html += '<input type="date" name="ieduStDate" id="stDate'+noBox.ieduNo+'" placeholder="?????? ???/???">~';
		  html += '<input type="date" name="ieduEndDate" id="EndDate'+noBox.ieduNo+'" placeholder="?????? ???/???">';
		  html += " </div>";
		  html += '<div class="detail">';
		  html += " ????????????";
		  html +=
		    '<textarea placeholder="????????????" spellcheck="false" name="ieduCntt" id="ieduCntt'+noBox.ieduNo+'" >????????????</textarea>';
		  html += " </div>";
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.ieduNo ++
		  
		  }else{
		  alert("?????? ??????(?????? 3??? ?????? ??????)")
		  }
		});
        
        // ??????????????? 6
		$("#addBtn6").on("click", function () {
		
		   if(noBox.sintroNo<3){
		   
		  html = "";
		  html += '<div class="input_box text_box" id="sintroInput'+noBox.sintroNo+'" no="'+noBox.sintroNo+'" noName="sintroNo">';
		  html += '<input type="text" name="sintroName" id="sintroName'+noBox.sintroNo+'" placeholder="??????????????? ?????? ??????">';
		  html += '<input type="button" class="minus_btn r" id="delBtn" value="???">';
		  html += '<div class="data_container">';
		  html +=
		    '<textarea placeholder="??????????????? ?????? ??????" spellcheck="false" name="sintroCntt" id="sintroCntt'+noBox.sintroNo+'">????????????</textarea>';
		  html += " </div>";
		  html += " </div>";
		  $(this).parent().prepend(html);
		  noBox.sintroNo ++
		  
		  }else{
		  alert("?????? ??????(?????? 3??? ?????? ??????)")
		  }
		});
        
        // ???????????? 7
	$("#addBtn7").on("click", function () {
	     
	        if(noBox.attchNo<3){
	        
	       html = "";
	       html += '<div class="input_box " id="attchInput'+noBox.attchNo+'" no="'+noBox.attchNo+'" noName="attchNo">';
	       html += '<input type="button" class="minus_btn" id="delBtn" value="???">';
	       html += '<div class="data_container file_container">';
	       html += '<div class="fileSNm" id="fileName' +noBox.attchNo+ '" name="attchName" id="attchName'+noBox.attchNo+'">?????????</div>';
	       html += '<input type="hidden" id="mFile'+noBox.attchNo+'" name="fileNm" value="">';
	       html += '<button type="button" id="fileBtn" target="' +noBox.attchNo+'">???????????????</button>';
	       html += " </div>";
	       html += " </div>";
	       $(this).parent().prepend(html);
	       noBox.attchNo ++
	       
	       }else{
	       alert("?????? ??????(?????? 3??? ?????? ??????)")
	       }
	     });   
	})
   
	function getRegion(city, target, val){
		console.log(city);
		console.log(target);
		console.log(val);
	   $.ajax({
	         type : "POST",
	         data : "cityNo=" + city,
	         url : "getRegionAjax",
	         dataType : "json",
	         success : function(res) {
	            if (res.result == "SUCCESS") {
	               regionOptionDraw(res.list ,target, val)
	            } else if (res.result == "FAILED") {
	               console.log(res.result)
	            }
	         },
	         error : function(request, status, error) {
	            console.log(error);
	         }
	      });
	}


	function regionOptionDraw(list, target, val){
	   var html= "" 
	      for(data of list){
	            html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
	      }
	   target.html(html);
	   
	   if(val != null) {
		   target.val(val);
	   }
	}

	function linkGo(url) {
	      location.href = url
	}
	   
	function linkBack() {
	      history.back()
	}
   	function checkInputText(){
   		let flag = true
   		$("input[type=text]").each(function(idx){
   			if($(this).val() == ""){
   				alert("???????????? ?????????????????????.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkInputDate(){
   		let flag = true
   		$("input[type=date]").each(function(idx){
   			if($(this).val() == ""){
   				alert("???????????? ?????????????????????.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkInputSel(){
   		let flag = true
 		$("input[type=select]").each(function(idx){
   			if($(this).val() < 0){
   				alert("???????????? ?????????????????????.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkInputTextarea(){
   		let flag = true
 		$("textarea").each(function(idx){
   			if($(this).val() < 0){
   				alert("???????????? ?????????????????????.")
   				$(this).focus()
   				flag = false
   				return false
   			}
   		})
   		return flag
   	}
   	function checkQualVal(){
   		let flag = true
   		let arr = new Array()
 		$("input[name=qualNo]").each(function(idx){
			arr.push($(this).val())
   		})
   		let set = new Set(arr)
			if(arr.length != set.size){
   				alert("???????????? ?????????????????????.")
   				flag = false
   				return false
   			}
   		return flag
   	}
</script>
</head>

<body>
<!-- ?????? ???  -->
	<!-- <form action="#" method="post" id="updateForm">
		<input type="hidden" name="cityArr" value="">
	
	</form> -->
<%@include file="/resources/jsp/header.jsp"%>
    <form action="#" id="resumeGo" method="post">
        <input type="hidden" id="memNo" name="memNo" value="${sMNo}">
        <input type="hidden" id="resumeNo" name="resumeNo" value="${DATA.RESUM_NO }">
        <input type="hidden" id="actGbn" name="actGbn">
    </form>

    <div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1></h1>
                </div>
                <form class="pop-user" id="schForm">
                    <input type="hidden" name="page" id="page" value="${page }">
                    <div class="pop-input">
                        <input type="button" class="sch-btn" id="schSectorBtn" value="??????">
                        <input type="button" class="sch-btn" id="schQualBtn" value="??????">
                        <input name="schDataName" id="schName" placeholder="?????????">
                    </div>
                </form>
                <!-- 5??? ????????? -->
                <div class="list_wrap">
                    <table>
                        <thead>
                            <tr>
                                <th class='td_no'>??????</th>
                                <th class='td_name'>??????</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" no="">
                        </tbody>
                    </table>
                </div>
                <div class="paging_wrap"></div>
                <hr>
            </div>
        </div>
    </div>


    <main>

        <div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('')">????????????</button>
			<button type="button" class="main_button" onclick="linkGo('resumeList')">???????????????</button>
			<button type="button" class="main_button" onclick="linkGo('recepReq')">????????????</button>
			<button type="button" class="main_button" onclick="linkGo('empsugget')">????????????</button>
        </div>
        <div class="main_info">

            <div id="main_apply" class="main_content">
                <div class="vertical_menu">
                    <table id="resumeList">
                        <c:forEach var="data" items="${LIST }">
                            <tr>
                                <td>
                                    <div resumeNo="${data.RESUM_NO }">
                                        <a href="#">${data.RESUM_NAME }</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${CNT < 5  }">
                            <tr>
                                <td>
                                    <div class="apply_list">
                                        <a href="resumeDtlAdd" id="addBtn"> ?????? </a>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
          
                <div class="main_box">
                  <form action="#" method="post" id="updateForm">
                  <input type="hidden" name="dtlGbn" value="update"> 
                  <input type="hidden" name="memNo" value="${sMNo }"> 
                  <input type="hidden" id="resumeUpdateNo" name="resumeUpdateNo" value="${param.resumeNo }" >
                    <div class="content apply_dtl_header" id="resumeName">
                        <div class="apply_dtl">
                             <input type="text" id="resumeName" name="resumeName" value="${DATA.RESUM_NAME }" ><br>
                            <span class="apply_dtl_date">??????????????? | ${DATA.CHN_DATE}</span>
                            <span class="apply_dtl_opn">
                                <select id="opencase" name="openCase" class="opencase" selValue="${DATA.OPN_CHK}">
                                    <option value="1">??????</option>
                                    <option value="0">?????????</option>
                                </select>
                            </span>
                        </div>
                        <div class="apply_btn">
                            <button type="button" id="saveBtn">??????</button>
                            <button type="button" id="cancelBtn" onclick="linkBack()">??????</button>
                        </div>
                    </div>
        
                        <!-- form ?????? -->
                        <div class="content apply_dtl_user" id="resumeUser">
                            <div class="dtl">
                                <div class="header">???????????????</div>
                                <div class="con">
                                    <div class="profile" id="profile"></div>
                                    <div class="input_box">
                                        <div class="name">
                                            <div class="text">??????</div>
                                            <div class="input">${DATA.NAME}</div>
                                        </div>
                                        <div class="gender">
                                            <div class="text">??????</div>
                                            <div class="input">${DATA.GENDER_NAME}</div>
                                        </div>
                                        <div class="birth">
                                            <div class="text">????????????</div>
                                            <div class="input">${DATA.BIRTH}</div>
                                        </div>
                                        <div class="phone">
                                            <div class="text">?????????</div>
                                            <div class="input">${DATA.PHONE}</div>
                                        </div>
                                        <div class="email">
                                            <div class="text">?????????</div>
                                            <div class="input">${DATA.EMAIL}</div>
                                        </div>
                                        <div class="location">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                                <div class="locSelectBox">
                                                    <select class="citySel" id="city0" name="city" locResumNo="0" selValue="${DATA.CITY_NO }">
                                                        <option value="-1" selected="selected">?????? ??????</option>
                                                        <option value="16">??????</option>
                                                        <option value="0">??????</option>
                                                        <option value="1">??????</option>
                                                        <option value="2">??????</option>
                                                        <option value="3">??????</option>
                                                        <option value="4">??????</option>
                                                        <option value="5">??????</option>
                                                        <option value="6">??????</option>
                                                        <option value="7">??????</option>
                                                        <option value="8">??????</option>
                                                        <option value="9">??????</option>
                                                        <option value="10">??????</option>
                                                        <option value="11">??????</option>
                                                        <option value="12">??????</option>
                                                        <option value="13">??????</option>
                                                        <option value="14">??????</option>
                                                        <option value="15">??????</option>
                                                    </select>
                                                    <select id="region0" name="region" selValue="${DATA.REGION_NO }">

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="edu">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                                <select name="gradu" id="gradu" selValue="${DATA.GRADU}" >
                                                    <option value="-1">?????? ??????</option>
                                                    <option value="1">????????????</option>
                                                    <option value="2">????????????</option>
                                                    <option value="3">?????????</option>
                                                    <option value="4">??????</option>
                                                    <option value="5">??????</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="carr">
                                            <div class="text">??????</div>
                                            <div class="input">
                                                <input type="radio" name="carr" value="1" id="carr0">
                                                <label for="carr0">??????</label>
                                                <input type="radio" name="carr" value="2" id="carr1">
                                                <label for="carr1">??????</label>
                                        		 <c:choose>
                                                	<c:when test="${DATA.CARR eq 1}">
                                                		<input type="text" name="carrPer" placeholder="??????" value="${DATA.CARR_PER}" id="carrPer" class="radioInput" readonly="readonly">???
                                                	</c:when>
                                                	<c:when test="${DATA.CARR eq 2}">
                                                		<input type="text" name="carrPer" placeholder="??????" value="${DATA.CARR_PER}" id="carrPer" class="radioInput">???
                                                	</c:when>                            	
                                                </c:choose>         
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- form ?????? -->
                        <div class="content apply_dtl_hope" id="resumeHope">
                            <div class="dtl">
                                <div class="header">??????????????????</div>
                                <div class="con">
                                    <div class="input_box">
                                        <div class="job">
                                            <div class="text">????????????</div>
                                            <input type="hidden" name="sectorNo" id="sectorNo" value="${DATA.SECTOR_NO}">
                                            <div class="input" id="sectorInput" sNo="${DATA.SECTOR_NO}">${DATA.SECTOR_NAME}</div>
                                            <button type="button" id="sectorBtn" btn="s">?????? ??????</button>
                                        </div>
                                        <div class="hope_loc">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                            <c:set var="locNo" value="1"/>
                                            	<c:forEach var="data" items="${LOC }">
	                                                <div class="locSelectBox">
	                                                    <select class="citySel" id="city${locNo }" name="city" selValue="${data.CITY_NO}">
	                                                        <option value="-1">?????? ??????</option>
	                                                        <option value="16">??????</option>
	                                                        <option value="0">??????</option>
	                                                        <option value="1">??????</option>
	                                                        <option value="2">??????</option>
	                                                        <option value="3">??????</option>
	                                                        <option value="4">??????</option>
	                                                        <option value="5">??????</option>
	                                                        <option value="6">??????</option>
	                                                        <option value="7">??????</option>
	                                                        <option value="8">??????</option>
	                                                        <option value="9">??????</option>
	                                                        <option value="10">??????</option>
	                                                        <option value="11">??????</option>
	                                                        <option value="12">??????</option>
	                                                        <option value="13">??????</option>
	                                                        <option value="14">??????</option>
	                                                        <option value="15">??????</option>
	                                                    </select>
	                                                    <select id="region${locNo }" name="region" selValue="${data.REGION_NO }">
	
	                                                    </select>
	                                                    <c:set var="locNo" value="${locNo + 1 }"></c:set>
	                                                </div>
                                                </c:forEach>
                                                <c:forEach var="i" step="1" begin="${locNo }" end="3">
                                                    <div class="locSelectBox">
                                               			<select class="citySel" id="city${locNo }" name="city" selValue="16">
	                                                        <option value="-1">?????? ??????</option>
	                                                        <option value="16">??????</option>
	                                                        <option value="0">??????</option>
	                                                        <option value="1">??????</option>
	                                                        <option value="2">??????</option>
	                                                        <option value="3">??????</option>
	                                                        <option value="4">??????</option>
	                                                        <option value="5">??????</option>
	                                                        <option value="6">??????</option>
	                                                        <option value="7">??????</option>
	                                                        <option value="8">??????</option>
	                                                        <option value="9">??????</option>
	                                                        <option value="10">??????</option>
	                                                        <option value="11">??????</option>
	                                                        <option value="12">??????</option>
	                                                        <option value="13">??????</option>
	                                                        <option value="14">??????</option>
	                                                        <option value="15">??????</option>
	                                                    </select>
	                                                    <select id="region${locNo }" name="region" selValue="16">
	
	                                                    </select>
	                                                    <c:set var="locNo" value="${locNo + 1 }"></c:set>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="work_format">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                                <c:set var="workTypeCnt" value="0" />
                                                <c:forEach var="data" items="${WORK}">
                                                    <label for="workType${ workTypeCnt}">${data.WORK_TYPE_NAME }</label>
                                                    <c:choose>
                                                        <c:when test="${!empty data.WORK_TYPE}">
                                                            <input type="checkbox" name="workType" id="workType${workTypeCnt }" value="${ data.SCD_CAT}" checked="checked">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="checkbox" name="workType" id="workType${workTypeCnt }" value="${ data.SCD_CAT}">
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:set var="workTypeCnt" value="${workTypeCnt + 1 }"></c:set>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="sal">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                                <input type="radio" name="sal" value="0" id="sal0">
                                                <label for="sal0">??????</label>
                                                <input type="radio" name="sal" value="1" id="sal1">
                                                <label for="sal1">??????</label>
                                               <c:choose>
                                                	<c:when test="${DATA.PAY_GBN eq 0}">
                                                		<input placeholder="????????????" name="salMin" class="radioInput salinput"
		                                                    value="${DATA.PAY_MIN}" id="minSal" readonly="readonly">?????? ~
		                                                <input placeholder="????????????" name="salMax" class="radioInput salinput"
		                                                    value="${DATA.PAY_MAX}" id="maxSal" readonly="readonly">??????	
                                                	</c:when>
                                                	<c:when test="${DATA.PAY_GBN eq 1}">
                                                		<input type="text" placeholder="????????????" name="salMin" class="radioInput salinput"
		                                                    value="${DATA.PAY_MIN}" id="minSal" >?????? ~
		                                                <input type="text" placeholder="????????????" name="salMax" class="radioInput salinput"
		                                                    value="${DATA.PAY_MAX}" id="maxSal" >??????	
                                                	</c:when>                            	
                                                </c:choose>                                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_lisence" id="resumeLisence">
                            <div class="dtl">
                                <div class="header">?????????</div>
                                <div class="con add_box">
                                    <c:if test="${!empty QUAL }">
                                        <c:set var="qualCnt" value="0" />
                                        <c:forEach var="data" items="${QUAL }">
                                            <div class="input_box" id="qualInput${qualCnt }" no="${qualCnt }" noName="qualNo">
                                                <input type="button" class="minus_btn" id="delBtn" value="???">
                                                <div class="data_container">
                                                 	<input type="hidden" name="qualNo" value="${data.QUAL_NO }" >
                                                    <input type="text" name="qualName" value="${data.QUAL_NAME }" readonly="readonly">
                                                    <input type="text" name="issuAgcy" value="${data.ISSU_AGCY }">
                                                    <input type="date" name="passDate" value="${data.PASS_DATE }">
                                                </div>
                                            </div>
                                            <c:set var="qualCnt" value="${qualCnt + 1 }" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn1" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_forei" id="resumeForeign">
                            <div class="dtl">
                                <div class="header">???????????????</div>
                                <div class="con add_box flang">
                                    <c:if test="${!empty FLANG }">
                                        <c:set var="flangCnt" value="0" />
                                        <c:forEach var="data" items="${FLANG }">
                                            <div class="input_box" id="flangInput${flangCnt }" no="${flangCnt }" noName="flangNo">
                                                <input type="button" class="minus_btn" id="delBtn" value="???">
                                                <div class="data_container">
                                              	    <input type="hidden" name="flangNo" value="${data.FLANG_NO }">
                                                    <input type="text" name="flangName" value="${data.FLANG_NAME }">
                                                    <input type="text" name="flangType" value="${data.FLANG_TYPE }">
                                                    <input type="text" name="flangGrade" value="${data.FLANG_GRADE }">
                                                </div>
                                            </div>
                                            <c:set var="flangCnt" value="${ flangCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn2" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_history" id="resumeHistory">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box">
                                    <c:if test="${!empty CARR }">
                                        <c:set var="carrCnt" value="0" />
                                        <c:forEach var="data" items="${CARR }">
                                            <div class="input_box more" id="carrInput${carrCnt }" no="${carrCnt }" noName="carrNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="???">
                                                <div class="data_container ">
                                                    <div class="detail">
                                                        ?????? <input type="text" name="cName" value="${data.C_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        ?????? <input type="text" name="dpart" value="${data.DPART }"> 
                                                        ?????? <input type="text" name="pos" value="${data.POS }">
                                                    </div>
                                                    <div class="detail">
                                                        ???????????? <input type="date" name="carrStDate" value="${data.ST_DATE }">
                                                        ~ <input type="date" name="carrEndDate" value="${data.END_DATE }">
                                                        ???????????? 
                                                        <select name="tureChk" value="${data.TURE_CHK }" selValue="${data.TURE_CHK }" >
                                                        	<option value="??????">??????</option>
                                                        	<option value="??????">??????</option>
                                                        </select>
                                                    </div>
                                                    <div class="detail">
                                                        ????????????
                                                        <textarea name="carrCntt" spellcheck="false">${data.CARR_CNTT }</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="carrCnt" value="${ carrCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn3" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_Edu" id="resumeEdu">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box">
                                    <c:if test="${!empty EDU }">
                                        <c:set var="eduCnt" value="0" />
                                        <c:forEach var="data" items="${EDU }">
                                            <div class="input_box more" id="eduInput${eduCnt }" no="${eduCnt }" noName="eduNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="???">
                                                <div class="data_container ">
                                                    <div class="detail">
                                                        ?????? <input type="text" name="schName" value="${data.SCH_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        ?????? <input type="text" name="sol" value="${data.SOL }">
                                                        ?????? <input type="text" name="major" value="${data.MAJOR }">
                                                    </div>
                                                    <div class="detail">
                                                        ???????????? <input type="date" name="eduStDate" value="${data.ST_DATE }">
                                                        ~ <input type="date" name="eduEndDate" value="${data.END_DATE }">
                                                    </div>
                                                    <div class="detail">
                                                        ????????????
                                                        <textarea name="eduCntt" spellcheck="false">${data.EDU_ETC }</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="eduCnt" value="${ eduCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn4" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_job_edu" id="resumeJobEdu">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box ">
                                    <c:if test="${!empty IEDU }">
                                        <c:set var="ieduCnt" value="0" />
                                        <c:forEach var="data" items="${IEDU }">
                                            <div class="input_box more" id="ieduInput${ieduCnt }" no="${ieduCnt }" noName="ieduNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="???">
                                                <div class="data_container ">
                                                    <div class="detail">
                                                        ?????? <input type="text" name="ieduName" value="${data.IEDU_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        ???????????? <input type="text" name="coseName" value="${data.COSE_NAME }">
                                                    </div>
                                                    <div class="detail">
                                                        ???????????? <input type="date" name="ieduStDate" value="${data.ST_DATE }">
                                                        ~ <input type="date" name="ieduEndDate" value="${data.END_DATE }">
                                                    </div>
                                                    <div class="detail">
                                                        ????????????
                                                        <textarea name="ieduCntt" spellcheck="false">${data.EDU_CNTT }</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="ieduCnt" value="${ ieduCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn5" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_intro" id="resumeIntro">
                            <div class="dtl">
                                <div class="header">???????????????</div>
                                <div class="con add_box">
                                    <c:if test="${!empty SINTRO }">
                                        <c:set var="sintroCnt" value="0" />
                                        <c:forEach var="data" items="${SINTRO }">
                                            <div class="input_box more text_box" id="sintroInput${sintroCnt }" no="${sintroCnt }" noName="sintroNo">
                                                <input type="button" class="minus_btn r" id="delBtn" value="???">
                                                <input type="text" name="sintroName" value="${data.SINTRO_NAME }">
                                                <div class="data_container">
                                                    <textarea name="sintroCntt" spellcheck="false">${data.SINTRO_CNTT }</textarea>
                                                </div>
                                            </div>
                                            <c:set var="sintroCnt" value="${ sintroCnt + 1}" />
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn6" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_attch" id="resumeAttach">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box" id="fileBox">
                                    <c:if test="${!empty ATTACH }">
                                        <c:set var="attchCnt" value="0" />
                                        <c:forEach var="data" items="${ATTACH }">
                                            <div class="input_box " id="attchInput${attchCnt }" no="${attchCnt }" noName="attchNo">
                                                <input type="button" class="minus_btn" id="delBtn" value="???">
                                                <div class="data_container file_container">
                                                	<input type="hidden" id="mFile${ attchCnt}" name="fileNm" value="${data.ATTCH_NAME }">
                                                    <div class="fileSNm" id="fileName${attchCnt }">
                                                        ${data.ATTCH_NAME }
                                                    </div>
                                                    <button type="button" id="fileBtn" target="${ attchCnt }">???????????????</button>
                                                    <c:set var="attchCnt" value="${ attchCnt + 1}" />
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <input type="button" class="plus_btn" id="addBtn7" value="???">
                                </div>
                            </div>
                        </div>
                    </form>
                    
     <form action="fileUploadAjax" id="fileForm" method="post" enctype="multi/form-data">
        <input type="file" accept="image/*" name="att" id="att" target="">
    </form>
                </div>
            </div>

        </div>
        <div class="float_right_nav_wrap" id="floatRightNavWrap">
            <div class="float_right_nav">
                <div>
                    <a href="#resumeName">???????????????</a>
                </div>
                <div>
                    <a href="#resumeUser">???????????????</a>
                </div>
                <div>
                    <a href="#resumeHope">??????????????????</a>
                </div>
                <div>
                    <a href="#resumeLisence">?????????</a>
                </div>
                <div>
                    <a href="#resumeForei">???????????????</a>
                </div>
                <div>
                    <a href="#resumeHistory">????????????</a>
                </div>
                <div>
                    <a href="#resumeEdu">????????????</a>
                </div>
                <div>
                    <a href="#resumeJobEdu">????????????</a>
                </div>
                <div>
                    <a href="#resumeIntro">???????????????</a>
                </div>
                <div>
                    <a href="#resumeAttach">????????????</a>
                </div>
            </div>
        </div>

    </main>
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>