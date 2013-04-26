Module = require './module'

class Verb extends Module

  @identified_as: (id) -> @id = id
  @displayed_as: (display) -> @display = display

  @complie: ->
    id: @id
    display: @display

module.exports = Verb

