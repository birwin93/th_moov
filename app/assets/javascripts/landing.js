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

	//var height = $('body').height();
	//$('.landing-container').height(height-60);
	//$('#log-top').height(height-60-294);
	//$(window).resize(function(){
		//height = $('body').height();
		//$('.landing-container').height(height-60);
		//$('#log-top').height(height-60-294);
	//});

});