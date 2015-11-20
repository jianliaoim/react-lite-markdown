marked = require 'marked'

renderer = new marked.Renderer()

renderer.heading = (text, level) ->
  """
    <h#{ level }>#{ text }</h#{ level }>
  """

renderer.image = (href, title, text) ->
  """
    <a href=#{ href } #{ if title? then 'title=' + title else '' }>#{ text }</a>
  """

module.exports = renderer