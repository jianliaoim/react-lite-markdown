xss = require 'xss'
React = require 'react'
emojify = require 'emojify.js'

LiteMarkdown = React.createFactory require '../src/index'

{ div, textarea } = React.DOM

App = React.createFactory React.createClass
  displayName: 'app',

  getInitialState: ->
    text: ''

  componentWillMount: ->
    emojify.setConfig img_dir: 'https://dn-talk.oss.aliyuncs.com/icons/emoji'
    emojify.defaultConfig.ignore_emoticons = true

  onTextChange: (event) ->
    @setState text: event.target.value

  render: ->
    div className: 'app',
      textarea onChange: @onTextChange

      LiteMarkdown
        name: 'example'
        value: @state.text
        emojify: emojify
        className: 'markdown-body'

React.render App(), document.getElementById 'app-mount'
