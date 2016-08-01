// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require passes.js.coffee

$(function() {

});


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat:39.5439642, lng: -119.8171444},
    scrollwheel: false,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.HYBRID,
    minZoom: 14,
    streetViewControl: false,
    mapTypeControl: false
  });
  addZones(map);
}

function addZones(map) {
  var zones = $('#map_data').data('zones');
  for (var i = 0; i < zones.length; i++) {
    var polygon = new google.maps.Polygon({
      paths: zones[i],
      strokeColor: '#ffef16',
      strokeOpacity: 1,
      strokeWeight: 2,
      fillColor: '#001a8a',
      fillOpacity: 0.01
    });
    polygon.setMap(map);
  }
};

// $('#pass').change(function() {
//   loadPass();
// });
//
// function loadPass(){
//   var params = {
//     "pass": $('#pass').val(),
//     "number": $('#number').val(),
//     "date": $('#date').val(),
//     "time": $('#time').val()
//   }
//   $.get( "/application/update", params, function( data ) {
//   console.log(data);
//   $('#map_data').data('zones', data['zones'])
//   addZones();
// });
// };



// handler.buildMap({
//     internal: {id: 'map'},
//     provider: {
//       zoom:      15,
//       center:    new google.maps.LatLng(39.5439642, -119.8171444),
//       mapTypeId: google.maps.MapTypeId.HYBRID,
//       minZoom: 14,
//       streetViewControl: false,
//       mapTypeControl: false
//     }
//   },
//   onMapLoad
// );
//
//   $('#pass').change(function() {
//     loadPass();
//   });
//   $('#number').change(function() {
//     loadPass();
//   });
// });
//
// function onMapLoad(){
//   loadPolys();
// };
//
// function loadPolys(){
//   var zones = $('#map_data').data('zones');
//   console.log(zones);
//
//   handler.addPolygons(
//       zones,
//     { strokeColor: $('#strokeColor').text(), fillColor: '#0423ff'}
//   );
// }
//
// function addBounds(){
//   var ne_bound = new google.maps.LatLng(39.55659, -119.80425);
//   var sw_bound = new google.maps.LatLng(39.53389, -119.80159);
//   var bounds = new google.maps.LatLngBounds(sw_bound, ne_bound);
//   handler.fitBounds(bounds);
// };
//
