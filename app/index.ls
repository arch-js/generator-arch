require!{
  'yeoman-generator': yeoman
  chalk
  yosay
}

module.exports = yeoman.generators.Base.extend do
  initializing: ->
    @pkg = require '../package.json'

  writing:
    app: ->
      @fs.copy @template-path('_package.json'), @destination-path('package.json')
      @fs.copy @template-path('_.gitignore'), @destination-path('.gitignore')
      @fs.copy @template-path('app/**/*'), @destination-path('app')

  run-npm: ->
    @npm-install!

  end: ->
    console.log 'Your Reflex app has been generated! Use \'reflex s\'  to run it.'
