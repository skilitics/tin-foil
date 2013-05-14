TinFoil = require './tin-foil'
TinFoilMap = require './tin-foil-map'
ContextActivities = require './context-activities'
Agent = require './agent'

UUID = String
Group = {}

class Context extends TinFoil

  @define 'registration', as: UUID, aliases: ['registered_as', 'registration_from']
  @define 'instructor', as: Agent
  @define 'team', as: Group, 'teamed_as', 'team_from'
  @define 'contextActivities', as: ContextActivities, with_prefix: 'context_'
  @define 'revision', as: String, aliases: ['revisioned_as', 'revision_from']
  @define 'platform', as: String, aliases: ['platform_as', 'platform_from']
  @define 'language', as: String, aliases: ['language_as', 'language_from']

#  @define 'statement', Statement

  @define 'extensions', as: TinFoilMap, aliases: ['with_extension']

module.exports = Context
