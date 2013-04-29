Util = require './util'

Extensions =
  extends_with: (key, value) ->
    @extensions ?= {}
    @extensions[key] = value
    this

  compileExtensions: (event) ->
    exts = {}
    exts[key] = Util.callOrReturn(this, value, event) for own key, value of @extensions
    exts

module.exports = Extensions
