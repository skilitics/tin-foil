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

  @definition_type_from: (fn) -> @definition_type_as fn
  @definition_type_as: (type) ->
    @definitionType = type
    this

  @definition_named_from: (fn) -> @definition_named_as fn
  @definition_named_as: (name) ->
    @definitionName = name
    this

  @definition_described_by: (fn) -> @definition_described_as fn
  @definition_described_as: (description) ->
    @definitionDescription = description
    this

  # Compliation

  @compile: (event) ->
    objectType: Util.callOrReturn(this, @objectType, event)
    id: Util.callOrReturn(this, @id, event)
    definition:
      type: Util.callOrReturn(this, @definitionType, event)
      name: Util.callOrReturn(this, @definitionName, event)
      description: Util.callOrReturn(this, @definitionDescription, event)
    extensions: @compileExtensions(event)

module.exports = TinCanObject
