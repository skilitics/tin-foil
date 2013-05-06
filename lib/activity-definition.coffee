TinFoilObject = require './tin-foil-object'
TinFoilMap = require './tin-foil-map'
LanguageMap = {}
InteractionActivities = require './interaction-activities'
URI = String
URL = String

class ActivityDefinition extends TinFoilObject

  @prop 'name', as: LanguageMap, aliases: ['named', 'name_from']
  @prop 'description', as: LanguageMap, aliases: ['described_as', 'description_from']
  @prop 'type', as: URI, aliases: ['typed_as', 'type_from']
  @prop 'moreinfo', as: URL, aliases: ['more_info_as', 'more_info_from']
  @mixin InteractionActivities
  @prop 'extensions', as: TinFoilMap, aliases: ['with_extension']

module.exports = ActivityDefinition
