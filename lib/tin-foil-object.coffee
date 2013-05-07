TinFoilCollection = require './tin-foil-collection'
TinFoilMap = require './tin-foil-map'

keywords = ['extend', 'mixin', 'set', 'get', 'prop', 'hasProp', 'add', 'compile', '_mapAliases', '_mapPropertyAlias',
            '_mapNestedAliases', '_mapTinFoilCollectionAliases', '_mapTinFoilMapAliases']

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

    @_mapAliases prop

    this

  @compile: (event) ->
    object = {}

    for own name, property of @props
      val = null

      if property.type == TinFoilCollection or property.type == TinFoilMap
        val = property.value.compile(event)

      else if property.type?.prototype instanceof TinFoilObject
        val = property.type.compile(event)

      else if property.value
        if property.value instanceof Function
          val = property.value.call(this, event)
        else
          val = property.value

      object[name] = val if val

    object

  @_mapAliases: (property, prefix = '', propertyStore = @props) ->
    name = property.name
    type = property.type
    aliases = property.aliases

    if type.prototype instanceof TinFoilObject
      @_mapTinFoilObjectAliases type, "#{name}_", type.props

    else if type == TinFoilCollection
      property.value = new type()
      @_mapTinFoilCollectionAliases property, prefix

    else if type == TinFoilMap
      property.value = new TinFoilMap
      @_mapTinFoilMapAliases property, prefix

    else
      @_mapPropertyAlias name, type, "#{prefix}#{alias}", propertyStore for alias in aliases

  @_mapPropertyAlias: (name, type, alias, propertyStore) ->
    @[alias] = (val) =>
      prop = propertyStore[name]
      throw Error "Property [#{name}] not found in store" unless prop
      prop.value = val
      this

    this

  @_mapTinFoilObjectAliases: (type, prefix = '', propertyStore = @props) ->
    for own name, property of type.props
      @_mapAliases property, prefix, propertyStore
#      for alias in property.aliases
#        @_addPropertyAlias name, extensionType, "#{propertyName}_#{alias}", extensionType.props

    this

  @_mapTinFoilCollectionAliases: (property, prefix = '') ->
    for alias in property.aliases
      @["#{prefix}#{alias}"] = (val) =>
        property.value.add val
        this

    this

  @_mapTinFoilMapAliases: (property, prefix = '') ->
    for alias in property.aliases
      @["#{prefix}#{alias}"] = (key, value) =>
        property.value.add key, value
        this

    this

module.exports = TinFoilObject
