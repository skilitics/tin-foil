TinFoilObject = require './tin-foil-object'
TinFoilMap = require './tin-foil-map'
Agent = require './agent'

UUID = String
Group = {}
ContextActivities = {}

class Context extends TinFoilObject

  @prop 'registration', as: UUID, aliases: ['registered_as', 'registration_from']
  @prop 'instructor', as: Agent
  @prop 'team', as: Group, 'teamed_as', 'team_from'
  @prop 'contextActivities', ContextActivities
  @prop 'revision', as: String, aliases: ['revisioned_as', 'revision_from']
  @prop 'platform', as: String, aliases: ['platform_as', 'platform_from']
  @prop 'language', as: String, aliases: ['language_as', 'language_from']

#  @prop 'statement', Statement

  @prop 'extensions', as: TinFoilMap, aliases: ['with_extension']

module.exports = Context
