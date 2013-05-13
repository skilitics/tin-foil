AccountObject = require '../lib/account-object'
props = require './behaviours/definitions'

describe 'AccountObject', ->

  before -> @accountObject = AccountObject.extend()

  describe 'homepage', ->
    props.shouldHaveDefinition 'accountObject', 'homepage'
    props.shouldHaveAlias 'accountObject', 'homepage', 'homepage_as'
    props.shouldHaveAlias 'accountObject', 'homepage', 'homepage_from'

    it 'should validate as a String'

  describe 'name', ->
    props.shouldHaveDefinition 'accountObject', 'name'
    props.shouldHaveAlias 'accountObject', 'name', 'named'
    props.shouldHaveAlias 'accountObject', 'name', 'name_from'

    it 'should validate as a String'
