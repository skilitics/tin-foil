TinFoilObject = require './tin-foil-object'
AccountObject = require './account-object'

URI = {}

class InverseFunctionalIdentifer extends TinFoilObject

  @prop 'mbox', as: String, aliases: ['mbox_as', 'mbox_from']
#  @set 'mbox_sha1sum', -> toSha1Sum(@get('mbox').value)

  @prop 'openID', as: URI, aliases: ['openId_as', 'openId_from']
  @prop 'account', as: AccountObject

module.exports = InverseFunctionalIdentifer
