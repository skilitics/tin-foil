TinCanObject = require './tin-can-object'
#LanguageMap = require './language-map'
LanguageMap = Object
InteractionActivities = require './interaction-activities'
Extensions = require './extensions'
URI = String
URL = String

class ActivityDefinition extends TinCanObject

  @add 'name', LanguageMap, 'named', 'name_from'
  @add 'description', LanguageMap, 'described_as', 'description_from'
  @add 'type', URI, 'typed_as', 'type_from'
  @add 'moreinfo', URL, 'more_info_as', 'more_info_from'
  @mixin InteractionActivities
  @add 'extension', Extensions

module.exports = ActivityDefinition
