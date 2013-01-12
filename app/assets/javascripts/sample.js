$(document).ready(function() {

	for (var i = 0; i < 50; i++) {
		$('.event-stream').append("<div class='stream-item'><div class='item-name'>Event</div></div");
	}

	$(".stream-item").hover(
		function () {
    	$(this).children("div:first").css('opacity', '1');
  },
  	function () {
    	$(this).children("img:first").css('opacity', '0.8');
  }
});