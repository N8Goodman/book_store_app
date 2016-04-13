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
    var backslash = "/"
    var urlID = url.split(backslash);
    var id = urlID[2];
    var voteTotal = $("#vote-total-" + id);
    changeUpVote(url, id);
  });

  $('.downvote').on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    var backslash = "/"
    var urlID = url.split(backslash);
    var id = urlID[2];
    var voteTotal = $("#vote-total-" + id);
    changeDownVote(url, id);
  });
});
    var changeUpVote = function(url, id) {
      var request = $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      data: {
        id: id
      }
    });
    request.done(function(data) {
        $("#vote-total-" + id).text(data);
    });
  };

  var changeDownVote = function(url, id) {
    var request = $.ajax({
    type: 'POST',
    url: url,
    dataType: 'json',
    data: {
      id: id
    }
  });
  request.done(function(data) {
      $("#vote-total-" + id).text(data);
    });
  };
