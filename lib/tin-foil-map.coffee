
class TinFoilMap

  constructor: ->
    @map = {}

  add: (key, value) ->
    @map[key] = value
    this

  compile: (event) ->
    map = {}
    for own key, value of @map
      if value instanceof Function
        map[key] = value.call(this, event)
      else
        map[key] = value
    map

module.exports = TinFoilMap
