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
