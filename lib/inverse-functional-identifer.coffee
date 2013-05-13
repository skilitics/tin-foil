TinFoil = require './tin-foil'
AccountObject = require './account-object'

URI = {}

class InverseFunctionalIdentifer extends TinFoil

  @define 'mbox', as: String, with_aliases: ['mbox_as', 'mbox_from']
#  @set 'mbox_sha1sum', -> toSha1Sum(@get('mbox').value)

  @define 'openID', as: URI, with_aliases: ['openId_as', 'openId_from']
  @define 'account', as: AccountObject, with_prefix: 'account_'

module.exports = InverseFunctionalIdentifer
