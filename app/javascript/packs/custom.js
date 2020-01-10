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
});

$(function() {
  $('[data-toggle="popover"]').popover();
});
