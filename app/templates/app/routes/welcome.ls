require! <[ react reflex ]>
require! <[ ../components/layout ]>

d = react.DOM

module.exports = reflex.create-component do
  display-name: 'welcome-page'
  render: ->
    layout null,
      d.h1 null, "Welcome! This is your first Reflex app."
      d.p null, (@props.app-state.get \message).deref!