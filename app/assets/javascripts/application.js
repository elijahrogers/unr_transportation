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
//= require jquery.timepicker.min.js
//= require passes.js.coffee
//= require fontawesome-markers.min.js
//= require_tree .

$('#time').timepicker({ 'scrollDefault': 'now', 'timeFormat': 'h:i A' });

$('#description').parent().hide()
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
  var first = zones[0][0]
  for (var i = 0; i < zones.length; i++) {
    var metaData = zones[i].shift();
    var polygon = new google.maps.Polygon({
      paths: zones[i],
      strokeColor: metaData["stroke_color"],
      strokeOpacity: metaData["stroke_opacity"],
      strokeWeight: metaData["stroke_weight"],
      fillColor: metaData["fill_color"],
      fillOpacity: metaData["fill_opacity"]
    });
    setFormColors(first);
    polygon.setMap(map);
    overlays.push(polygon);
  }
};

function setFormColors(metaData){
  var fill = metaData["fill_color"].toString();
  $('#pass').css({"background-color": fill});
  $('#number').css({"background-color": fill});
  $('#time').css({"background-color": fill});
};

function removeZones(){
  while(overlays[0]){
    overlays.pop().setMap(null);
  }
};

$('#pass').change(function() {
  loadPass();
  loadInfo();
});

$('#number').change(function() {
  loadPass();
  loadInfo();
});

$('#time').change(function() {
  loadPass();
  loadInfo();
});

$('#show_dispensers').change(function() {
  if(this.checked){
    addDispensers();
  }
  else{
    clearMarkers(window.dispensers);
  }
});

$('#show_evcs').change(function() {
  if(this.checked){
    addEVCS();
  }
  else{
    clearMarkers(window.evcs);
  }
});

function addEVCS(){
  window.evcs = []
  var chargingStations = $('#map_data').data('evcs')
  for (var i = 0; i < chargingStations.length; i++) {
    var marker = new google.maps.Marker({
      position: chargingStations[i],
      map: map,
      icon: {
        path: fontawesome.markers.PLUG,
        scale: 0.2,
        strokeWeight: 0.2,
        strokeColor: 'black',
        strokeOpacity: 1,
        fillColor: '#4df000',
        fillOpacity: 0.7
    }
    });
    window.evcs.push(marker);
  };
};

function addDispensers(){
  window.dispensers = []
  var dispensers = $('#map_data').data('dispensers')
  for (var i = 0; i < dispensers.length; i++) {
    var marker = new google.maps.Marker({
      position: dispensers[i],
      map: map,
      icon: {
        path: fontawesome.markers.MAP_PIN,
        scale: 0.2,
        strokeWeight: 0.2,
        strokeColor: 'black',
        strokeOpacity: 1,
        fillColor: '#ddf000',
        fillOpacity: 0.7
    }
    });
    window.dispensers.push(marker);
  };
};

function clearMarkers(array) {
  while(array[0]){
    array.pop().setMap(null);
  }
};

function loadInfo(){
  description = $('#description').html()
  if(description === 'null')
    $('#description').parent().hide()
  else
    $('#description').parent().show()
};

function loadPass(){
  var params = {
    "pass": $('#pass').val(),
    "number": $('#number').val(),
    "date": $('#date').val(),
    "time": $('#time').val()
  }
  $.get( "/application/update", params, function(data) {
    $('#map_data').data('zones', data['zones'])
    $('#map_data').data('info', data['info'])
    $('#info').text($('#map_data').data('info'))
    $('#info').css('color', '#ffffff')
    removeZones();
    addZones();
  });
};
