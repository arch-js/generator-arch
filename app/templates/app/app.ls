# module dependencies
require! <[ reflex ]>

# route components
require! <[
  ./routes/welcome
]>

initial-state =
  message: 'I am immutable!'

module.exports = reflex.application.create do
  get-initial-state: ->
    initial-state

  start: (app-state) ->
    app-state.get \message .update -> 'I was updated!'

  routes: ->
    page = reflex.routes.page

    reflex.routes.define do
      page '/', welcome
