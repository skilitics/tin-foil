TinFoilCollection = require './tin-foil-collection'
TinFoilMap = require './tin-foil-map'

keywords = ['extend', 'mixin', 'set', 'get', 'prop', 'hasProp', 'add', 'compile', '_mapAliases', '_addPropertyAlias',
            '_mapNestedAliases', '_mapCollectionAliases', '_mapMapAliases']

class TinFoilObject

  @extend: (statics) ->
    class Result extends this
    Result.mixin(statics) if statics
    Result

  @mixin: (obj) ->
    for own name, prop of obj.props
      @props[name] = prop
      @_mapAliases prop
    this

  @set: (name, value, aliases = []) ->
    @prop name, default_as: value.to || value, aliases: aliases

  @get: (name) ->
    throw Error "Property [#{name}] has not been defined" unless @hasProp name
    @props[name]

  @hasProp: (name) -> !!@props and !!@props[name]

  @prop: (name, options) ->
    if options
      type = options.as
      value = options.default_as
      aliases = options.aliases

    type ?= {}
    value ?= null
    aliases ?= []

    @props ?= {}

    prop = @props[name] =
      name: name
      type: type
      value: value
      aliases: aliases

    if aliases then @_mapAliases prop

    this

  @compile: (event) ->
    object = {}

    for own name, property of @props
      if property.type == TinFoilCollection or property.type == TinFoilMap
        val = property.value.compile(event)

      else if property.type?.prototype instanceof TinFoilObject
        val = property.type.compile(event)

      else if property.value
        if property.value instanceof Function
          val = property.value.call(this, event)
        else
          val = property.value

      object[name] = val

    object

  @_mapAliases: (property) ->
    name = property.name
    type = property.type
    aliases = property.aliases

    if type.prototype instanceof TinFoilObject
      @_mapNestedAliases name, type

    else if type == TinFoilCollection
      property.value = new type()
      @_mapCollectionAliases property

    else if type == TinFoilMap
      property.value = new TinFoilMap
      @_mapMapAliases property

    else
      @_addPropertyAlias name, type, alias, @props for alias in aliases

  @_addPropertyAlias: (propertyName, type, alias, propertyStore) ->
    @[alias] = (val) =>
      prop = propertyStore[propertyName]
      throw Error "Property [#{propertyName}] not found in store" unless prop
      prop.value = val
      this

    this

  @_mapNestedAliases: (propertyName, extensionType) ->
    for own name, property of extensionType.props
      for alias in property.aliases
        @_addPropertyAlias name, extensionType, "#{propertyName}_#{alias}", extensionType.props

    this

  @_mapCollectionAliases: (property) ->
    for alias in property.aliases
      @[alias] = (val) =>
        property.value.add val
        this

    this

  @_mapMapAliases: (property) ->
    for alias in property.aliases
      @[alias] = (key, value) =>
        property.value.add key, value
        this

    this

module.exports = TinFoilObject
