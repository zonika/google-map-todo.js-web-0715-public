$(document).ready(function(){

  var errorMessage = "<p>Please use <a href=\"https://www.google.com/chrome/browser/\">Chrome</a>, <a href=\"http://support.apple.com/downloads/#safari\"> Safari</a>, or <a href=\"https://www.mozilla.org/en-US/firefox/new/\">Firefox</a> and enable geolocation.</p>";

  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else {
      $(".error-message").html(errorMessage);
    }
  }

  function showPosition(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    $("#latitude").html(latitude + "°");
    $("#longitude").html(longitude + "°");
  }

  getLocation();

});