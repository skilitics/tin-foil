TinFoilObject = require './tin-foil-object'
TinFoilCollection = require './tin-foil-collection'

class Group extends TinFoilObject

  @set 'objectType', to: 'Group'

  @prop 'name', as: String, aliases: ['named', 'name_from']
  @prop 'member', as: TinFoilCollection, aliases: ['add_member']

module.exports = Group
