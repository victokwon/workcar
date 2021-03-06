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
	          qualNo: 0,
	          flangNo: 0,
	          carrNo: 0,
	          eduNo: 0,
	          ieduNo: 0,
	          sintroNo: 0,
	          attchNo: 0
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
	    
	    
	    $("#saveBtn").on("click",function(){
	    	console.log($("#sal0").is(":checked"))
			if($("#sal0").is(":checked")){
				$("#salMin").val("0")
				$("#salMax").val("0")
			}
	    	console.log($("#carr0").is(":checked"))
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
   	function checkHidden(){
   		let flag = true
   			if($("#sectorInput").attr("sNo") < 0 ){
   				alert("???????????? ?????????????????????.")
   				$(this).focus()
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
        <input type="hidden" id="resumeNo" name="resumeNo" value="">
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
                                        <a href="resumeDtl" id="addBtn"> ?????? </a>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
          
                <div class="main_box">
                  <form action="#" method="post" id="updateForm">
                  <input type="hidden" name="dtlGbn" value="add"> 
                  <input type="hidden" name="memNo" value="${sMNo }"> 
                    <div class="content apply_dtl_header" id="resumeName">
                        <div class="apply_dtl">
                             <input type="text" id="resumeName" name="resumeName" value="" >
                            <span class="apply_dtl_opn">
                                <select id="opencase" name="openCase" class="opencase" >
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
                                    <div class="profile"></div>
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
                                                    <select class="citySel" id="city0" name="city" >
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
                                                    <select id="region0" name="region" >
                                                        <option value="16">??????</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="edu">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                                <select name="gradu" id="gradu"  >
                                                    <option value="">?????? ??????</option>
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
                                                <input type="radio" name="carr" value="1" id="carr0" checked="checked">
                                                <label for="carr0">??????</label>
                                                <input type="radio" name="carr" value="2" id="carr1">
                                                <label for="carr1">??????</label>
                                             	<input type="text" name="carrPer" value="" placeholder="??????" id="carrPer" class="radioInput" readonly="readonly">???
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
                                            <input type="hidden" name="sectorNo" id="sectorNo" value="">
                                            <div class="input" id="sectorInput" sNo=""></div>
                                            <button type="button" id="sectorBtn" btn="s">?????? ??????</button>
                                        </div>
                                        <div class="hope_loc">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                            <c:set var="locNo" value="1"/>
                                            	<c:forEach var="i" begin="1" step="1" end="3"  >
	                                                <div class="locSelectBox">
	                                                    <select class="citySel" id="city${locNo }" name="city" >
	                                                        <option value="16" >??????</option>
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
	                                                    <select id="region${locNo }" name="region" >
															<option value="16">??????</option>	
	                                                    </select>
	                                                    <c:set var="locNo" value="${locNo + 1 }"></c:set>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="work_format">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                               <label for="workType0">??????</label>
                                               <input type="checkbox" name="workType" id="workType0" value="0" checked="checked">
                                               <label for="workType1">?????????</label>
                                               <input type="checkbox" name="workType" id="workType1" value="1">
                                               <label for="workType2">?????????</label>
                                               <input type="checkbox" name="workType" id="workType2" value="2">
                                               <label for="workType3">?????????</label>
                                               <input type="checkbox" name="workType" id="workType3" value="3">
                                               <label for="workType4">??????</label>
                                               <input type="checkbox" name="workType" id="workType4" value="4">
                                            </div>
                                        </div>
                                        <div class="sal">
                                            <div class="text">????????????</div>
                                            <div class="input">
                                                <input type="radio" name="sal" value="0" id="sal0" checked="checked">
                                                <label for="sal0">??????</label>
                                                <input type="radio" name="sal" value="1" id="sal1">
                                                <label for="sal1">??????</label>
                                          		<input type="text" placeholder="????????????" name="salMin"  class="radioInput salinput"
                                                    value="" id="salMin" readonly="readonly">?????? ~
                                                <input type="text" placeholder="????????????" name="salMax" class="radioInput salinput"
                                                    value="" id="salMax" readonly="readonly">??????	
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
                                    <input type="button" class="plus_btn" id="addBtn1" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_forei" id="resumeForeign">
                            <div class="dtl">
                                <div class="header">???????????????</div>
                                <div class="con add_box flang">
                                    <input type="button" class="plus_btn" id="addBtn2" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_history" id="resumeHistory">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box">
                                    <input type="button" class="plus_btn" id="addBtn3" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_Edu" id="resumeEdu">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box">
                                    <input type="button" class="plus_btn" id="addBtn4" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_job_edu" id="resumeJobEdu">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box ">
                                    <input type="button" class="plus_btn" id="addBtn5" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_intro" id="resumeIntro">
                            <div class="dtl">
                                <div class="header">???????????????</div>
                                <div class="con add_box">
                                    <input type="button" class="plus_btn" id="addBtn6" value="???">
                                </div>
                            </div>
                        </div>

                        <div class="content apply_dtl_attch" id="resumeAttach">
                            <div class="dtl">
                                <div class="header">????????????</div>
                                <div class="con add_box" id="fileBox">
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