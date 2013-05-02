TinFoilObject = require './tin-foil-object'

class AccountObject extends TinFoilObject

  @add 'homepage', String, 'homepage_as', 'homepage_from'
  @add 'name', String, 'named', 'name_from'

module.exports = AccountObject
