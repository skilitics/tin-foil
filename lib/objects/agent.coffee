TinCanObject = require '../tin-can-object'

class Agent extends TinCanObject

  @of_type 'Agent'

  @named: (name) -> @name = name

  compile: (event) ->
    statement = super.compile(event)
    statement.name = @name

module.exports = Agent
