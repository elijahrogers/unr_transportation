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

function initMap() {
  window.map = new google.maps.Map(document.getElementById('map'), {
    center: {lat:39.5439642, lng: -119.8171444},
    scrollwheel: false,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.HYBRID,
    minZoom: 14,
    streetViewControl: false,
    mapTypeControl: false
  });
  addZones();
}

function addZones() {
  var zones = $('#map_data').data('zones');
  window.overlays = []
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
    overlays.push(polygon)
  }
};


function removeZones(){
  while(overlays[0]){
    overlays.pop().setMap(null);
  }
};

$('#pass').change(function() {
  loadPass();
});

$('#number').change(function() {
  loadPass();
});

$('#time').change(function() {
  loadPass();
});

function loadPass(){
  var params = {
    "pass": $('#pass').val(),
    "number": $('#number').val(),
    "date": $('#date').val(),
    "time": $('#time').val()
  }
  $.get( "/application/update", params, function(data) {
    $('#map_data').data('zones', data['zones'])
    removeZones();
    addZones();
  });
};
