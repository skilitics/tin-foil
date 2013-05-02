TinFoilObject = require './tin-foil-object'

class InteractionActivities extends TinFoilObject

  @add 'interactionType', String
  @add 'correctResponsePattern', Array
  @add 'choices', Array

module.exports = InteractionActivities
