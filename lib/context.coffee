TinFoilObject = require './tin-foil-object'
Agent = require './agent'
Extensions = require './extensions'

UUID = String
Group = {}
ContextActivities = {}

class Context extends TinFoilObject

  @prop 'registration', as: UUID, aliases: ['registered_as', 'registration_from']
  @add 'instructor', Agent
  @add 'team', Group, 'teamed_as', 'team_from'
  @add 'contextActivities', ContextActivities
  @add 'revision', String, 'revisioned_as', 'revision_from'
  @add 'platform', String, 'platform_as', 'platform_from'
  @add 'language', String, 'language_as', 'language_from'
#  @add 'statement', String
  @add 'extensions', Extensions

module.exports = Context
