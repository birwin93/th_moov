$(document).ready(function() {
	$('#landing-user').hide();
	$('#landing-org').hide();

	$('#ulog').click(function() {
		$('#landing-start').hide();
		$('#landing-user').show();
	});

	$('.landing-back').click(function() {
		$('#landing-start').show();
		$('#landing-user').hide();
		$('#landing-org').hide();
	});

	$('#olog').click(function() {
		$('#landing-start').hide();
		$('#landing-org').show();
	});

	var height = $('body').height();
	$('.landing-container').height(height-60);
	$('.landing-log').css('top', (height-610)/2 + 'px');
	$(window).resize(function(){
		height = $('body').height();
		$('.landing-container').height(height-60);
		if ($('.landing-container').height() >= 600) {
			$('.landing-log').css('top', (height-610)/2 + 'px');
		} else {
			$('.landing-log').css('top', '0px');
		}
	});

});