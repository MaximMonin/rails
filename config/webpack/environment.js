const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const webpack = require("webpack");
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    jquery: "jquery",
    "window.Tether": "tether",
    Popper: ["popper.js", "default"] // for Bootstrap 4
  })
);

module.exports = environment


