// If you're adding a number of markers, you may want to drop them on the map
// consecutively rather than all at once. This example shows how to use
// window.setTimeout() to space your markers' animation.

var locations = [];
var markers = [];
var map;
var bounds;
var infowindow;

// Init Google Maps
function initMap() {
  fetchLocations();
  bounds = new google.maps.LatLngBounds();
  infowindow = new google.maps.InfoWindow({'maxWidth': 300});
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
  });
}

// Fetch location data
function fetchLocations(){
  $(function(){
    if(document.getElementById('map')){
      var current_url = window.location.href;
      $.ajax({
        type: "GET",
        dataType: "json",
        url: current_url + "/locations",
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

  window.setTimeout(function() {
    var lat = parseFloat(position.lat);
    var lng = parseFloat(position.lng);
    var pos = '';

    var marker = new google.maps.Marker({
      position: pos,
      map: map,
      title: position.infoWindow,
      animation: google.maps.Animation.DROP
    });

    bounds.extend(marker.position);

    var contentTitle = '<h4 class="infowindow-title">'+ position.name +'</h4>';
    var contentBody = '<div class="infowindow-body">'+ position.content +'</div>';
    var infoWindowContent = contentTitle += contentBody;

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(infoWindowContent);
      infowindow.maxWidth = 200;
      infowindow.open(map, marker);
    });

    markers.push(marker);
  }, timeout);

  map.fitBounds(bounds);

  var listener = google.maps.event.addListener(map, "idle", function () {
    map.setZoom(10);
    google.maps.event.removeListener(listener);
  });
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
