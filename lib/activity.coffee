TinFoilObject = require './tin-foil-object'
ActivityDefinition = require './activity-definition'

URI = String

class Activity extends TinFoilObject

  @set 'objectType', 'Activity'

  @prop 'id', as: URI, aliases: ['identified_as', 'identify_from']
  @prop 'definition', as: ActivityDefinition

module.exports = Activity
