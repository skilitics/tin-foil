TinFoilCollection = require './tin-foil-collection'
TinFoilMap = require './tin-foil-map'

keywords = ['extend', 'mixin', 'set', 'get', 'prop', 'hasDefinition', 'add', 'compile', '_mapDefinitionAliases', '_mapNormalAlias',
            '_mapNestedAliases', '_mapTinFoilCollectionAlias', '_mapTinFoilMapAlias']

class TinFoil

  constructor: ->
    @properties = {}
    @properties[name] = @buildProperty definition for own name, definition of @_definitions

  buildProperty: (definition) ->
    name: definition.name
    type: definition.type
    value: definition.defaultValue

  @extend: (statics) ->
    class Result extends this
    Result.mixin(statics) if statics
    Result._definitions = {}
    Result

  @mixin: (obj) ->
    for own name, prop of obj._definitions
      @_definitions[name] = prop
      @_mapDefinitionAliases prop
    this

  @set: (name, options) ->
    throw 'You must provide a value or set of options when setting a definition' unless options

    @define name,
      as: options.as or {}
      default_as: options.to or options.defaultAs or options
      aliases: options.with_aliases or options.aliases or []

  @definition: (name) ->
    definition = findDefinition this, name
    throw Error "Property [#{name}] has not been defined" unless definition
    definition

  @hasDefinition: (name) -> findDefinition this, name

  @definitions: -> allDefinitions this

  @define: (name, options, mapAliases = true) ->
    @_definitions ?= {}

    if options
      type = options.as or options.type or {}
      defaultValue = options.default_as or options.defaultValue or null
      aliases = if options.with_alias then [options.with_alias] else options.with_aliases or options.aliases or []
      prefix = options.with_prefix or options.prefix or ''
    else
      type = {}
      defaultValue = null
      aliases = []
      prefix = ''

    # Special types
    if type.isTinFoil
      type = type.extend()

    if type is TinFoilCollection or type is TinFoilMap
      defaultValue = new type

    # We don't want to re-create aliases if it already exists
    if @_definitions[name] then mapAliases = false

    definition = @_definitions[name] =
      name: name
      type: type
      defaultValue: defaultValue
      aliases: aliases

    @_mapDefinitionAliases definition, prefix if mapAliases

    this

  # TODO: Make this an instance method
  @compile: (data) ->
    object = {}

    for own name, property of @_definitions
      val = null

      if property.type.isTinFoil
        val = property.type.compile data

      else if property.type is TinFoilCollection or property.type is TinFoilMap
        val = property.defaultValue.compile data

      else if property.defaultValue
        if property.defaultValue instanceof Function
          val = property.defaultValue.call this, data
        else
          val = property.defaultValue

      object[name] = val if val

    object

  @_mapDefinitionAliases: (definition, prefix = '') ->
    name = definition.name
    type = definition.type
    aliases = definition.aliases

    if type?.isTinFoil
      method = @_mapTinFoilAlias

    else if type == TinFoilCollection
      method = @_mapTinFoilCollectionAlias

    else if type == TinFoilMap
      method = @_mapTinFoilMapAlias

    else
      method = @_mapNormalAlias

    method.call this, definition, "#{prefix}#{alias}" for alias in aliases
    this

  @_mapNormalAlias: (definition, alias) ->
    # TODO: Check alias name against keywords
    # TODO: Should we allow overriding aliases?
    @[alias] = (val) ->
      def = @definition definition.name
      throw Error "Definition [#{name}] not found" unless def
      @define definition.name,
        type: def.type
        defaultValue: val
        aliases: def.aliases.slice(0)
        false
      this

    this

  @_mapTinFoilAlias: (definition, alias) ->
    for own name, definition of type.definitions
      @_mapDefinitionAliases name, "#{prefix}#{name}"

    this

  @_mapTinFoilCollectionAlias: (definition, alias) ->
    @[alias] = (val) =>
      definition.defaultValue.add val
      this

    this

  @_mapTinFoilMapAlias: (definition, alias) ->
    @[alias] = (key, value) =>
      definition.defaultValue.add key, value
      this

    this

  @isTinFoil: true


findDefinition = (context, name) ->
  definition = findLocalDefinition name, context._definitions

  return definition if definition

  parent = context.__super__?.constructor
  if parent and parent._definitions
    definition = findDefinition parent, name

  definition

findLocalDefinition = (name, definitions) ->
  for own key, definition of definitions
    if key == name then return definition

allDefinitions = (context, result = {}) ->
  for own name, definition of context._definitions
    result[name] = definition if !result[name]

  if context.__super__?.constructor?._definitions
    allDefinitions context.__super__.constructor, result

  result

module.exports = TinFoil
