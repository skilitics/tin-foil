TinFoil = require './tin-foil'
URI = String
LanguageMap = Object

class Verb extends TinFoil

  @define 'id', as: URI, with_aliases: ['identified_as', 'identify_from']
  @define 'display', as: LanguageMap, with_aliases: ['displayed_as', 'display_from']

module.exports = Verb
