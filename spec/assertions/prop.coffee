{ Assertion } = require 'chai'

Assertion.addMethod 'prop', (name, value) ->
  obj = this._obj

  hasProp = obj.hasProp name

  this.assert(
    hasProp
    'expected #{this} to have prop \'' + name + '\' set'
    'expected #{this} to not have prop \'' + name + '\' set'
    name
    obj.props
  )

  if value
    valueSet = obj.get(name).value

    this.assert(
      valueSet == value
      'expected #{this} to have \'' + name + '\' set to #{exp} but got #{act}'
      'expected #{this} to not have \'' + name + '\' set to #{exp} but got #{act}'
      value
      valueSet
    )

  this
