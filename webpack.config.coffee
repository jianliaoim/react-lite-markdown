webpack = require 'webpack'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
HtmlWebpackPlugin = require 'html-webpack-plugin'

module.exports =
  entry:
    main: [
      'webpack-dev-server/client?http://0.0.0.0:8080'
      'webpack/hot/dev-server'
      './example/app.coffee'
      './example/style.css'
    ]
  output:
    path: './build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/'
  resolve: extensions: ['.js', '.jsx', '.coffee', '']
  module:
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' }
      { test: /\.css$/, loader: ExtractTextPlugin.extract 'style', 'css?importLoaders=1!autoprefixer' }
    ]
  plugins: [
    new ExtractTextPlugin 'style.css'
    new HtmlWebpackPlugin
      title: 'React Lite Markdown'
      inject: true
      minify: collapseWhitespace: true
      filename: '../index.html'
      template: './example/index.html'
  ]
