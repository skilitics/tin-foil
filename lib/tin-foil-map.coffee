
class TinFoilMap

  constructor: ->
    @map = {}

  add: (key, value) ->
    @map[key] = value
    this

  get: (key) ->
    value = @map[key]

    if !value then throw Error "#{key} not found in map"

    value

  extend: ->
    tinFoilMap = new TinFoilMap
    for own key, value of @map
      tinFoilMap.add key, value

    tinFoilMap

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
