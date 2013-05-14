Agent = require '../lib/agent'
props = require './behaviours/definitions'
shouldBehaveLike = require './behaviours/should-behave-like'

describe 'Agent', ->

  before -> @agent = Agent.extend()

  describe 'objectType', ->
    it 'should be set to "Agent"', ->
      @agent.should.have.definition 'objectType', 'Agent'

  describe 'name', ->
    props.shouldHaveDefinition 'agent', 'name'
    props.shouldHaveAlias 'agent', 'name', 'named'
    props.shouldHaveAlias 'agent', 'name', 'name_from'

    it 'should validate as a String'

  shouldBehaveLike.inverseFunctionalIdentifier 'agent'
