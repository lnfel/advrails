// Initiate tooltip and popover from bootstrap 4
// Don't forget to import this on app/javascript/packs/application.js
$(function() {
  $('[data-toggle="tooltip"]').tooltip();
  // Initialize toast notifications / alerts
  $('.toast').toast({ delay: 2000 });
  $('.toast').toast('show');
});

$(function() {
  $('[data-toggle="popover"]').popover();
});
