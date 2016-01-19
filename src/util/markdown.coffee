MarkdownIt = require 'markdown-it'
MarkdownItEmoji = require 'markdown-it-emoji'
MarkdownItAttrs = require('markdown-it-attrs')

markdown = new MarkdownIt()
.set
  linkify: true
  typographer: true
  breaks: true
.use MarkdownItEmoji
.use MarkdownItAttrs
.disable 'image'

# exports

exports.renderer = markdown

exports.setEmojiFn = (fn) ->
  markdown.renderer.rules.emoji = (token, idx) =>
    if token[idx].type is 'emoji'
      fn ":#{ token[idx].markup }:"
