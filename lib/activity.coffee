TinFoil = require './tin-foil'
ActivityDefinition = require './activity-definition'

URI = String

class Activity extends TinFoil

  @set 'objectType', to: 'Activity'

  @define 'id', as: URI, with_aliases: ['identified_as', 'identify_from']
  @define 'definition', as: ActivityDefinition, with_prefix: 'definition_'

module.exports = Activity
