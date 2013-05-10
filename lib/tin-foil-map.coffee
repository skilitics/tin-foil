
class TinFoilMap

  constructor: ->
    @map = {}

  add: (key, value) ->
    @map[key] = value
    this

  get: (key) ->
    value = @map[key]
    throw Error "#{key} not found in map" unless value
    value

  compile: (event) ->
    map = {}
    hasKeys = false

    for own key, value of @map
      hasKeys = true
      if value instanceof Function
        map[key] = value.call(this, event)
      else
        map[key] = value

    if hasKeys then map else null

module.exports = TinFoilMap
