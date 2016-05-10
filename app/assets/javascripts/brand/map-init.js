var locations = [];
var markers = [];
var map;
var bounds;
var infowindow;

// Called by Google maps api script
function initMap() {
  getLocations();
}

// Get our locations and then init Google maps
function getLocations(){
  $(function(){
    if(document.getElementById('map')){
      var current_url = window.location.href;
      $.ajax({
        type: "GET",
        dataType: "json",
        url: current_url + "/locations",
        success: function(data){
          locations = data;
          initGoogleMaps(locations);
        }
      });
    }
  });
}

// Init Google maps
function initGoogleMaps(data){
  bounds = new google.maps.LatLngBounds();
  infowindow = new google.maps.InfoWindow({'maxWidth': 300});

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
  });

  // We're ready. Drop the locations onto the map!
  dropMarkers();
}
