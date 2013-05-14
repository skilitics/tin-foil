{ Assertion } = require 'chai'

Assertion.addMethod 'definition', (name, value) ->
  obj = this._obj

  hasDefinition = obj.hasDefinition name

  this.assert(
    hasDefinition
    'expected #{this} to have definition \'' + name + '\' set'
    'expected #{this} to not have definition \'' + name + '\' set'
    name
    obj.props
  )

  if value
    valueSet = obj.definition(name).defaultValue

    this.assert(
      valueSet == value
      'expected #{this} to have \'' + name + '\' set to #{exp} but got #{act}'
      'expected #{this} to not have \'' + name + '\' set to #{exp} but got #{act}'
      value
      valueSet
    )

  this
