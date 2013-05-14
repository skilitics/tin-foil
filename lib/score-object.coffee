TinFoil = require './tin-foil'

class ScoreObject extends TinFoil

  @define 'scaled', as: {}, with_aliases: ['scaled_as', 'scaled_from']
  @define 'raw', as: {}, with_aliases: ['raw_as', 'raw_from']
  @define 'min', as: {}, with_aliases: ['min_as', 'min_from']
  @define 'max', as: {}, with_aliases: ['max_as', 'max_from']

module.exports = ScoreObject
