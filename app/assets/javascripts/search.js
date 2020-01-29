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
		getValue: "name"
		//list: {
		//	onChooseEvent: function(){
		//		var url = $("input[data-behavior='autocomplete']").getSelectedItemData().url
		//		console.log(url);
		//		$("input[data-behavior='autocomplete']").val("")
		//		Turbolinks.visit(url);
		//	},
		//	match: {
    //  	enabled: true
    //	}
		//}
	}

	//$("input[data-behavior='autocomplete']").easyAutocomplete(options)
	$("#term").easyAutocomplete(options)
});