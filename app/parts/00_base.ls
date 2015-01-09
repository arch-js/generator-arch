module.exports =
  initializing:
    main: ->
      @context =
        name: @options.name
        dir: @options.dir
        scripts: {}

  prompting:
    main: ->
      done = @async!
      prompts = []

      unless @options.name => prompts.push do
        name: 'name'
        message: 'Project name'
        default: @appname.replace ' ', '-'

      unless @options.dir => prompts.push do
        name: 'dir'
        message: 'Project directory'
        default: @options.dir or '.'

      prompts.push do
        name: 'tasks'
        message: 'Task runner'
        default: 'gulp'
        type: 'list'
        choices:
          * name: 'Gulp'
            value: 'gulp'
          * name: 'None'
            value: 'none'

      @prompt prompts, (answers) ~>
        @context = @context import answers

        @package.name = answers.name if answers.name

        switch answers.tasks
        | 'gulp'
          @context.scripts = @context.scripts import build: './node_modules/.bin/gulp'

        @package.scripts = JSON.stringify @context.scripts

        done!

  configuring:
    main: ->
      @destinationRoot @context.dir

  writing:
    script-files: ->
      /** TODO: Add script files (e.g. Gulpfile) most
          likely as subgenerators.           **/

    app: ->
      @fs.copy @template-path('_.gitignore'), @destination-path('.gitignore')
      @fs.copy @template-path('app/**/*'), @destination-path('app')

  run-npm:
    install: ->
      unless @options['skip-install']
        @npm-install!

  end:
    main: ->
      @config.save!
      console.log 'Your Reflex app has been generated! Use \'reflex s\'  to run it.'
