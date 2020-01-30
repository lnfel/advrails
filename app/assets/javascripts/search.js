$(document).ready(function(){
//document.addEventListener("turbolinks:load", function() {
	//input = document.querySelector("[data-behavior='autocomplete']")

	var options = {
		url: function(phrase) {
			return "/autocomplete.json?term=" + phrase + "&format=json";
			//return "http://easyautocomplete.com/api/countrySearch.php?phrase=" + phrase + "&format=json";
		},
		//categories: [
		//	{
		//		listlocation: "posts"
		//	}
		//],
		getValue: "title",
		list: {
			onChooseEvent: function(){
				var url = $("input[data-behavior='autocomplete']").getSelectedItemData().url
				console.log(url);
				$("input[data-behavior='autocomplete']").val("")
				Turbolinks.visit(url);
			},
			match: {
      	enabled: true
    	}
		}
	}

	//$("input[data-behavior='autocomplete']").easyAutocomplete(options)
	$("#term").easyAutocomplete(options)

	//$(".easy-autocomplete").css({"min-width": "calc(100% - 76.7px)"});
	/*$(".input-group > .easy-autocomplete > .form-control:not(:last-child)").css({
		"border-top-right-radius": "0",
		"border-bottom-right-radius": "0"
	});
	$(".input-group > .easy-autocomplete > .form-control").css({
		"position": "relative",
		"flex": "1 1",
		"min-width": "0",
		"margin-bottom": "0"
	});*/
});