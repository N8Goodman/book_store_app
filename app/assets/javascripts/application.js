// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
//= require konami


$(function(){ $(document).foundation();
  $('input#upvote').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var url = $(this).parent().attr('action');
    var voteTotal = $(this).parent().parent().find('.vote-total');
    $.ajax({
      type: 'POST',
      url: '/api' + url,
      dataType: 'json',
      success: function(response) {
        voteTotal.text(response);
      },
      error: function(){
        alert('You must be signed in');
      },
      complete: function(){
        console.log('complete')
      }
    });
  });

  $('input#downvote').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var url = $(this).parent().attr('action');
    var voteTotal = $(this).parent().parent().find('.vote-total');
    $.ajax({
      type: 'POST',
      url: '/api'+url,
      dataType: 'json',
      success: function(response) {
        voteTotal.text(response);
      },
      error: function() {
        alert('You must be signed in');
      }
    });
  });

  $('#getmap').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var url = $(this).attr('href');
    var request = $.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: function(response) {
        $('#maphere').append("<div id='googleMap' style='width:500px;height:380px;'></div>");
        $('#getmap').hide();

        initialize(response.latitude, response.longitude);
      },
    });
  });
});



var initialize = function(lat, lng) {
  var mapProp = {
    center:new google.maps.LatLng(lat,lng),
    zoom:15,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById('googleMap'), mapProp);
}
