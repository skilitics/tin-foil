Module = require './module'
Util = require './util'

class Result extends Module

  @scored_from: (fn) -> @scored_as fn
  @scored_as: (score) ->
    @score = score
    this

  @compile: (event) ->
    score: Util.callOrReturn(this, @score, event)

module.exports = Result
