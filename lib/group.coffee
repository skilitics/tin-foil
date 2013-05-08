TinFoil = require './tin-foil'
TinFoilCollection = require './tin-foil-collection'

class Group extends TinFoil

  @set 'objectType', to: 'Group'

  @define 'name', as: String, aliases: ['named', 'name_from']
  @define 'member', as: TinFoilCollection, aliases: ['add_member']

module.exports = Group
