module.exports =
  initializing:
    main: ->
      @context = {}

  prompting: {}

  configuring:
    main: ->
      @destination-root @context.answers.dir
      @package.name = @context.answers.name if @context.answers.name
      switch @context.answers.tasks
      | 'gulp'
        @package.scripts = @package.scripts import build: './node_modules/.bin/gulp'
        @package.dependencies = @package.dependencies import gulp: '^3.8.10'

  writing:
    main: ->
      switch @context.answers.tasks
      | 'gulp' => @fs.copy @template-path('_Gulpfile.ls'), @destination-path('Gulpfile.ls')
      @fs.copy @template-path('_.gitignore'), @destination-path('.gitignore')
      @fs.copy @template-path('app/**/*'), @destination-path('app')

  end:
    install: ->
      unless @options['skip-install']
        @npm-install!

    main: ->
      @config.save!
      console.log 'Your Reflex app has been generated! Use \'reflex s\'  to run it.'
