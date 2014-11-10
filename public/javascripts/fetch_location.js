$(document).ready(function(){

  var browserError = "Please use <a href=\"https://www.google.com/chrome/browser/\">Chrome</a>, <a href=\"http://support.apple.com/downloads/#safari\"> Safari</a>, or <a href=\"https://www.mozilla.org/en-US/firefox/new/\">Firefox</a>.";
  var enableError = "Please enable location sharing.";
  var geo_options = {
    enableHighAccuracy: true, 
    maximumAge        : 30000, 
    timeout           : 27000
  };

  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.watchPosition(showPosition, showError, geo_options);
    } else {
      $(".error-message").html(browserError);
    }
  }

  function showError() {
    $(".error-message").html(enableError);
  }

  function showPosition(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    insertMap(latitude, longitude);
    $("#latitude").html(latitude + "°");
    $("#longitude").html(longitude + "°");
  }

  getLocation();

});