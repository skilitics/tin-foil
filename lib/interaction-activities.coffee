TinFoil = require './tin-foil'
TinFoilCollection = require './tin-foil-collection'

class InteractionActivities extends TinFoil

  @define 'interactionType', as: String
  @define 'correctResponsePattern', as: TinFoilCollection, with_aliases: ['add_correct_response_pattern']
  @define 'choices', as: TinFoilCollection, with_aliases: ['add_choice']

module.exports = InteractionActivities
