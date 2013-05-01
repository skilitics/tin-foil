TinCanObject = require './tin-can-object'

class InteractionActivities extends TinCanObject

  @add 'interactionType', String
  @add 'correctResponsePattern', Array
  @add 'choices', Array

module.exports = InteractionActivities
