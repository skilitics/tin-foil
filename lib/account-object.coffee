TinCanObject = require './tin-can-object'

class AccountObject extends TinCanObject

  @add 'homepage', String, 'homepage_as', 'homepage_from'
  @add 'name', String, 'named', 'name_from'

module.exports = AccountObject
