// Animate locations with timeout
function animateLocation(marker, timeout){
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }

  setTimeout(function() {
    marker.setAnimation(null);
  }, timeout);
}

// Update map location
function updateBounds(marker, zoom){
  map.panTo(marker.position);
  map.setCenter(marker.position);
  map.setZoom(zoom);
}
