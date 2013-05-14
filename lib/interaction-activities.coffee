TinFoil = require './tin-foil'
TinFoilCollection = require './tin-foil-collection'

class InteractionActivities extends TinFoil

  @define 'interactionType', as: String, with_alias: 'interaction_type'
  @define 'correctResponsePattern', as: TinFoilCollection, with_alias: 'add_correct_response_pattern'
  @define 'choices', as: TinFoilCollection, with_alias: 'add_choice'

module.exports = InteractionActivities
