TinCanObject = require './tin-can-object'
LanguageMap = require './language-map'

class Extensions extends TinCanObject

  @add 'name', LanguageMap
  @add 'description', LanguageMap

module.exports = Extensions
