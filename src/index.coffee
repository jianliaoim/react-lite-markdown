require 'teambition-icon-fonts/css/teambition-ui-icons.css'

cx = require 'classnames'
React = require 'react'
assign = require 'object-assign'
marked = require 'marked'

renderer = require './util/renderer'

{ div } = React.DOM
T = React.PropTypes

markdownOption =
  breaks: true
  renderer: renderer
  sanitize: true

module.exports = React.createClass
  displayName: 'lite-markdown'

  propTypes:
    name: T.string
    value: T.string
    option: T.object
    className: T.string

  getDefaultProps: ->
    name: ''
    value: ''
    option: markdownOption
    className: ''

  getClassName: ->
    className = cx 'lite-markdown', "is-#{ @props.name }": @props.name? and @props.name.length

  getMarkup: ->
    marked @props.value, assign markdownOption, @props.option

  render: ->
    div className: @getClassName(),
      div className: @props.className, dangerouslySetInnerHTML: __html: @getMarkup()
