TinFoilObject = require './tin-foil-object'

class AccountObject extends TinFoilObject

  @prop 'homepage', as: String, aliases: ['homepage_as', 'homepage_from']
  @prop 'name', as: String, aliases: ['named', 'name_from']

module.exports = AccountObject
