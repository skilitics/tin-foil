class DefinitionLoader

  constructor: (context) ->
    @setLoadContext(context)

  setLoadContext: (context) ->
    @context = context

  findDefinition: (type) ->
    if !type then return compile: (event) ->
    if type instanceof Function then return type

    # If a load context was set, find our definitions in there
    if @context then return @context[type]

    throw Error 'Nowhere to load definition from'

module.exports = DefinitionLoader