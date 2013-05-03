TinFoilObject = require './tin-foil-object'
Agent = require './agent'
Extension = require './extensions'

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
  @prop 'language', String, 'language_as', 'language_from'

#  @prop 'statement', Statement

  @prop 'extensions', as_map_of: Extension, aliases: ['with_extension']

module.exports = Context
