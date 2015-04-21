module.exports =
  initializing:
    main: ->
      @context = {}

  prompting: {}

  configuring:
    main: ->
      @destination-root @context.answers.dir
      @package.name = @context.answers.name if @context.answers.name

  writing:
    main: ->
      @fs.copy @template-path('_.gitignore'), @destination-path('.gitignore')
      @fs.copy @template-path('app/**/*'), @destination-path('app')

  end:
    install: ->
      unless @options['skip-install']
        @npm-install!

    main: ->
      @config.save!
      console.log 'Your Arch app has been generated! Use \'arch s\'  to run it.'
