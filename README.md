React Lite Markdown
===================
[![Build status][travis-image]][travis-url]


Introduction
------------

React markdown renderer of [简聊](http://jianliao.com)


Usage
-----

Install

```bash
npm i react-lite-markdown --save
```

Library

```coffeescript
React = require 'react'

LiteMarkdown = React.createFactory require 'react-lite-markdown'

React.render LiteMarkdown(), document.body
```

Stylesheet (It's optional, you can @import your own prefer.)

```less
@import "~react-lite-markdown/style/markdown.css";
```


Examples
--------
Read [example][example-url] for full details.

```coffeescript
# props
T = React.PropTypes

propTypes:
  name: T.string # For classname appear in component, with "is-#{@props.name}".
  value: T.string # Markdown content.
  emojify: T.func # Specific emoji func in 简聊 project, you may not use it
  className: T.string # Markdown content classname.
```

Develop
-------
* First, you should `npm i` to install dependencies.
* Run `npm start` to begin dev mode with *Webpack Dev Server*.
* Once completed, run `npm test` see if test is passed.

Welcome to contribute.


License
-------
[MIT](https://opensource.org/licenses/MIT)


[example-url]: https://github.com/teambition/react-lite-markdown/tree/master/example
[travis-url]: https://travis-ci.org/teambition/react-lite-markdown
[travis-image]: https://travis-ci.org/teambition/react-lite-markdown.svg?branch=master
