TinFoil = require './tin-foil'
TinFoilCollection = require './tin-foil-collection'
ScoreObject = {}

class Result extends TinFoil

  @define 'score', as: ScoreObject, with_prefix: 'score_'
  @define 'success', as: Boolean, with_aliases: ['success_as', 'success_from']
  @define 'completion', as: Boolean, with_aliases: ['completed', 'completion_from']
  @define 'response', as: String, with_aliases: ['response_as', 'response_from']
  @define 'duration', as: Date, with_aliases: ['duration_as', 'duration_from']
  @define 'extensions', as: TinFoilCollection, with_aliases: ['with_extension']

module.exports = Result
