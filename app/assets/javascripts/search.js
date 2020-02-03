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
				var icon = item.feature_image ? 
					`
					<div class="position-relative" style="padding-bottom: 44%;">
						<img src='${[item.feature_image]}', class="position-absolute h-100 card-img-top rounded" style="top: 0; object-fit: cover;" height="100px" />
					</div>
					` 
					: 
					`<svg class="bd-placeholder-img rounded-lg" width="100%" height="" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Image cap"><title>Placeholder</title><rect width="100%" height="100%" fill="#ffb5da"></rect><text x="50%" y="50%" fill="#ffffff" dy=".3em">${[item.type]}</text></svg>`;
					//`<svg class="bd-placeholder-img card-img-top" width="177px" height="100px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Image cap"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">No Image Provided</text></svg>`;

				return `
				<!--<div class="">-->
					<div class="row d-flex p-2">
						<div class="d-none d-md-block col-12 col-md-4 mb-2 mb-md-0">
							${[icon]}
						</div>
						<div class="col-12 col-md-8">
							<div class="d-none d-lg-inline-block badge badge-success border px-2 py-1 mb-1">${[item.type]}</div>
							<div class="d-none d-lg-inline-block badge badge-success border px-2 py-1 mb-1">${[item.category]}</div>
							<p class="mb-1 text-truncate">${[value]}</p>
							<small class="d-block text-truncate mb-lg-2 mb-xl-4">${[item.description]}</small>
							<small class="d-none d-lg-block time-distance align-self-end">${[item.time_distance]} ago</small>
						</div>
					</div>
				<!--</div>-->
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