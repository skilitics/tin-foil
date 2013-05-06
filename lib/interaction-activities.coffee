TinFoilObject = require './tin-foil-object'
TinFoilCollection = require './tin-foil-collection'

class InteractionActivities extends TinFoilObject

  @prop 'interactionType', as: String
  @prop 'correctResponsePattern', as: TinFoilCollection, aliases: ['add_correct_response_pattern']
  @prop 'choices', as: TinFoilCollection, aliases: ['add_choice']

module.exports = InteractionActivities
