module.exports = ->
  initializing:
    package: ->
      @package =
        name: @options.name
        scripts: {}

  writing:
    package: ->
      @template '_package.json', 'package.json', @package
