TinFoilObject = require './tin-foil-object'
Util = require './util'

class Result extends TinFoilObject

  @scored_from: (fn) -> @scored_as fn
  @scored_as: (score) ->
    @score = score
    this

module.exports = Result
