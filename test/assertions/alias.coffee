{ Assertion } = require 'chai'

Assertion.addMethod 'alias', (name) ->
  obj = this._obj

  inArray = name in obj.aliases

  this.assert(
    inArray
    'expected \'' + obj.name + '\' to have an alias of #{exp} but only found: #{act}'
    'expected \'' + obj.name + '\' to not have an alias of #{exp} in: #{act}'
    name
    obj.aliases
  )
