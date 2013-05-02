Context = require '../lib/context'
props = require './behaviours/props'

describe 'Context', ->

  before -> @context = Context.extend()

  describe 'registration', ->
    props.shouldHaveProp 'context', 'registration'
    props.shouldHaveAlias 'context', 'registration', 'registered_as'
    props.shouldHaveAlias 'context', 'registration', 'registration_from'

    it 'should validate as a UUID'

  describe 'instructor', ->
    props.shouldHaveProp 'context', 'instructor'

    it 'should validate as an Agent'