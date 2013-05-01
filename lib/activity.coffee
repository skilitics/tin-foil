TinCanObject = require './tin-can-object'
ActivityDefinition = require './activity-definition'

URI = String

class Activity extends TinCanObject

  @set 'objectType', to: 'Activity'

  @add 'id', URI, 'identified_as', 'identify_from'
  @add 'definition', ActivityDefinition

module.exports = Activity
