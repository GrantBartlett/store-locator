function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

// Simple toggle function using data attributes, including icon toggle support
$(function(){
  $('button, .btn').on('click', function(){
    var $this = $(this);
    if($this.data('show') != ''){
      var el = $this.data('show');
      $(el).toggleClass('hidden').toggleClass('visible');
    }

    if($this.data('toggleicon') != ''){
      var iconShow = $this.data('icon-show');
      var iconHide = $this.data('icon-hide');
      $this.find('i').toggleClass(iconHide).toggleClass(iconShow);
    }
  });
});
