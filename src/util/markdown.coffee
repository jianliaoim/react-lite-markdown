MarkdownIt = require 'markdown-it'
MarkdownItEmoji = require 'markdown-it-emoji'

markdown = new MarkdownIt()
.set linkify: true, typographer: true
.use MarkdownItEmoji
.disable 'image'

exports.renderer = markdown

exports.setEmojiFn = (fn) ->
  markdown.renderer.rules.emoji = (token, idx) =>
    if token[idx].type is 'emoji'
      fn ":#{ token[idx].markup }:"
