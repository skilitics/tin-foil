TinFoilObject = require './tin-foil-object'
InverseFunctionalIdentifer = require './inverse-functional-identifer'

class Agent extends TinFoilObject

  @set 'objectType', to: 'Agent'

  @add 'name', String, 'named', 'name_from'
  @add InverseFunctionalIdentifer

module.exports = Agent
