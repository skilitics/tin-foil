TinFoilObject = require './tin-foil-object'
ActivityDefinition = require './activity-definition'

URI = String

class Activity extends TinFoilObject

  @set 'objectType', to: 'Activity'

  @add 'id', URI, 'identified_as', 'identify_from'
  @add 'definition', ActivityDefinition

module.exports = Activity
