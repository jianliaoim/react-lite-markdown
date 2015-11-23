webpack = require 'webpack'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
HtmlWebpackPlugin = require 'html-webpack-plugin'

fontName = 'fonts/[name].[ext]'

module.exports =
  entry:
    main: [
      'webpack-dev-server/client?http://0.0.0.0:8080'
      'webpack/hot/dev-server'
      './example/app.coffee'
      './example/app.css'
    ]
  output:
    path: './build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/'
  resolve:
    extensions: [ '.coffee', '.js', '.jsx', '' ]
  module:
    loaders: [
      { test: /\.json$/, loader: 'json' }
      { test: /\.coffee$/, loader: 'coffee' }
      { test: /\.css$/, loader: ExtractTextPlugin.extract 'style', 'css?importLoaders=1!autoprefixer' }
      { test: /.(eot|svg|ttf|woff(2)?)(\?[a-z0-9=\.]+)?$/, loader: "url?limit=10000&name=#{ fontName }" }
    ]
  plugins: [
    new ExtractTextPlugin 'style.css'
    new HtmlWebpackPlugin
      title: 'React Lite Markdown'
      inject: true
      minify: collapseWhitespace: true
      filename: '../index.html'
      template: './example/index.html'
    new webpack.NoErrorsPlugin()
  ]
