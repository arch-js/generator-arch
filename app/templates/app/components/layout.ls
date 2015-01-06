require! <[ react reflex ]>

d = react.DOM

module.exports = reflex.create-component do
  display-name: 'layout'

  render: ->
    d.div class-name: 'wrapper',
      @props.children
