TinFoil = require './tin-foil'

class AccountObject extends TinFoil

  @define 'homepage', as: String, aliases: ['homepage_as', 'homepage_from']
  @define 'name', as: String, aliases: ['named', 'name_from']

module.exports = AccountObject
