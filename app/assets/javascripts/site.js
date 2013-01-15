$(document).ready(function() {

	/* fill in front page */
	
	var conHeight = $('body').height() - 130;
	var navHeight = conHeight * 0.8;
	//var sidebarHeight = conHeight + 130;
  $('#main').height(conHeight);
  //$('#sidebar').height(sidebarHeight);
  $('#left-navbar').height(navHeight);

  $(window).resize(function(){
    var conHeight = $('body').height() - 130;
		var navHeight = conHeight * 0.8;
		//var sidebarHeight = conHeight + 130;
	  $('#main').height(conHeight);
	  //$('#sidebar').height(sidebarHeight);
	  $('#left-navbar').height(navHeight);
	});

	/*$('#lower-navbar').hover(
		function() {
			$('#main, #left-navbar').animate({
				height: '-=150'
			}, 250, function() {

			});
			console.log('hovering');
		}, function() {
			$('#main, #left-navbar').animate({
				height: '+=150'
			}, 250, function() {

			});
		});*/

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