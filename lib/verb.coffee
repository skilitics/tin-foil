TinCanObject = require './tin-can-object'
URI = String
LanguageMap = Object

class Verb extends TinCanObject

  @add 'id', URI, 'identified_as', 'id_from'
  @add 'display', LanguageMap, 'displayed_as', 'display_from'

module.exports = Verb
