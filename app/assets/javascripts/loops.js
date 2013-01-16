$(document).ready(function() {
	$("#loop-users").hide();


	var selected_label = $("#show-info");
	selected_label.addClass("selected");

	$("#show-members").click(function() {
		selected_label.removeClass("selected");
		selected_label = $(this);
		$(this).addClass("selected");
		//$("#loop-events").hide();
		$("#loop-users").show();
		$(".loop-info-box").hide();
	});

	$("#show-events").click(function() {
		selected_label.removeClass("selected");
		selected_label = $(this);
		$(this).addClass("selected");
		//$("#loop-events").show();
		$("#loop-users").hide();
		$(".loop-info-box").hide();
	});

	$("#show-info").click(function() {
		selected_label.removeClass("selected");
		selected_label = $(this);
		$(this).addClass("selected");
		//$("#loop-events").hide();
		$("#loop-users").hide();
		$(".loop-info-box").show();

	});

	$(".loop-add-member-box").hide();

	var add_box_showing = false;
	$("#add-member").click(function() {
		if (add_box_showing) {
			$(".loop-add-member-box").hide();
			add_box_showing = false;
		} else {
			$(".loop-add-member-box").show();
			add_box_showing = true;
		}
	});


});