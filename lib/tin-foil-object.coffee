moduleKeywords = ['mixin', 'extend']

class TinFoilObject

  @mixin: (obj, prefix) ->
    throw new Error('mixin(obj) requires obj') unless obj
    for own key, value of obj when key not in moduleKeywords
      @["#{prefix}#{key}"] = value

    this

  @set: (name, value, aliases = []) ->
    @props ?= {}

    prop = @props[name] or {}
    prop.value = value
    prop.aliases = aliases
    delete prop.type if prop.type

    @props[name] = prop
    this

  @get: (name) ->
    throw Error "Property [#{name}] has not been defined" unless @hasProp name
    @props[name]

  @prop: (name, options) ->
    return @get name unless options
    @add name, options.as, options.aliases
    this

  @hasProp: (name) -> !!@props and !!@props[name]

  @add: (propertyName, type, aliases = []) ->
    @props ?= {}
    @props[propertyName] =
      name: propertyName
      type: type
      value: null
      aliases: aliases

    if type?.prototype instanceof TinFoilObject
      @_mapExtensionAliases propertyName, type
    else
      @_addPropertyMethodAlias propertyName, type, alias, @props for alias in aliases

    this

  @_addPropertyMethodAlias: (propertyName, type, alias, propertyStore) ->
    @[alias] = (val) =>
      propertyStore[propertyName] =
        name: propertyName
        type: type
        value: val
        aliases: []
      this

    this

  @_mapExtensionAliases: (propertyName, extensionType) ->
    for own name, property of extensionType.props
      for alias in property.aliases
        @_addPropertyMethodAlias name, extensionType, "#{propertyName}_#{alias}", extensionType.props

    this

  @extend: (statics) ->
    class Result extends this
    Result.mixin(statics) if statics
    Result

  @compile: (event) ->
    object = {}

    for own name, property of @props
      if property.value
        if property.value instanceof Function
          val = property.value.call(this, event)
        else
          val = property.value
      else if property.type?.prototype instanceof TinFoilObject
        val = property.type.compile(event)

      object[name] = val

    object


module.exports = TinFoilObject
