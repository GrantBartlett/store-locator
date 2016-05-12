// Adding markers with delay
function addMarkerWithTimeout(location, timeout) {

  window.setTimeout(function() {
    var lat = parseFloat(location.lat);
    var lng = parseFloat(location.lng);
    var pos = { lat: lat, lng: lng };
    var reg = location.region;

    var marker = new google.maps.Marker({
      title: location.infoWindow,
      position: pos,
      region: reg,
      map: map,
      animation: google.maps.Animation.DROP
    });

    var contentTitle = '<h4 class="infowindow-title">'+ location.name +'</h4>';
    var contentBody = '<div class="infowindow-body">'+ location.content + '</div>';
    var contentRegion = '<div class="infowindow-region">' + reg + '</div>';
    var infoWindowContent = contentTitle += contentBody;

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(infoWindowContent);
      infowindow.maxWidth = 200;
      infowindow.open(map, marker);
      animateLocation(marker, 2000);
      updateBounds(marker, 15);
    });

    bounds.extend(marker.position);
    markers.push(marker);
  }, timeout);

  map.fitBounds(bounds);

  var listener = google.maps.event.addListener(map, "idle", function () {
    map.setZoom(5);
    google.maps.event.removeListener(listener);
  });
}

// Delay markers dropping
function dropMarkers() {
  clearMarkers();
  for (var i = 0; i < locations.length; i++) {
    addMarkerWithTimeout(locations[i], i * 200);
  }
}

// Remove markers
function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}

// Show marker
function showMarker(marker){
  marker.setVisible(true);
  animateLocation(marker, 2000);
}

// Hide marker
function hideMarker(marker){
  marker.setVisible(false);
}

// Open Brand Location Info Window by id
function openInfoWindow(brand_location_id){
  google.maps.event.trigger(markers[brand_location_id], 'click');
}
