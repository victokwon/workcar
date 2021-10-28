function openPage(pageName, elmnt, color) {
  // Hide all elements with class="tabcontent" by default */
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("main_content");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Remove the background color of all tablinks/buttons
  // tablinks = document.getElementsByClassName("main_button");
  // for (i = 0; i < tablinks.length; i++) {
  //     tablinks[i].style.backgroundColor = "";
  // }

  // Show the specific tab content
  document.getElementById(pageName).style.display = "flex";
  document.getElementById(pageName).style.alignItems = "flex-start";

  // Add the specific color to the button used to open the tab content
  elmnt.style.backgroundColor = color;
}
