TinFoilObject = require './tin-foil-object'

class ContextActivities extends TinFoilObject

  @prop 'parent', as: Object, aliases: ['parented_as', 'parent_from']
  @prop 'grouping', as: Object, aliases: ['grouping_as', 'grouping_from']
  @prop 'category', as: Object, aliases: ['category_as', 'category_from']
  @prop 'other', as: Object, aliases: ['other_as', 'other_from']

module.exports = ContextActivities
