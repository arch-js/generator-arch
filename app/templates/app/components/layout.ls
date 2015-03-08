require! <[ reflex ]>

d = reflex.DOM

module.exports = React.create-class do
  display-name: 'layout'

  render: ->
    d.div class-name: 'wrapper',
      @props.children
