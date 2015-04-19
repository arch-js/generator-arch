require! <[ reflex ]>

d = reflex.DOM

module.exports = class
  display-name: 'layout'

  render: ->
    d.div class-name: 'wrapper',
      @props.children
