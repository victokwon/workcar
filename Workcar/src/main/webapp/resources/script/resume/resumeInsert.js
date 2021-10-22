$(function () {
  $(".apply_content").on("click", ".apply_update_btn", function () {
    // hidden form에 이력서 정보 전달 및 ajax 전달밀 이력서 세부 내용 가져와 화면 재구성
    $("#resumeNO").val($(this).parent().parent().attr("resumeNO"));

   
  });

  $(".add_box").on("click", ".minus_btn", function () {
    $(this).parent().remove();
  });
  
 // 자격증 1
  $("#addBtn1").on("click", function () {
    let html = "";
    html += '<div class="input_box ">';
    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
    html += '<div class="data_container">';
    html +=
      '<input type="button" class="" id="lisenceSchBtn" value="자격증 검색">';
    html += '<input type="text" value="데이터 / 자격증명" readonly>';
    html += '<input type="text" value="데이터 / 발급처" readonly>';
    html += '<input type="text" placeholder="발급일">';
    html += '<input type="text" placeholder="기타사항">';
    html += " </div>";
    html += " </div>";

    $(this).parent().prepend(html);
  });
  
  // 외국어 2
  $("#addBtn2").on("click", function () {
    html = "";
    html += '<div class="input_box">';
    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
    html += '<div class="data_container">';
    html += '<select name="flangNo" id="flangNo">';

    html += '<option value="-1">언어 선택</option>';
    html += '<option value="0">그리스어</option>';
    html += '<option value="0">네덜란드어</option>';
    html += '<option value="0">노르웨이어</option>';
    html += '<option value="0">덴마크어</option>';
    html += '<option value="0">독일어</option>';
    html += '<option value="0">라트비아어</option>';
    html += '<option value="0">루마니아어</option>';
    html += '<option value="0">리투아니아어</option>';
    html += '<option value="0">불가리아어</option>';
    html += '<option value="0">세르비아어</option>';
    html += '<option value="0">스웨덴어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';
    html += '<option value="0">영어</option>';

    html += "</select>";
    html += '<label for="flangType">타입</label>';
    html += '<select name="flangType" id="flangType">';
    html += '<option value="-1">타입 선택</option>';
    html += '<option value="0">읽기/쓰기</option>';
    html += '<option value="1">회화</option>';
    html += " </select>";
    html += '<label for="flangGrade">수준</label>';
    html += '<select name="flangGrade" id="flangGrade">';
    html += '<option value="-1">수준 선택</option>';
    html += '<option value="0">상</option>';
    html += '<option value="1">중</option>';
    html += '<option value="2">하</option>';
    html += " </select>";
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
  });
  
  // 경력사항 3
  $("#addBtn3").on("click", function () {
    html = "";
    html += '<div class="input_box more">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container ">';
    html += '<div class="detail">';
    html += " 기업";
    html += '<input type="text" placeholder="기업명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 부서";
    html += '<input type="text" placeholder="부서명">';
    html += " 직책";
    html += '<input type="text" placeholder="직책명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 재직기간";
    html += '<input type="text" placeholder="시작 년/월">~';
    html += '<input type="text" placeholder="종료 년/월">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 직무내용";
    html +=
      '<textarea name="" placeholder="직무내용" spellcheck="false"></textarea>';
    html += " </div>";
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
  });
  // 학력사항 4
  $("#addBtn4").on("click", function () {
    html = "";
    html += '<div class="input_box more">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container ">';
    html += '<div class="detail">';
    html += " 학교";
    html += '<input type="text" placeholder="학교명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 학부";
    html += '<input type="text" placeholder="학부명">';
    html += " 학과";
    html += '<input type="text" placeholder="학과명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 재학기간";
    html += '<input type="text" placeholder="시작 년/월">~';
    html += '<input type="text" placeholder="종료 년/월">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 특이사항";
    html +=
      '<textarea name="" placeholder="특이사항" spellcheck="false">없음</textarea>';
    html += " </div>";
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
  });
  // 직무교육 5
  $("#addBtn5").on("click", function () {
    html = "";
    html += '<div class="input_box more">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container ">';
    html += '<div class="detail">';
    html += "기관";
    html += '<input type="text" placeholder="기관명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 훈련과정";
    html += '<input type="text" placeholder="훈련과정명">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 교육기관";
    html += '<input type="text" placeholder="시작 년/월">~';
    html += '<input type="text" placeholder="종료 년/월">';
    html += " </div>";
    html += '<div class="detail">';
    html += " 교육내용";
    html +=
      '<textarea name="" placeholder="교육내용" spellcheck="false"></textarea>';
    html += " </div>";
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
  });
  // 자기소개서 6
  $("#addBtn6").on("click", function () {
    html = "";
    html += '<div class="input_box text_box">';
    html += '<input type="text" placeholder="자기소개서 제목 입력">';
    html += '<input type="button" class="minus_btn r" id="delBtn" value="－">';
    html += '<div class="data_container">';
    html +=
      '<textarea name="" placeholder="자기소개서 내용 입력" spellcheck="false"></textarea>';
    html += " </div>";
    html += " </div>";
    $(this).parent().prepend(html);
  });
  // 첨부파일 7
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
