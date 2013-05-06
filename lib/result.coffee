TinFoilObject = require './tin-foil-object'
TinFoilCollection = require './tin-foil-collection'
ScoreObject = {}

class Result extends TinFoilObject

  @prop 'score', as: ScoreObject, aliases: ['scored', 'score_from']
  @prop 'success', as: Boolean, aliases: ['success_as', 'success_from']
  @prop 'completition', as: Boolean, aliases: ['completed', 'completition_from']
  @prop 'response', as: String, aliases: ['response_as', 'response_from']
  @prop 'duration', as: Date, aliases: ['duration_as', 'duration_from']
  @prop 'extensions', as: TinFoilCollection, aliases: ['with_extension']

module.exports = Result
