// Filter markers
function filterMarkers(region) {
  for (i = 0; i < markers.length; i++) {
    marker = markers[i];
    // If is same region or region not picked
    if (marker.region == region || region.length === 0) {
      marker.setVisible(true);
      animateLocation(marker, 2000);
    }
    // Region doesn't match
    else {
      marker.setVisible(false);
    }
  }
}
