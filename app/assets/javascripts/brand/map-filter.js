// Filter markers
function filterResult(region) {
  for (i = 0; i < markers.length; i++) {
    marker = markers[i];

    if (marker.region === region) {
      showMarker(marker);
      showByRegion(region);
    }
    else if(region === 'all'){
      showByAllRegions(marker);
    }
    else {
      hideMarker(marker);
    }
  }
}

function showByRegion(region){
  $('.location-info-box').each(function() {
    if($(this).data('region') === region){
      $(this).removeClass('hidden');
    }else if(region !== ''){
      $(this).addClass('hidden');
    }
  });
}

function showByAllRegions(marker){
  $('.location-info-box').each(function(){
    $(this).removeClass('hidden');
    showMarker(marker);
  });
}
