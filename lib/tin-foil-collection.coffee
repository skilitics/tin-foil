
class TinFoilCollection

  constructor: ->
    @collection = []

  add: (item) ->
    @collection.push item
    this

  compile: (event) ->
    result = []
    for item in @collection
      if item instanceof Function
        result.push item.call(this, event)
      else
        result.push item

    if result.length then result else null

module.exports = TinFoilCollection
