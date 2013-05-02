# This is taken from Spine. It is what makes it possible (or at least simpler) to extend or instantiate objects in
# JavaScript, vs CoffeeScript.

moduleKeywords = ['mixin', 'extend']

class TinFoilObject

  @mixin: (obj, prefix) ->
    throw new Error('mixin(obj) requires obj') unless obj
    for own key, value of obj when key not in moduleKeywords
      if prefix
        @["#{prefix}_#{key}"] = value
      else
        @[key] = value
    this

  @set: (name, options) ->
    @props ?= {}
    @props[name] =
      type: null
      value: options.to
      aliases: []

    this

  @add: (propertyName, type, aliases...) ->
    @props ?= {}
    @props[propertyName] =
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
