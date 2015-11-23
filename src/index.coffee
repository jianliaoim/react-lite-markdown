cx = require 'classnames'
React = require 'react'
MarkdownIt = require 'markdown-it'
MarkdownItEmoji = require 'markdown-it-emoji'

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
    @md = new MarkdownIt()
    .use MarkdownItEmoji
    .disable 'image'

    @md.renderer.rules.emoji = (token, idx) =>
      if token[idx].type is 'emoji'
        @props.emojify.replace ":#{ token[idx].markup }:"

  getClassName: ->
    className = cx 'lite-markdown', "is-#{ @props.name }": @props.name? and @props.name.length

  getMarkup: ->
    @md.render @props.value

  render: ->
    div className: @getClassName(),
      div className: @props.className, dangerouslySetInnerHTML: __html: @getMarkup()
