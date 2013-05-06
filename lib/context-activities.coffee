TinFoilObject = require './tin-foil-object'

class ContextActivities extends TinFoilObject

  @prop 'parent', as: String, aliases: ['parented_as', 'parent_from']
  @prop 'grouping', as: String, aliases: ['grouping_as', 'grouping_from']
  @prop 'category', as: String, aliases: ['category_as', 'category_from']
  @prop 'other', as: String, aliases: ['other_as', 'other_from']

module.exports = ContextActivities
