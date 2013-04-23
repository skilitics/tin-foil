Module = require './module'
Extensions = require './extensions'

class TinCanObject extends Module

  @mixin Extensions

  # Fluent API
  @of_type: (type) -> @objectType = type
  @identified_by: (identifier) -> @id = identifier

  # Compliation
  compileLangNames: ->

  compileLangDescriptions: ->

  compile: (event) ->
    objectType: @objectType
    id: @id.call(this, event)
    definition:
      name: @compileLangNames()
      description: @compileLangDescriptions()
    extensions: @compileExtensions(event)

module.exports = TinCanObject
