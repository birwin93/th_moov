$(document).ready(function() {
	$(".loop-user-box, .loop-event-box").hide();


	var selected_label = $("#show-info");
	selected_label.addClass("selected");

	$("#show-members").click(function() {
		selected_label.removeClass("selected");
		selected_label = $(this);
		$(this).addClass("selected");
		$(".loop-event-box").hide();
		$(".loop-user-box").show();
		$(".loop-info-box").hide();
	});

	$("#show-events").click(function() {
		selected_label.removeClass("selected");
		selected_label = $(this);
		$(this).addClass("selected");
		$(".loop-event-box").show();
		$(".loop-user-box").hide();
		$(".loop-info-box").hide();
	});

	$("#show-info").click(function() {
		selected_label.removeClass("selected");
		selected_label = $(this);
		$(this).addClass("selected");
		$(".loop-event-box").hide();
		$(".loop-user-box").hide();
		$(".loop-info-box").show();

	});

	$(".loop-add-member-box").hide();

	$("#add-member").click(function() {
		$(".loop-add-member-box").show();
	});


});