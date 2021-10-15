$(function () {
  $("#schBtn").on("click", function () {
    companySch();
  });
  $("#cSch").on("click", function () {
    $(".pop-container").show();
  });
  $("tbody").on("click", "td", function () {
    $("#crno").val($(this).attr("crno"));
    $(".pop-container").hide();
  });
});

function companySch() {
  let params = $("#companyNm").serialize();
  $.ajax({
    type: "post",
    url: "기업주소찾기 API 주소",
    dataType: "json",
    data: params,
    success: function (res) {
      companyList(res.list);
      drawPaging(res.pb);
    },
    error: function (request, status, error) {
      console.log(error);
    },
  });
}

function companyList(list) {
  var html = "";

  for (var data of list) {
    html += '<tr crno="' + data.crno + '">';
    html += "   <td>" + data.crno + "</td>";
    html += "   <td>" + data.corpNm + "</td>";
    html += "</tr>";
  }

  $("tbody").html(html);
}

function drawPaging(pb) {
  var html = "";

  html += '<span page="1">처음</span>';
  if ($("#page").val() == "1") {
    html += '<span page="1"> 이전 </span>';
  } else {
    html += '<span page="' + ($("#page").val() * 1 - 1) + '"> 이전 </span>';
  }
  for (var i = pb.startPcount; i <= pb.endPcount; i++) {
    if ($("#page").val() == i) {
      html += '<span page="' + i + '"><b> ' + i + " </b></span>";
    } else {
      html += '<span page="' + i + '"> ' + i + " </span>";
    }
  }
  if ($("#page").val() == pb.maxPcount) {
    html += '<span page="' + pb.maxPcount + '"> 다음 </span>';
  } else {
    html += '<span page="' + ($("#page").val() * 1 + 1) + '"> 다음 </span>';
  }
  html += '<span page="' + pb.maxPcount + '"> 끝 </span>';

  $(".paging_wrap").html(html);
}
