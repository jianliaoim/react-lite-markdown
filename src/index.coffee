cx = require 'classnames'
React = require 'react'

markdown = require './util/markdown'

{ div } = React.DOM
T = React.PropTypes

module.exports = React.createClass
  displayName: 'lite-markdown'

  propTypes:
    name: T.string
    value: T.string
    emojify: T.func
    className: T.string

  getDefaultProps: ->
    name: ''
    value: ''
    className: 'markdown-body'

  componentWillMount: ->
    markdown.setEmojiFn @props.emojify

  getClassName: ->
    className = cx 'lite-markdown', "is-#{ @props.name }": @props.name? and @props.name.length

  getMarkup: ->
    markdown.renderer.render @props.value

  render: ->
    div className: @getClassName(),
      div className: @props.className, dangerouslySetInnerHTML: __html: @getMarkup()
