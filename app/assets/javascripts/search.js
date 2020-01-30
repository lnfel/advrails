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
		requestDelay: 1000,
		list: {
			onChooseEvent: function(){
				var url = $("input[data-behavior='autocomplete']").getSelectedItemData().url
				console.log(url);
				$("input[data-behavior='autocomplete']").val("")
				//Turbolinks.visit is not triggering turbolinks:load
				//Turbolinks.visit(url);
				window.location.replace(url); 
			},
			match: {
      	enabled: true
    	},
    	showAnimation: {
    		type: "slide",
    		time: 400,
    		callback: function() {}
    	},
    	hideAnimation: {
    		type: "slide",
    		time: 400,
    		callback: function() {}
    	}
		},
		template: {
			type: "custom",
			method: function(value, item) {
				// align-items-center justify-content-center
				console.log(item);
				var icon = item.feature_image ? `<img src='${[item.feature_image]}' height="100px" />` : `<svg class="bd-placeholder-img" width="177px" height="100px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Image cap"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">No Image Provided</text></svg>`;

				return `
				<div class="d-flex">
					${[icon]}
					<div class="px-2">
						<p class="pt-2 mb-1">${[value]}</p>
						<small>${[item.description]}</small>
					</div>
				</div>
				`;
			}
		}
	}

	//$("input[data-behavior='autocomplete']").easyAutocomplete(options)
	$("#term").easyAutocomplete(options)

	$(".easy-autocomplete").css({"min-width": "calc(100% - 76.7px)"});
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