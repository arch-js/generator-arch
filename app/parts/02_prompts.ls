module.exports =
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

      @prompt prompts, (answers) ~>
        @context = @context import answers: answers
        done!
