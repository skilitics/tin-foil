TinFoil = require './tin-foil'
TinFoilCollection = require './tin-foil-collection'
ScoreObject = {}

class Result extends TinFoil

  @define 'score', as: ScoreObject, aliases: ['scored', 'score_from']
  @define 'success', as: Boolean, aliases: ['success_as', 'success_from']
  @define 'completion', as: Boolean, aliases: ['completed', 'completion_from']
  @define 'response', as: String, aliases: ['response_as', 'response_from']
  @define 'duration', as: Date, aliases: ['duration_as', 'duration_from']
  @define 'extensions', as: TinFoilCollection, aliases: ['with_extension']

module.exports = Result
