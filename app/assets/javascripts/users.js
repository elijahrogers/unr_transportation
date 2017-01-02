function initMap() {
  window.map = new google.maps.Map(document.getElementById('map'), {
    center: {lat:39.5439642, lng: -119.8171444},
    scrollwheel: false,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.HYBRID,
    minZoom: 14,
    streetViewControl: false,
    disableDefaultUI: true,
    disableDoubleClickZoom: true
  });
}

$( document ).ready(function() {
  $('.flash i').click(function() {
    $(this).parent().hide({duration: 800});
  });
});

// $('input[type=text],input[type=password]').focus(function(){
//   window.timer = setInterval(changeColor, 500)
//   var i = 0
//   var colors = ['#67e049','#e80000','#00a3ff','#e000de', '#9e3ed7','#ffa800','#dde200']
//   function changeColor(){
//     $('input[type=text],input[type=password]').css({'background-color': colors[i], 'transition': 'background .5s ease-in'});
//     if(i > colors.length){
//       i = 0
//     }
//     else {
//       i++
//     }
//   }
// });
// $('input[type=text],input[type=password]').focusout(function(){
//   clearInterval(timer);
//   $('input[type=text],input[type=password]').css({'background-color': '#202020'})
// });
