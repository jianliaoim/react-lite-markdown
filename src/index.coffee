cx = require 'classnames'
React = require 'react'
assign = require 'object-assign'
marked = require 'marked'

renderer = new marked.Renderer()

renderer.heading = (text, level) ->
  """
    <h#{level}>#{ text }</h#{level}>
  """

{ div } = React.DOM
T = React.PropTypes

markdownOption =
  gfm: true
  tables: true
  breaks: true
  pedantic: false
  renderer: renderer
  sanitize: false
  smartLists: true
  smartypants: true

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
    __html: marked @props.value, assign markdownOption, @props.option

  render: ->
    div className: @getClassName(),
      div className: @props.className, dangerouslySetInnerHTML: @getMarkup()
