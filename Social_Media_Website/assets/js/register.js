$(document).ready(function() {

	//On click signup, hide login and show registration form
	$("#signup").click(function() {
		$("#first").slideUp("slow", function(){
			$("#second").slideDown("slow");
		});
	});

	//On click signup, hide registration and show login form
	$("#signin").click(function() {
		$("#second").slideUp("slow", function(){
			$("#first").slideDown("slow");
		});
	});

	//On click reset, hide login and show reset form
	$("#reset").click(function() {
		$("#first").slideUp("slow", function(){
			$("#third").slideDown("slow");
		});
	});

		//On click goback, go back to the original page
		$("#goback").click(function() {
			$("#third").slideUp("slow", function(){
				$("#first").slideDown("slow");
			});
		});


});