
function openPage(pageName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("main_content");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("main_button");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = color;
  }
  
  // Get the element with id="defaultOpen" and click on it
  document.getElementById("defaultOpen").click();

  function moreBtn(){
    if ($("#icon").attr("src") == "resources/images/empsch/up.png") {
        $("#icon").attr("src", "resources/images/empsch/down.png")
        $("#more").hide()
    } else if ($("#icon").attr("src") == "resources/images/empsch/down.png") {
        $("#icon").attr("src", "resources/images/empsch/up.png")
        $("#more").show()
    }
}