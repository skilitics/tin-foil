TinFoil = require './tin-foil'
URI = String
LanguageMap = Object

class Verb extends TinFoil

  @define 'id', as: URI, aliases: ['identified_as', 'identify_from']
  @define 'display', as: LanguageMap, aliases: ['displayed_as', 'display_from']

module.exports = Verb
