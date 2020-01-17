// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require jquery3
//= require popper
//= require bootstrap-sprockets
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/custom";
import "../stylesheets/highschool-usa-sans/highschool-usa-sans";
import "./custom";
// Heroku error:
// ModuleNotFoundError: Module not found: Error: Can't resolve '@fortawesome/fontawesome-free/js/all' in '/tmp/build_23d82e6debf26a05e59da0fc0d46a4ff/app/javascript/packs'
// Decided to use app/assets/stylesheets/application.scss to import font-awesome
//import "@fortawesome/fontawesome-free/js/all";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"
