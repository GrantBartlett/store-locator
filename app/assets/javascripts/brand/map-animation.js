// Animate locations with timeout
function animateLocation(marker, timeout){
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
    map.setZoom(10);
    map.panTo(marker.position);
  }

  setTimeout(function() {
    marker.setAnimation(null);
  }, timeout);
}
