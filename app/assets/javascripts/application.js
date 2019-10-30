// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



/* NAVBAR TRANSPARENT TO SOLID */
$(document).on('tubolinks:load', function(){
  $(window).scroll(function(){
    if($(this).scrollTop() > 300){
      $('.navbar').addClass('solid');
    } else {
      $('.navbar').removeClass('solid');
    }
  });
});

$(document).ready('turbolinks:load', function(){
  $(window).scroll(function(){
    if($(this).scrollTop() > 300){
      $('.navbar').addClass('solid');
    } else {
      $('.navbar').removeClass('solid');
    }
  });
});

/* CLOSE MOBILE NAV ON CLICK */

$(document).ready(function(){
  $(document).click(function(event){
    var clickover = $(event.target);
    var _opened = $(".navbar-collapse").hasClass("show");
    if(_opened === true && !clickover.hasClass(".navbar-toggler")){
      $(".navbar-toggler").click();
    }
  })
})

/* SMOOTH SCROLLING TO LINKS */

$(document).on('turbolinks:load', function(){
  $("a").on("click", function(event) {
    if(this.hash !== ""){
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
        window.location.hash = hash;
      });
    } // End of if statement
  });
})

$(document).ready(function(){
  $("a").on("click", function(event) {
    if(this.hash !== ""){
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
        window.location.hash = hash;
      });
    } // End of if statement
  });
});

/* BOUNCING DOWN ARROW */

$(document).ready(function(){
  $(window).scroll(function(){
    $(".arrow").css("opacity", 1 - $(window).scrollTop() / 250);
  });
});
