require! <[ arch ./base-route ]>
layout = arch.dom require '../components/layout'

d = arch.DOM

module.exports = class extends base-route
  display-name: 'welcome-page'
  get-title: -> super "Welcome!"
  render: ->
    layout do
      d.h1 "Welcome! This is your first Arch app."
      d.p (@props.app-state.get \state.message).deref!
