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


$(function(){ $(document).foundation();
  $('.upvote').on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    var voteTotal = $(this).parent().find('.vote-total');
    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      success: function(response) {
        voteTotal.text(response);
      },
      error: function(){
        alert('You must be signed in');
      }
    });
  });

  $('.downvote').on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    var voteTotal = $(this).parent().find('.vote-total');
    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      success: function(response) {
        voteTotal.text(response);
      },
      error: function() {
        alert('You must be signed in');
      }
    });
  });
});



function initialize(lat, lng) {
  var mapProp = {
    center:new google.maps.LatLng(lat,lng),
    zoom:15,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
}

window.onload = function() {
  var id = window.location.pathname.match(/\/(\d+)$/)[1];
  var url = "/api/bookstores/" + id;
  var request = $.ajax({
    type: "GET",
    url: url,
    dataType: 'json',
    data: {
      id: id
    }
  });
  request.done(function(data){
    initialize(data.latitude, data.longitude);
  });
};
