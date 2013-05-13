TinFoil = require './tin-foil'
TinFoilCollection = require './tin-foil-collection'

class Group extends TinFoil

  @set 'objectType', to: 'Group'

  @define 'name', as: String, with_aliases: ['named', 'name_from']
  @define 'member', as: TinFoilCollection, with_alias: 'add_member'

module.exports = Group
