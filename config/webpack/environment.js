const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

const notServerRendering = name => name !== 'server_rendering';
environment.splitChunks((config) => Object.assign({}, config, { 
  optimization: {
    splitChunks: {
      chunks(chunk) {
        return notServerRendering(chunk.name);
      },
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendor',
        },
        vendor_vue: {
          name: 'vendor_vue',
          test: /[\\/]node_modules[\\/](vue|vuex|bootstrap-vue)[\\/]/
        },
        dropzone: {
          name: 'dropzone',
          test: /[\\/]node_modules[\\/](dropzone)[\\/]/
        },
      }
    }
  }
}))

module.exports = environment
