TinCanObject = require '../tin-can-object'

class Activity extends TinCanObject

  @of_type 'Activity'

  compile: (event) ->
    statement = super.compile(event)
    statement.definition = @definition

module.exports = Activity
