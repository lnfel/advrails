// Initiate tooltip and popover from bootstrap 4
// Don't forget to import this on app/javascript/packs/application.js
$(function() {
  $('[data-toggle="tooltip"]').tooltip();
  // Initialize toast notifications / alerts
  $('.toast').toast({ delay: 2000 });
  $('.toast').toast('show');

  // Validate fileUpload
  $("input[type = 'submit']").click(function(){
  	var $fileUpload = $("input[type='file']");
  	if (parseInt($fileUpload.get(0).files.length) > 4){
      alert("You are only allowed to upload a maximum of 4 files");
  	}
	});

  // Cacading select, Dependent dropdown, Dynamic form select
  // https://fool-dev.com/how-to-create-a-dependent-dropdown-in-ruby-on-rails/
  $("#post_category_id").prop("disabled", true); // disable category select while type select is empty
  // Listen for value change in Type select
  $("#post_type_id").change( function(){
    var type = $(this).val();
    console.log(type);

    if(type == ''){
      $("#post_category_id").prop("disabled", true);
    }else{
      $("#post_category_id").prop("disabled", false);
    }

    $.ajax({
      url: "/posts/new",
      method: "GET",
      dataType: "json",
      data: {type: type},
      error: function(xhr, status, error) {
        console.error('AJAX Error:' + status + error);
      },
      success: function(response) {
        console.log(response);
        var category = response["category"];
        $("#post_category_id").empty();

        $("#post_category_id").append('<option value="">Category</option>');
        for(var i = 0; i < category.length; i++){
          $("#post_category_id").append('<option value="' + category[i]["id"] + '">' + category[i]["name"] + '</option>');
        }
      }
    });
  });
  // end #post_type_id
});

$(function() {
  $('[data-toggle="popover"]').popover();
});
