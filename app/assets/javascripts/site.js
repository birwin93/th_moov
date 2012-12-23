$(document).ready(function() {

	/* fill in front page */
	var columnX = 0;
	var heightVal = $(document).height() - 250;
	var eventY = heightVal;
	var colors = 5;
	var chosenColor = 0;
	var numColumns = 0;
	$('.event-timeline-container').css('height', heightVal +'px');
	console.log(eventY);

	colors = ['blue', 'yellow', 'red', 'orange', 'green'];

	var column;
	for (var i = 0; i < 60; i++) {
		if (eventY > heightVal - 130) {
			$('.event-timeline-container').append("<div class='event-timeline-column'></div");
			column = $('.event-timeline-column')[numColumns];
			$(column).css('left', columnX + 'px');
			$(column).css('height', heightVal + 'px');
			numColumns += 1;
			eventY = 0;
			columnX += 400;
		};

		$(column).append("<div class='event-banner'></div");
		eventY += 100;
	};

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

});