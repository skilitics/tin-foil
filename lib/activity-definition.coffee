TinFoil = require './tin-foil'
TinFoilMap = require './tin-foil-map'
InteractionActivities = require './interaction-activities'
LanguageMap = {}
URI = String
URL = String

class ActivityDefinition extends TinFoil

  @define 'name', as: LanguageMap, with_aliases: ['named', 'name_from']
  @define 'description', as: LanguageMap, with_aliases: ['described_as', 'description_from']
  @define 'type', as: URI, with_aliases: ['typed_as', 'type_from']
  @define 'moreinfo', as: URL, with_aliases: ['more_info_as', 'more_info_from']
  @mixin InteractionActivities
  @define 'extensions', as: TinFoilMap, with_aliases: ['with_extension']

module.exports = ActivityDefinition
