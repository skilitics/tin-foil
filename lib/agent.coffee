TinCanObject = require './tin-can-object'
InverseFunctionalIdentifer = require './inverse-functional-identifer'

class Agent extends TinCanObject

  @set 'objectType', to: 'Agent'

  @add 'name', String, 'named', 'name_from'
  @add InverseFunctionalIdentifer

module.exports = Agent
