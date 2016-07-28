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
//= require underscore
//= require gmaps/google
//= require passes.js.coffee

window.onload = function() {
  var object = document.getElementById('map_data');
  var pass = object.getAttribute('data-pass');
  var zones_raw = object.getAttribute('data-zones');
  var zones = JSON.parse(zones_raw)
  console.log(zones);



var mapStyle = [
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#444444"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#46bcec"
            },
            {
                "visibility": "on"
            }
        ]
    }
];

var handler = Gmaps.build('Google')
handler.buildMap({
    internal: {id: 'map'},
    provider: {
      zoom:      15,
      center:    new google.maps.LatLng(39.5439642, -119.8171444),
      mapTypeId: google.maps.MapTypeId.HYBRID,
      styles:    mapStyle,
      minZoom: 14,
      streetViewControl: false,
      mapTypeControl: false
    }
  },
  onMapLoad
);

function onMapLoad(){
  function addBounds(){
    var ne_bound = new google.maps.LatLng(39.55659, -119.80425);
    var sw_bound = new google.maps.LatLng(39.53389, -119.80159);
    var bounds = new google.maps.LatLngBounds(sw_bound, ne_bound);
    handler.fitBounds(bounds);
  };
  var polygons = handler.addPolygons(
      zones,
    { strokeColor: '#f4ff1c', fillColor: '#0423ff'}
  );
};

};
