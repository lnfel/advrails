const { environment } = require('@rails/webpacker');
// added popper and jquery
const webpack = require("webpack");
environment.plugins.append(
"Provide",
new webpack.ProvidePlugin({
$: "jquery",
jQuery: "jquery",
Popper: ["popper.js", "default"]
})
);
// end of update
module.exports = environment;
