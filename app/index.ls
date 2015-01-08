require!{
  'yeoman-generator': {generators}
  chalk
  yosay
}

module.exports = generators.Base.extend do
  initializing: ->
    @context =
      name: @options.name
      dir: @options.dir
    @pkg = require '../package.json'

  prompting: ->
    done = @async!
    prompts = []

    unless @options.name => prompts.push do
      name: 'name'
      message: 'Project name'
      default: @appname

    unless @options.dir => prompts.push do
      name: 'dir'
      message: 'Project directory'
      default: @options.dir or '.'

    @prompt prompts, (answers) ~>
      @context = @context import answers
      done!

  configuring: ->
    @destinationRoot @context.dir

  writing:
    directory-structure: ->
      @mkdir 'app'
      @mkdir 'app/components'
      @mkdir 'app/layouts'
      @mkdir 'app/routes'

    package: ->
      @template '_package.json', 'package.json', @context

    app: ->
      @fs.copy @template-path('_.gitignore'), @destination-path('.gitignore')
      @fs.copy @template-path('app/**/*'), @destination-path('app')

  run-npm: ->
    unless @options['skip-install']
      @npm-install!

  end: ->
    @config.save!
    console.log 'Your Reflex app has been generated! Use \'reflex s\'  to run it.'
