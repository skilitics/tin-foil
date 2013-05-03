AccountObject = require '../lib/account-object'
props = require './behaviours/props'

describe 'AccountObject', ->

  before -> @accountObject = AccountObject.extend()

  describe 'homepage', ->
    props.shouldHaveProp 'accountObject', 'homepage'

    it 'should validate as a String'