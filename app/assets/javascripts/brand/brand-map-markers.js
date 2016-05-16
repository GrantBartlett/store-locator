// Delay markers dropping
function dropMarkers() {
  clearMarkers();
  for (var i = 0; i < locations.length; i++) {
    addMarkerWithTimeout(locations[i], i * 200);
  }
}

// Adding markers with delay
function addMarkerWithTimeout(location, timeout) {

  window.setTimeout(function() {
    console.log(location);
    var lat = parseFloat(location.lat),
        lng = parseFloat(location.lng),
        pos = { lat: lat, lng: lng },
        title = location['name']['name_' + locale],
        content = location['content']['content_' + locale],
        hours = location['opening_hours']['opening_hours'],
        categories = location['categories'],
        reg = location['region']['region_' + locale];

    var marker = new google.maps.Marker({
      title: location.infoWindow,
      position: pos,
      region: reg,
      map: map,
      animation: google.maps.Animation.DROP
    });

    var contentTitle = '<h4 class="infowindow-title">'+ title +'</h4>',
        contentBody = '<div class="infowindow-body">'+ content + '</div>',
        contentHours = '<div class="infowindow-hours">'+ hours + '</div>',
        contentRegion = '<div class="infowindow-region">' + reg + '</div>',
        infoWindowContent = contentTitle += contentBody += contentHours;

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
