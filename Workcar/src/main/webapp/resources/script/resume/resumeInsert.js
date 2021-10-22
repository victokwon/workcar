$(function () {
	
  $(".apply_content").on("click", ".apply_update_btn", function () {
    // hidden form에 이력서 정보 전달 및 ajax 전달밀 이력서 세부 내용 가져와 화면 재구성
    $("#resumeNO").val($(this).parent().parent().attr("resumeNO"));
     });

  $(".add_box").on("click", ".minus_btn", function () {
  	let target = $(this).parent().attr("noName")
  	noBox[target] --
    $(this).parent().remove();
  });
  
  
  
 // 자격증 1
  $("#addBtn1").on("click", function () {
  
  	if(noBox.qualNo<3){
  	
    let html = "";
    html += '<div class="input_box " id="qualInput['+noBox.qualNo+']" no="'+noBox.qualNo+'" noName="qualNo">';
    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
    html += '<div class="data_container">';
    html +=
      '<input type="button" class="" id="lisenceSchBtn" value="자격증 검색">';
    html += '<input class="qual_input" name="qualNo['+noBox.qualNo+']" id="qualNo['+noBox.qualNo+']" type="text" value="데이터 / 자격증명" readonly>';
    html += '<input class="qual_input" name="issuAgcy['+noBox.qualNo+']" id="issuAgcy['+noBox.qualNo+']" type="text" placeholder="발급처">';
    html += '<input class="qual_input" name="passDate['+noBox.qualNo+']" id="passDate['+noBox.qualNo+']" type="text" placeholder="발급일">';
    html += " </div>";
    html += " </div>";

    $(this).parent().prepend(html);
    noBox.qualNo += 1
    
    }else{
    alert("3개 이상 등록이 불가능합니다.")
    }
  });
  
  // 외국어 2
  $("#addBtn2").on("click", function () {
  
  	if(noBox.flangNo<3){
  
    html = "";
    html += '<div class="input_box" id="flangInput['+noBox.flangNo+']" no="'+noBox.flangNo+'" noName="flangNo">';
    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
    html += '<div class="data_container">';
    html += '<select name="flangNo['+noBox.flangNo+']" id="flangNo">';

    html += '<option value="-1">언어 선택</option>';
    html += '<option value="0">독일어</option>';
    html += '<option value="1">란다어</option>';
    html += '<option value="2">러시아어</option>';
    html += '<option value="3">마라티어</option>';
    html += '<option value="4">베트남어</option>';
    html += '<option value="5">벵골어</option>';
    html += '<option value="6">스페인어</option>';
    html += '<option value="7">아랍어</option>';
    html += '<option value="8">영어</option>';
    html += '<option value="9">우르두어</option>';
    html += '<option value="10">일본어</option>';
    html += '<option value="11">자바어</option>';
    html += '<option value="12">중국어</option>';
    html += '<option value="13">타밀어</option>';
    html += '<option value="14">터키어</option>';
    html += '<option value="15">텔루구어</option>';
    html += '<option value="16">포르투갈어</option>';
    html += '<option value="17">프랑스어</option>';
    html += '<option value="18">힌디어</option>';

    html += "</select>";
    html += '<label for="flangType">타입</label>';
    html += '<select name="flangType[' + noBox.flangNo + ']" id="flangType['+noBox.flangNo+']">';
    html += '<option value="-1">타입 선택</option>';
    html += '<option value="읽기/쓰기">읽기/쓰기</option>';
    html += '<option value="회화">회화</option>';
    html += " </select>";
    html += '<label for="flangGrade">수준</label>';
    html += '<select name="flangGrade['+noBox.flangNo+']" id="flangGrade['+noBox.flangNo+']">';
    html += '<option value="-1">수준 선택</option>';
    html += '<option value="상">상</option>';
    html += '<option value="중">중</option>';
    html += '<option value="하">하</option>';
    html += " </select>";
    html += " </div>";
    html += " </div>";
    
    $(this).parent().prepend(html);
    noBox.flangNo += 1;
    
    }else{
    alert("3개 이상 등록이 불가능합니다.")
    }
  });
  
  // 경력사항 3
  $("#addBtn3").on("click", function () {
  
  	if(noBox.carrNo<3){
  
    html = "";
    html += '<div class="input_box more" id="carrInput['+noBox.carrNo+']" no="'+noBox.carrNo+'" noName="carrNo">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container ">';
    html += '<div class="detail">';
    html += " 기업";
    html += '<input type="text" name="cName['+noBox.carrNo+']" id="cName['+noBox.carrNo+']" placeholder="기업명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 부서";
    html += '<input type="text" name="dpart['+noBox.carrNo+']" id="dpart['+noBox.carrNo+']" placeholder="부서명">';
    html += " 직책";
    html += '<input type="text" name="pos['+noBox.carrNo+']" id="pos['+noBox.carrNo+']" placeholder="직책명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 재직기간";
    html += '<input type="text" name="stDate['+noBox.carrNo+']" id="stDate['+noBox.carrNo+']" placeholder="시작 년/월">~';
    html += '<input type="text" name="endData['+noBox.carrNo+']" id="endData['+noBox.carrNo+']" placeholder="종료 년/월">';
    html += " 재직기간";
    html += '<input type="checkbox" name="tureChk['+noBox.carrNo+']" id="tureChk['+noBox.carrNo+']" placeholder="종료 년/월" value="재직">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 직무내용";
    html +=
      '<textarea name="" placeholder="직무내용" spellcheck="false" name="carrCntt['+noBox.carrNo+']" id="carrCntt['+noBox.carrNo+']"></textarea>';
    html += " </div>";
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
    noBox.carrNo ++
    
    }else{
    alert("3개 이상 등록이 불가능합니다.")
    }
  });
  
  // 학력사항 4
  $("#addBtn4").on("click", function () {
  
  	if(noBox.eduNo<3){
  
    html = "";
    html += '<div class="input_box more" id="eduInput['+noBox.eduNo+']" no="'+noBox.eduNo+'" noName="eduNo">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container ">';
    html += '<div class="detail">';
    html += " 학교";
    html += '<input type="text" name="schName['+noBox.eduNo+']" id="schName['+noBox.eduNo+']" placeholder="학교명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 학부";
    html += '<input type="text" name="sol['+noBox.eduNo+']" id="sol['+noBox.eduNo+']" placeholder="학부명">';
    html += " 학과";
    html += '<input type="text" name="major['+noBox.eduNo+']" id="major['+noBox.eduNo+']" placeholder="전공명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 재학기간";
    html += '<input type="text" name="stDate['+noBox.eduNo+']" id="eduStDate['+noBox.eduNo+']" placeholder="시작 년/월">~';
    html += '<input type="text" name="endData['+noBox.eduNo+']" id="eduEndDate['+noBox.eduNo+']" placeholder="종료 년/월">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 특이사항";
    html +=
      '<textarea name="" placeholder="특이사항" spellcheck="false" name="eduCntt['+noBox.eduNo+']" id="eduCntt['+noBox.eduNo+']">없음</textarea>';
    html += " </div>";
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
    noBox.eduNo ++
    
    }else{
    alert("3개 이상 등록이 불가능합니다.")
    }
  });
  
  // 직무교육 5
  $("#addBtn5").on("click", function () {
  
  	if(noBox.ieduNo<3){
  
    html = "";
    html += '<div class="input_box more" id="ieduInput['+noBox.ieduNo+']" no="'+noBox.ieduNo+'" noName="ieduNo">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container ">';
    html += '<div class="detail">';
    html += "기관";
    html += '<input type="text" name="ieduName['+noBox.ieduNo+']" id="ieduName['+noBox.ieduNo+']" placeholder="기관명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 훈련과정";
    html += '<input type="text" name="coseName['+noBox.ieduNo+']" id="coseName['+noBox.ieduNo+']" placeholder="훈련과정명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 교육기관";
    html += '<input type="text" name="stDate['+noBox.ieduNo+']" id="stDate['+noBox.ieduNo+']" placeholder="시작 년/월">~';
    html += '<input type="text" name="endData['+noBox.ieduNo+']" id="endData['+noBox.ieduNo+']" placeholder="종료 년/월">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 교육내용";
    html +=
      '<textarea name="" placeholder="교육내용" spellcheck="false" name="ieduCntt['+noBox.ieduNo+']" id="ieduCntt['+noBox.ieduNo+']"></textarea>';
    html += " </div>";
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
    noBox.ieduNo ++
    
    }else{
    alert("3개 이상 등록이 불가능합니다.")
    }
  });
  
  // 자기소개서 6
  $("#addBtn6").on("click", function () {
  
  	if(noBox.sintroNo<3){
  	
    html = "";
    html += '<div class="input_box text_box" id="sintroInput['+noBox.sintroNo+']" no="'+noBox.sintroNo+'" noName="sintroNo">';
    html += '<input type="text" name="sintroName['+noBox.sintroNo+']" id="sintroName['+noBox.sintroNo+']" placeholder="자기소개서 제목 입력">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container">';
    html +=
      '<textarea name="" placeholder="자기소개서 내용 입력" spellcheck="false" name="sintroCntt['+noBox.sintroNo+']" id="sintroCntt['+noBox.sintroNo+']"></textarea>';
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
    noBox.sintroNo ++
    
    }else{
    alert("3개 이상 등록이 불가능합니다.")
    }
  });
  
  // 첨부파일 7
  $("#addBtn7").on("click", function () {
  
  	if(noBox.attchNo<3){
  	
    html = "";
    html += '<div class="input_box " id="attchInput['+noBox.attchNo+']" no="'+noBox.attchNo+'" noName="attchNo">';
    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
    html += '<div class="data_container file_container">';
    html += '<div id="fileSNm" name="attchName['+noBox.attchNo+']" id="attchName['+noBox.attchNo+']">파일명</div>';
    html += '<input type="hidden" id="fileLNm">';
    html += '<button type="button">파일업로드</button>';
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
    noBox.attchNo ++
    
    }else{
    alert("3개 이상 등록이 불가능합니다.")
    }
  });
});



	