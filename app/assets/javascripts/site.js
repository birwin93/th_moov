$(document).ready(function() {

	var columnX = 0;
	var heightVal = $(document).height() - 250;
	var eventY = heightVal;
	var colors = 5;
	var chosenColor = 0;
	var numColumns = 0;
	$('.event-timeline-container').css('height', heightVal +'px');
	console.log(eventY);

	colors = ['blue', 'yellow', 'red', 'orange', 'green'];

	/*for (var i = 0; i < ; i++) {
		choice = i % numPics + 1;
		console.log(choice);
		
		$('.pic-container').append("<div class='pic-cover'></div>");
	}

	for (var j = 0; j < 140; j++) {
		var currentBrick = $('.pic')[j];
		var currentCover = $('.pic-cover')[j];
		$(currentBrick).css("top", currentY + 'px');
		$(currentBrick).css("left", currentX + 'px');
		$(currentCover).css("top", currentY + 'px');
		$(currentCover).css("left", currentX + 'px');

		colorCh = j % 5;
		$(currentCover).css("background", colors[colorCh]);
		currentX += 100;
		if (currentX > 1210) {
			currentX = 0;
			currentY += 65;
		};
	}*/

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

});