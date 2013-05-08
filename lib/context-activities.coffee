TinFoil = require './tin-foil'

class ContextActivities extends TinFoil

  @define 'parent', as: Object, aliases: ['parented_as', 'parent_from']
  @define 'grouping', as: Object, aliases: ['grouping_as', 'grouping_from']
  @define 'category', as: Object, aliases: ['category_as', 'category_from']
  @define 'other', as: Object, aliases: ['other_as', 'other_from']

module.exports = ContextActivities
