// If you're adding a number of markers, you may want to drop them on the map
// consecutively rather than all at once. This example shows how to use
// window.setTimeout() to space your markers' animation.

var locations = [];
var markers = [];
var map;

// Init Google Maps
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: {lat: 52.520, lng: 13.410}
  });
  fetchLocations();
}

// Fetch location data
function fetchLocations(){
  $(function(){
    if(document.getElementById('map')){
      var current_url = window.location.href;
      $.ajax({
        type: "GET",
        dataType: "json",
        url: current_url + "/brand_locations",
        success: function(data){
          locations = data;
          dropMarkers();
        }
      });
    }
  });
}

// Delay markers dropping
function dropMarkers() {
  clearMarkers();
  for (var i = 0; i < locations.length; i++) {
    addMarkerWithTimeout(locations[i], i * 200);
  }
}

// Adding markers with delay
function addMarkerWithTimeout(position, timeout) {
  var infowindow = new google.maps.InfoWindow();

  window.setTimeout(function() {
    var lat = parseFloat(position.lat),
    lng = parseFloat(position.lng),
    pos = {lat, lng};

    var marker = new google.maps.Marker({
      position: pos,
      map: map,
      title: position.infoWindow,
      animation: google.maps.Animation.DROP
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(position.content);
      infowindow.open(map, marker);
    });

    markers.push(marker);

  }, timeout);
}

// Remove markers
function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}

// Open Brand Location Info Window by id
function openInfoWindow(brand_location_id){
  google.maps.event.trigger(markers[brand_location_id], 'click');
}
