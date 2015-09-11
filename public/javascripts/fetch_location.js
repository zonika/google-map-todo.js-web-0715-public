$(document).ready(function(){

  function getLocation() {
    // code here
    var loc = navigator.geolocation.getCurrentPosition(function(position){
      $('#longitude').text(position.coords.longitude);
      $('#latitude').text(position.coords.latitude);
      insertMap(position.coords.latitude,position.coords.longitude)
    });
  }
  getLocation();

});
