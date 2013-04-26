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

  as: (actor, options) ->
    @actor = actor

    return this unless options
    # Look-up available verbs for eventName

    if options.i then @i(options.i)

    if options.for_a then @for_a options.for_a
    if options.an then @an options.an
    if options.a then @a options.a

    if options.in then @in(options.in)

    if options.resulting_in then @resulting_in(options.resulting_in)

    this

  i: (verb) ->
    @verb = verb
    this

  for_a: (object) -> a(object)
  an: (object) -> a(object)
  a: (object) ->
    @object = object
    this

  in: (context) ->
    @context = context
    this

  resulting_in: (result) ->
    @result = result
    this

  # Compiliation
  compile: (event) ->
    actor: @actor?.compile event
    verb: @verb?.compile()
    object: @object?.complie event
    context: @context?.complie event
    result: @result?.complie event

module.exports = Statement
