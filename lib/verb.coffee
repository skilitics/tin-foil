TinFoilObject = require './tin-foil-object'
URI = String
LanguageMap = Object

class Verb extends TinFoilObject

  @prop 'id', as: URI, aliases: ['identified_as', 'identify_from']
  @prop 'display', as: LanguageMap, aliases: ['displayed_as', 'display_from']

module.exports = Verb
