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
        @context = @context import answers: answers
        done!