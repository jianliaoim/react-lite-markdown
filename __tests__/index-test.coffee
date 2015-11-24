jest.dontMock '../src/index'

React = require 'react/addons'

LiteMarkdown = React.createFactory require '../src/index'

TestUtils = React.addons.TestUtils

describe 'LiteMarkdown', ->

  it 'Should render one classname without name props.', ->
    component = TestUtils.renderIntoDocument LiteMarkdown()
    node = React.findDOMNode component

    expect(node.className).toEqual('lite-markdown')

  it 'Should render two classnames if given name props.', ->

    component = TestUtils.renderIntoDocument LiteMarkdown name: 'test'
    node = React.findDOMNode component

    expect(node.className).toEqual('lite-markdown is-test')
