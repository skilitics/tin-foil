TinCanObject = require './tin-can-object'
Util = require './util'

class Result extends TinCanObject

  @scored_from: (fn) -> @scored_as fn
  @scored_as: (score) ->
    @score = score
    this

module.exports = Result
