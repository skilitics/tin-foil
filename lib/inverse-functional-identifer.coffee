TinFoilObject = require './tin-foil-object'
AccountObject = require './account-object'

class InverseFunctionalIdentifer extends TinFoilObject

  @add 'mbox', String, 'mbox_as', 'mbox_from'
  @add 'account', AccountObject

module.exports = InverseFunctionalIdentifer
