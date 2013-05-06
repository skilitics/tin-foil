
class TinFoilMap

  constructor: ->
    @map = {}

  add: (key, value) ->
    @map[key] = value
    this

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
