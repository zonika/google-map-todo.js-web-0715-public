function insertMap(latitude, longitude) {
  // code here
  latlon = new google.maps.LatLng(latitude, longitude);
  var myOptions = {
    center:latlon,zoom:14,
    }

  var map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
}
