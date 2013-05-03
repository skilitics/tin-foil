TinFoilObject = require './tin-foil-object'
Agent = require './agent'
Extensions = require './extensions'

UUID = String
Group = {}
ContextActivities = {}

class Context extends TinFoilObject

  @prop 'registration', as: UUID, aliases: ['registered_as', 'registration_from']
  @prop 'instructor', Agent
  @prop 'team', Group, 'teamed_as', 'team_from'
  @prop 'contextActivities', ContextActivities
  @prop 'revision', as: String, aliases: ['revisioned_as', 'revision_from']
  @prop 'platform', as: String, aliases: ['platform_as', 'platform_from']
  @prop 'language', String, 'language_as', 'language_from'
#  @prop 'statement', Array
  @prop 'extensions', Extensions

module.exports = Context
