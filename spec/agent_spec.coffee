Agent = require '../lib/agent'
props = require './behaviours/props'

describe 'Agent', ->

  before -> @agent = Agent.extend()

  describe 'objectType', ->
    it 'should be set to "Agent"', ->
      @agent.should.have.prop 'objectType', 'Agent'

  describe 'name', ->
    props.shouldHaveProp 'agent', 'name'
    props.shouldHaveAlias 'agent', 'name', 'named'
    props.shouldHaveAlias 'agent', 'name', 'name_from'

    it 'should validate as a String'

# behavesLike.inverseFunctionalIdentifier()
