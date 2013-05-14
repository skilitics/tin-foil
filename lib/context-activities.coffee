TinFoil = require './tin-foil'

class ContextActivities extends TinFoil

  @define 'parent', as: {}, with_aliases: ['parented_as', 'parent_from']
  @define 'grouping', as: {}, with_aliases: ['grouping_as', 'grouping_from']
  @define 'category', as: {}, with_aliases: ['category_as', 'category_from']
  @define 'other', as: {}, with_aliases: ['other_as', 'other_from']

module.exports = ContextActivities
