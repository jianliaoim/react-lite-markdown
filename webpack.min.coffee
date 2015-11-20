webpack = require 'webpack'

config = require './webpack.config'

module.exports =
  entry:
    main: config.entry.main.slice 2
  output:
    path: config.output.path
    filename: config.output.filename
    publicPath: './build/'
  resolve: config.resolve
  module: config.module
  plugins: config.plugins.concat [
    new webpack.DefinePlugin 'process.env': 'NODE_ENV': '\'production\''
    new webpack.optimize.AggressiveMergingPlugin()
    new webpack.optimize.OccurenceOrderPlugin()
    new webpack.optimize.UglifyJsPlugin sourceMap: false
  ]
