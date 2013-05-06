DefinitionLoader = require './definition-loader'

class Statement

  # LRS assigns:
  # - id
  # - timestamp (if blank)
  # - stored
  # - authority

  # Actor
  @as: (actor, options) ->
    statement = new Statement
    statement.as(actor, options)
    statement

  constructor: ->
    @definitionLoader = new DefinitionLoader()

  loadDefinitionsFrom: (definitionLoader) ->
    @definitionLoader = definitionLoader
    this

  as: (actor, options) ->
    @actor = actor

    return this unless options
    # Look-up available verbs for eventName

    if options.i then @i(options.i)

    if options.for_a then @for_a options.for_a
    if options.an then @an options.an
    if options.a then @a options.a

    if options.in_a then @in_a options.in_a
    if options.in then @in options.in

    if options.resulting_in_a then @resulting_in_a options.resulting_in_a
    if options.resulting_in then @resulting_in options.resulting_in

    if options.at then @at options.at

    this

  i: (verb) ->
    @verb = verb
    this

  for_a: (object) -> @a object
  an: (object) -> @a object
  a: (object) ->
    @object = object
    this

  in_a: (context) -> @in context
  in: (context) ->
    @context = context
    this

  resulting_in_a: (result) -> @resulting_in result
  resulting_in: (result) ->
    @result = result
    this

  at: (timestamp) ->
    @timestamp = timestamp
    this

  compile: (event) ->
    actor: @definitionLoader.findDefinition(@actor).compile event
    verb: @definitionLoader.findDefinition(@verb).compile()
    object: @definitionLoader.findDefinition(@object).compile event
    context: @definitionLoader.findDefinition(@context).compile event
    result: @definitionLoader.findDefinition(@result).compile event
    timestamp: @timestamp

module.exports = Statement
