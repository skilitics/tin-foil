TinFoilObject = require './tin-foil-object'
InverseFunctionalIdentifer = require './inverse-functional-identifer'

class Agent extends TinFoilObject

  @set 'objectType', to: 'Agent'

  @prop 'name', as: String, aliases: ['named', 'name_from']

  @mixin InverseFunctionalIdentifer

module.exports = Agent
