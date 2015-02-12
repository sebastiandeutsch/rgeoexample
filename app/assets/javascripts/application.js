// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require_tree .

jQuery(function($) {
  if($('#map').size() > 0) {
    handler = Gmaps.build('Google');
    handler.buildMap({
        provider: {
          // pass in other Google Maps API options here
        },
        internal: {
          id: 'map'
        }
      },
      function(){
        markers = handler.addMarkers(JSON.parse($('#markerhash').text()));
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
      }
    );
  }
});
