MarkdownIt = require 'markdown-it'
MarkdownItAttrs = require('markdown-it-attrs')

markdown = new MarkdownIt()
.set
  linkify: true
  typographer: true
  breaks: true
  html: true
.use MarkdownItAttrs
.disable 'image'

# exports

exports.renderer = markdown
