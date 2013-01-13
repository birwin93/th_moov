$(document).ready(function() {

	/* fill in front page */
	
	var newHeight = $('body').height() - 50;
   console.log(newHeight);
   $('#main').height(newHeight);

  $(window).resize(function(){
    var newHeight = $('body').height() - 50;
    console.log(newHeight);
    $('#main').height(newHeight);
	});

	$('#lower-navbar').hover(
		function() {
			$('#main').animate({
				height: '-=150'
			}, 250, function() {

			});
			console.log('hovering');
		}, function() {
			$('#main').animate({
				height: '+=150'
			}, 250, function() {

			});
		});

	/* debug screen */

	var debugOn = false;
	$('.debug_dump').hide();

	$('a.debug-button').click(function() {
		if (debugOn) {
			$('.debug_dump').hide();
			debugOn = false;
			console.log('show');
		} else {
			$('.debug_dump').show();
			debugOn = true;
			console.log('hide');
		}
	});

	/*  login box   */
	var loginBoxOn = false;
	$('a.signin-button').click(function() {
		console.log("moving login screen");
		if (!loginBoxOn) {
  		$('.signin-box').animate({
    		bottom: '+=360'
  		}, 500, function() {
    		loginBoxOn = true;
    		console.log("nboom");
  		});
    }
  });
  $('a.signin-exit-button').click(function() {
		console.log("moving login screen");
		if (loginBoxOn) {
  		$('.signin-box').animate({
    		bottom: '-=360'
  		}, 500, function() {
    		loginBoxOn = false;
    		console.log("nboom");
  		});
    }
  });

});