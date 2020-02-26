// Initiate tooltip and popover from bootstrap 4
// Don't forget to import this on app/javascript/packs/application.js
// $(function()
// https://stackoverflow.com/questions/17317816/rails-javascript-only-works-after-reload
// make sure turbolinks reload javascript every link clicks
$(document).on("turbolinks:load", function() {
  console.log("Dev log: script loaded!");
  $('[data-toggle="tooltip"]').tooltip();
  // Initialize toast notifications / alerts
  //$('.toast').toast({ autohide: false });
  $('.toast').toast({ delay: 2000 });
  $('.toast').toast('show');

  $('[data-toggle="popover"]').popover();

  // Validate fileUpload
  $("input[type = 'submit'][value='Post']").click(function(){
  	var $fileUpload = $("input[type='file']");
  	if (parseInt($fileUpload.get(0).files.length) > 4){
      alert("You are only allowed to upload a maximum of 4 files");
  	}
	});

  // Initialize invalid classes on turbolinks load
  $('.field_with_errors input').addClass('is-invalid');
  $('.field_with_errors select').addClass('is-invalid');
  //$('.field_with_errors #post_category_id').addClass('is-invalid'); // this one is required
  $('.field_with_errors textarea:first').addClass('is-invalid');

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

  // prevent special characters on number input

  // 48-57 - (0-9)Numbers
  // 65-90 - (A-Z)
  // 97-122 - (a-z)
  // 8 - (backspace)
  // 32 - (space)
  $("#post_price").keypress(function(e) {
    var keyCode = e.which;

    if ( !( (keyCode >= 48 && keyCode <= 57) 
      ||(keyCode >= 65 && keyCode <= 90) 
      || (keyCode >= 97 && keyCode <= 122) ) 
      && keyCode != 8 && keyCode != 32) {
      console.log("key prevented");
      e.preventDefault();
    }
  });
  // end #post_price

  // Twitter typeahead
  /*var posts = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/posts/search?term=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#posts_search').typeahead(null, {
    source: posts
  });*/
  // Twitter typeahead end

  // if turbolinks is enabled scripts must be wrapped
  // inside turbolinks:load listener function
  $("div[data-toggle='collapse']").click(function(e){
    e.preventDefault();
    $(this).children('.fas').toggleClass("fa-chevron-down fa-chevron-up");
  });
});

$(function(){
  var documentEl = $(document),
    fadeElem = $('.fade-scroll');
    
    documentEl.on('scroll', function(){
        var currScrollPos = documentEl.scrollTop();
        
        fadeElem.each(function(){
            
            var $this = $(this),
                elemOffsetTop = $this.offset().top;
            
            if(currScrollPos > elemOffsetTop) $this.css('opacity', 1 -(currScrollPos-elemOffsetTop)/400);    
        })
        
    })
})
