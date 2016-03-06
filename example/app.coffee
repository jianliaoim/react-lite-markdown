React = require 'react'
ReactDOM = require 'react-dom'

LiteMarkdown = React.createFactory require '../src/index'

{ div, textarea } = React.DOM

App = React.createFactory React.createClass
  displayName: 'app',

  getInitialState: ->
    text: ''

  onTextChange: (event) ->
    @setState text: event.target.value

  render: ->
    div className: 'app',
      textarea onChange: @onTextChange

      LiteMarkdown
        name: 'example'
        value: @state.text
        className: 'markdown-body'

ReactDOM.render App(), document.getElementById 'app-mount'
