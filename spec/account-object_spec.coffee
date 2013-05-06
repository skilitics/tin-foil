AccountObject = require '../lib/account-object'
props = require './behaviours/props'

describe 'AccountObject', ->

  before -> @accountObject = AccountObject.extend()

  describe 'homepage', ->
    props.shouldHaveProp 'accountObject', 'homepage'
    props.shouldHaveAlias 'accountObject', 'homepage', 'homepage_as'
    props.shouldHaveAlias 'accountObject', 'homepage', 'homepage_from'

    it 'should validate as a String'

  describe 'name', ->
    props.shouldHaveProp 'accountObject', 'name'
    props.shouldHaveAlias 'accountObject', 'name', 'named'
    props.shouldHaveAlias 'accountObject', 'name', 'name_from'

    it 'should validate as a String'
