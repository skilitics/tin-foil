TinFoilObject = require './tin-foil-object'
#LanguageMap = require './language-map'
LanguageMap = Object
InteractionActivities = require './interaction-activities'
Extensions = require './extensions'
URI = String
URL = String

class ActivityDefinition extends TinFoilObject

  @prop 'name', as: LanguageMap, aliases: ['named', 'name_from']
  @prop 'description', as: LanguageMap, aliases: ['described_as', 'description_from']
  @prop 'type', as: URI, aliases: ['typed_as', 'type_from']
  @prop 'moreinfo', as: URL, aliases: ['more_info_as', 'more_info_from']
  @mixin InteractionActivities
  @add 'extension', Extensions

module.exports = ActivityDefinition
