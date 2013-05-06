TinFoilObject = require './tin-foil-object'

class InteractionActivities extends TinFoilObject

  @prop 'interactionType', as: String
  @prop 'correctResponsePattern', as: Array
  @prop 'choices', as: Array

module.exports = InteractionActivities
