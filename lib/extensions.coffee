TinFoilObject = require './tin-foil-object'
LanguageMap = require './language-map'

class Extensions extends TinFoilObject

  @add 'name', LanguageMap
  @add 'description', LanguageMap

module.exports = Extensions
