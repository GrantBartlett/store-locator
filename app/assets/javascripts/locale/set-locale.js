$(function(){
  $('html, body').addClass(getCookie('locale'));

  if(getCookie('locale') === 'ar'){
    $('html, body').addClass('rtl');
  }
});
