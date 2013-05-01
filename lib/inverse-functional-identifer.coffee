TinCanObject = require './tin-can-object'
AccountObject = require './account-object'

class InverseFunctionalIdentifer extends TinCanObject

  @add 'mbox', String, 'mbox_as', 'mbox_from'
  @add 'account', AccountObject

module.exports = InverseFunctionalIdentifer
