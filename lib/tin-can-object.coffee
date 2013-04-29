Module = require './module'
Extensions = require './extensions'
Util = require './util'

class TinCanObject extends Module

  @mixin Extensions

  # Fluent API
  @of_type: (type) ->
    @objectType = type
    this

  @identified_as: (identifier) ->
    @id = identifier
    this

  @identified_by: (fn) ->
    @id = fn
    this

  @named: (name) ->
    @definitionName = name
    this

  @named_from: (fn) ->
    @definitionName = fn
    this

  @described_as: (description) ->
    @definitionDescription = description
    this

  @described_by: (fn) ->
    @definitionDescription = fn
    this

  # Compliation

  @compile: (event) ->
    objectType: Util.callOrReturn(this, @objectType, event)
    id: Util.callOrReturn(this, @id, event)
    definition:
#      type: @type
      name: Util.callOrReturn(this, @definitionName, event)
      description: Util.callOrReturn(this, @definitionDescription, event)
    extensions: @compileExtensions(event)

module.exports = TinCanObject
