$(document).ready(function() {
	$('.event-searchbox').hide();
	$('.event-searchbox input').val('');
	$('body').keypress(function(event) {
		$('.event-searchbox input').focus();
		$('.event-searchbox').show();
		//var c =(String.fromCharCode(event.which));
		//$('.event-searchbox input').val($('.event-searchbox input').val() + c);
	});
});