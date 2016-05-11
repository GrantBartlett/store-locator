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

// Ensure locations are always visible in map
function updateBounds(marker){
  map.panTo(marker.position);
  map.fitBounds(bounds);
  map.setCenter(bounds.getCenter());
}
