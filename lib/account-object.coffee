TinFoil = require './tin-foil'

class AccountObject extends TinFoil

  @define 'homepage', as: String, with_aliases: ['homepage_as', 'homepage_from']
  @define 'name', as: String, with_aliases: ['named', 'name_from']

module.exports = AccountObject
