Extensions =
  extends_with: (key, value) ->
    @extensions ?= {}
    @extensions[key] = value
    this

  compileExtensions: (event) ->
    # Loop through the extensions and apply the value or call the fun passing in event
    this

module.exports = Extensions
