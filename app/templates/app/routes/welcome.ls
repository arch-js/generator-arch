require! <[ reflex ]>
layout = reflex.dom require '../components/layout'
layout-tpl = require '../lib/layout'

d = reflex.DOM

module.exports = React.create-class do
  display-name: 'welcome-page'
  get-layout-template: -> layout-tpl.layout
  get-title: -> layout-tpl.title "Welcome"
  render: ->
    layout do
      d.h1 "Welcome! This is your first Reflex app."
      d.p (@props.app-state.get \message).deref!
