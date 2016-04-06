$(function() {
    $('body').on('click', '.page-scroll a', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

$(document).on('ready page:load', function(event) {
	$('.progress-idea').mouseover(function(){
	      $(this).children('c').css("display","none");
	      $(this).children('e').css("display","block");
	}).mouseout(function(){
	      $(this).children('c').css("display","block");
	      $(this).children('e').css("display","none");
	});

	$('.progress-scrap').mouseover(function(){
	      $(this).children('c').css("display","none");
	      $(this).children('e').css("display","block");
	}).mouseout(function(){
	      $(this).children('c').css("display","block");
	      $(this).children('e').css("display","none");
	});
});