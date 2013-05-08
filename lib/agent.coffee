TinFoil = require './tin-foil'
InverseFunctionalIdentifer = require './inverse-functional-identifer'

class Agent extends TinFoil

  @set 'objectType', to: 'Agent'

  @define 'name', as: String, aliases: ['named', 'name_from']

  @mixin InverseFunctionalIdentifer

module.exports = Agent
