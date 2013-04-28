Module = require './module'

class Verb extends Module

  @identified_as: (id) ->
    @id = id
    this

  @displayed_as: (display) ->
    @display = display
    this

  @compile: ->
    id: @id
    display: @display

module.exports = Verb
