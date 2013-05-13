
class TinFoilCollection

  constructor: ->
    @collection = []

  add: (item) ->
    @collection.push item
    this

  get: (index) -> @collection[index]

  extend: ->
    tinFoilCollection = new TinFoilCollection
    for item in @collection
      tinFoilCollection.add item

    tinFoilCollection

  compile: (event) ->
    result = []
    for item in @collection
      if item instanceof Function
        result.push item.call(this, event)
      else
        result.push item

    if result.length then result else null

module.exports = TinFoilCollection
